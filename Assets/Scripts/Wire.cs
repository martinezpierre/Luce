using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class Wire : MonoBehaviour {

    public Vector3 startPoint, endPoint;
    [HideInInspector]
    public Vector3 mp;
    [Range(0.1f, 10)]
    public float size = 0.5f;
    [Range(0, 20)]
    public float weight = 0.5f;
    [Range(0.1f, 10)]
    public float stepSize = 0.5f;
    public LineRenderer render;
    public bool showStructure;

    void Awake() {
        render = GetComponent<LineRenderer>();
    }

    public Vector3 GetPoint(float t) {
        t = Mathf.Clamp01(t);
        float oneMinusT = 1 - t;

        return transform.TransformPoint((oneMinusT * oneMinusT * startPoint) + (2 * oneMinusT * t * mp) + (t * t * endPoint));
    }

    public void OnPivot(Vector3 point) {
        startPoint -= point;
        endPoint -= point;
    }
}
