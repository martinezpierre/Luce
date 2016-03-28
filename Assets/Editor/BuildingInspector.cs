using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Building)), CanEditMultipleObjects]
public class BuildingInspector : Editor {

    public override void OnInspectorGUI() {
        serializedObject.Update();
        DrawDefaultInspector();
        Building building = (Building)target;
        if (!building.lockStructure && PrefabUtility.GetPrefabType(building) == PrefabType.PrefabInstance && (GUILayout.Button("Rebuild") || GUI.changed))
            building.Build();
    }
}
