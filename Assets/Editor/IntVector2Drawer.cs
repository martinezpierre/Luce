using UnityEngine;
using UnityEditor;

[CustomPropertyDrawer (typeof(IntVector2))]
public class IntVector2Drawer : PropertyDrawer {

    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label) {
        EditorGUI.BeginProperty(position, label, property);

        position = EditorGUI.PrefixLabel(position, GUIUtility.GetControlID(FocusType.Passive), label);
        
        var indent = EditorGUI.indentLevel;
        EditorGUI.indentLevel = 0;

        var xLabl = new Rect(position.x, position.y, 12, position.height);
        var xRect = new Rect(12 + position.x, position.y, (position.width-24) / 2, position.height);
        var yLabl = new Rect(position.x + position.width / 2, position.y, 12, position.height);
        var yRect = new Rect(12 + position.x + position.width / 2, position.y, (position.width - 24) / 2, position.height);
        
        EditorGUI.LabelField(xLabl, "X");
        EditorGUI.PropertyField(xRect, property.FindPropertyRelative("x"), GUIContent.none);
        EditorGUI.LabelField(yLabl, "Y");
        EditorGUI.PropertyField(yRect, property.FindPropertyRelative("y"), GUIContent.none);

        EditorGUI.indentLevel = indent;
        EditorGUI.EndProperty();
    }

}
