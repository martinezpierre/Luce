using UnityEngine;

[ExecuteInEditMode]
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
    
    void Start() {
        render = GetComponent<LineRenderer>();
        Draw();
    }

    public void Draw() {
        Vector3 p0 = transform.TransformPoint(startPoint);
        Vector3 p1 = transform.TransformPoint(endPoint);
        mp = (startPoint + endPoint) / 2 + Vector3.down * weight;

        int lineSteps = (int)(Vector3.Distance(p0, p1) / stepSize);
        render.SetVertexCount(lineSteps + 2);
        render.SetWidth(size, size);
        Vector3 lineStart = GetPoint(0);

        for (int i = 0; i <= lineSteps; i++) {
            Vector3 lineEnd = GetPoint(i / (float)lineSteps);
            render.SetPosition(i, lineStart);
            render.SetPosition(i + 1, lineEnd);
            lineStart = lineEnd;
        }
        startPoint = transform.InverseTransformPoint(p0);
        endPoint = transform.InverseTransformPoint(p1);
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
