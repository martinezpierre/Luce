using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Face))]
public class FaceEditor : Editor {

    void OnSceneGUI() {
        if (Event.current.type == EventType.MouseUp && Event.current.button == 1 && Selection.activeTransform.parent != null && Selection.activeTransform.parent.GetComponent<Building>()) {
            Selection.activeTransform = Selection.activeTransform.parent;
            SetExpandedRecursive(Selection.activeTransform.gameObject, false);
        }
    }

    public static void SetExpandedRecursive(GameObject go, bool expand) {
        var type = typeof(EditorWindow).Assembly.GetType("UnityEditor.SceneHierarchyWindow");
        var methodInfo = type.GetMethod("SetExpandedRecursive");

        EditorApplication.ExecuteMenuItem("Window/Hierarchy");
        var window = EditorWindow.focusedWindow;

        methodInfo.Invoke(window, new object[] { go.GetInstanceID(), expand });
    }
}
