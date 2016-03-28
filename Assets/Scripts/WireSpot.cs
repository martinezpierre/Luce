using UnityEngine;

[ExecuteInEditMode]
public class WireSpot : MonoBehaviour {
    public Vector3[] points;
    [HideInInspector]
    public Wire[] wireStart, wireEnd;

    void Awake() {
        wireStart = new Wire[points.Length];
        wireEnd = new Wire[points.Length];
    }
}
