using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Wire))]
public class WireInspector : Editor {

    Transform handleTransform;
    Quaternion handleRotation;
    Vector3 p0, p1, mp;

    public override void OnInspectorGUI() {
        DrawDefaultInspector();
        Wire wire = (Wire)target;

        GUILayout.BeginHorizontal();
        if (GUILayout.Button("Start on Pivot")) {
            wire.OnPivot(wire.startPoint);
            Refresh(wire);
        }
        if (GUILayout.Button("Center on Pivot")) {
            wire.OnPivot(wire.mp + Vector3.up * wire.weight * 0.5f);
            Refresh(wire);
        }
        if (GUILayout.Button("End on Pivot")) {
            wire.OnPivot(wire.endPoint);
            Refresh(wire);
        }
        GUILayout.EndHorizontal();
    }

    void Refresh(Wire wire) {

        handleTransform = wire.transform;
        handleRotation = Tools.pivotRotation == PivotRotation.Local ? handleTransform.rotation : Quaternion.identity;
        p0 = handleTransform.TransformPoint(wire.startPoint);
        p1 = handleTransform.TransformPoint(wire.endPoint);
        mp = (p0 + p1) / 2 + Vector3.down * wire.weight;

        if (wire.showStructure) {
            Handles.color = Color.gray;
            Handles.DrawLine(p0, p1);
            Handles.DrawLine(p0, mp);
            Handles.DrawLine(mp, p1);
        }

        int lineSteps = (int)(Vector3.Distance(p0, p1) / wire.stepSize);
        wire.render.SetVertexCount(lineSteps + 2);
        wire.render.SetWidth(wire.size, wire.size);
        Vector3 lineStart = wire.GetPoint(0);

        for (int i = 0; i <= lineSteps; i++) {

            Vector3 lineEnd = wire.GetPoint(i / (float)lineSteps);
            wire.render.SetPosition(i, lineStart);
            wire.render.SetPosition(i + 1, lineEnd);

            if (wire.showStructure) {
                Handles.color = Color.white;
                Handles.DrawLine(lineStart, lineEnd);
            }
            lineStart = lineEnd;
        }

        wire.mp = handleTransform.InverseTransformPoint(mp);
    }

    void OnSceneGUI() {
        Wire wire = (Wire) target;

        Refresh(wire);

        EditorGUI.BeginChangeCheck();
        p0 = Handles.DoPositionHandle(p0, handleRotation);
        if (EditorGUI.EndChangeCheck()) {
            Undo.RecordObject(wire, "Move Point");
            EditorUtility.SetDirty(wire);
            wire.startPoint = handleTransform.InverseTransformPoint(p0);
        }
        
        EditorGUI.BeginChangeCheck();
        p1 = Handles.DoPositionHandle(p1, handleRotation);
        if (EditorGUI.EndChangeCheck()) {
            Undo.RecordObject(wire, "Move Point");
            EditorUtility.SetDirty(wire);
            wire.endPoint = handleTransform.InverseTransformPoint(p1);
        }

    }
}
