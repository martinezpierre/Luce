using UnityEngine;
using UnityEditor;

[CustomPropertyDrawer (typeof(IntVector3))]
public class IntVector3Drawer : PropertyDrawer {

    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label) {
        EditorGUI.BeginProperty(position, label, property);

        position = EditorGUI.PrefixLabel(position, GUIUtility.GetControlID(FocusType.Passive), label);
        
        var indent = EditorGUI.indentLevel;
        EditorGUI.indentLevel = 0;

        var xLabl = new Rect(position.x, position.y, 12, position.height);
        var xRect = new Rect(12 + position.x, position.y, (position.width-36) / 3, position.height);
        var yLabl = new Rect(position.x + position.width / 3, position.y, 12, position.height);
        var yRect = new Rect(12 + position.x + position.width / 3, position.y, (position.width - 36) / 3, position.height);
        var zLabl = new Rect(position.x + 2 * position.width / 3, position.y, 12, position.height);
        var zRect = new Rect(12 + position.x + 2 * position.width / 3, position.y, (position.width - 36) / 3, position.height);
        
        EditorGUI.LabelField(xLabl, "X");
        EditorGUI.PropertyField(xRect, property.FindPropertyRelative("x"), GUIContent.none);
        EditorGUI.LabelField(yLabl, "Y");
        EditorGUI.PropertyField(yRect, property.FindPropertyRelative("y"), GUIContent.none);
        EditorGUI.LabelField(zLabl, "Z");
        EditorGUI.PropertyField(zRect, property.FindPropertyRelative("z"), GUIContent.none);

        EditorGUI.indentLevel = indent;
        EditorGUI.EndProperty();
    }

}
