using UnityEngine;
using UnityEditor;

public class MenuItems : EditorWindow
{
    string myString = "Hello World";
    bool groupEnabled;
    bool myBool = true;
    float myFloat = 1.23f;

    EnemyController.PatrolStyle patrolStyle = EnemyController.PatrolStyle.IDLE;

    // Add menu named "My Window" to the Window menu
    [MenuItem("Tools/Add Enemy")]
    static void Init()
    {
        // Get existing open window or if none, make a new one:
        MenuItems window = (MenuItems)EditorWindow.GetWindow(typeof(MenuItems));
        window.Show();
    }

    void OnGUI()
    {
        GUILayout.Label("Base Settings", EditorStyles.boldLabel);
        myString = EditorGUILayout.TextField("Enemy", myString);

        patrolStyle = (EnemyController.PatrolStyle)EditorGUILayout.EnumPopup("Primitive to create:", patrolStyle);

        groupEnabled = EditorGUILayout.BeginToggleGroup("Optional Settings", groupEnabled);
        myBool = EditorGUILayout.Toggle("Toggle", myBool);
        myFloat = EditorGUILayout.Slider("Slider", myFloat, -3, 3);
        EditorGUILayout.EndToggleGroup();

        if (GUILayout.Button("Create"))
            InstantiatePrimitive();
    }

    void InstantiatePrimitive()
    {
        GameObject enemyParent = GameObject.Find("Enemies");
        if (!enemyParent)
        {
            enemyParent = new GameObject("Enemies");
        }

        GameObject enemy = Instantiate(Resources.Load("Prefabs/Enemy")) as GameObject;

        enemy.transform.parent = enemyParent.transform;

        EnemyController eC = enemy.GetComponent<EnemyController>();

        eC.patrolStyle = patrolStyle;
    }
}