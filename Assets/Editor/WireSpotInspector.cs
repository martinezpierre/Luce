using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(WireSpot)), CanEditMultipleObjects]
public class WireSpotInspector : Editor {

    // Only Supports 2 electric poles for now

    Transform handleTransform;
    Quaternion handleRotation;
    Vector3 [] points;
    WireSpot wireSpot;
    Object prefab;

    void OnEnable() {
        prefab = AssetDatabase.LoadAssetAtPath("Assets/Resources/Prefabs/Wire.prefab", typeof(Wire));
    }

    public override void OnInspectorGUI() {
        serializedObject.Update();
        DrawDefaultInspector();
        bool selected = serializedObject.targetObjects.Length == 2;
        GUI.enabled = selected;
        if (GUILayout.Button("Link"))
            WireLink();
    }

    void WireLink() {
        WireSpot wireSpotA = (WireSpot)targets[0];
        WireSpot wireSpotB = (WireSpot)targets[1];

        int wireNumber = wireSpotA.points.Length < wireSpotB.points.Length ? wireSpotA.points.Length : wireSpotB.points.Length;
        
        for (int i = 0; i < wireNumber; i++) {
            Vector3 p0 = wireSpotA.transform.TransformPoint(wireSpotA.points[i]);
            Vector3 p1 = wireSpotB.transform.TransformPoint(wireSpotB.points[i]);
            Wire wire = (Wire) Instantiate(prefab, (p0 + p1) / 2, Quaternion.identity);

            wire.startPoint = wire.transform.InverseTransformPoint(p0);
            wire.endPoint = wire.transform.InverseTransformPoint(p1);

            // VÉRIFIER SI DÉJÀ CONNECTÉ
            wireSpotA.wireStart[i] = wire;
            wireSpotB.wireEnd[i] = wire;
        }
    }

    void OnSceneGUI() {
        wireSpot = (WireSpot)target;

        handleTransform = wireSpot.transform;
        handleRotation = Tools.pivotRotation == PivotRotation.Local ? handleTransform.rotation : Quaternion.identity;
        points = new Vector3[wireSpot.points.Length];

        for (int i = 0; i < wireSpot.points.Length; i++)
            points[i] = handleTransform.TransformPoint(wireSpot.points[i]);

        for (int i = 0; i < wireSpot.points.Length; i++) {
            EditorGUI.BeginChangeCheck();
            points[i] = Handles.DoPositionHandle(points[i], handleRotation);
            if (EditorGUI.EndChangeCheck()) {
                Undo.RecordObject(wireSpot, "Move Point");
                EditorUtility.SetDirty(wireSpot);
                wireSpot.points[i] = handleTransform.InverseTransformPoint(points[i]);
            }
            if (wireSpot.wireStart[i] != null) {
                wireSpot.wireStart[i].startPoint = wireSpot.wireStart[i].transform.InverseTransformPoint(handleTransform.TransformPoint(wireSpot.points[i]));
                wireSpot.wireStart[i].Draw();
            }
            if (wireSpot.wireEnd[i] != null) {
                wireSpot.wireEnd[i].endPoint = wireSpot.wireEnd[i].transform.InverseTransformPoint(handleTransform.TransformPoint(wireSpot.points[i]));
                wireSpot.wireEnd[i].Draw();
            }
        }
    }

}
