using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

[ExecuteInEditMode]
[RequireComponent(typeof(BoxCollider))]
public class Building : MonoBehaviour {

    [System.Serializable]
    public struct EdgePrefab {
        public GameObject neutral, left, right, full;
    }

    [System.Serializable]
    public struct FaceType {
        public Material material;
        [Range(1,10)]
        public int floors;
    }

    public IntVector3 size;
    public Face[] faces;
    public Face emptyFace;
    [Range(0, 1)]
    public float density;
    public EdgePrefab edgePrefab;
    [Range(0, 1)]
    public float[] edges;
    public FaceType[] faceTypes;
    public bool lockStructure;

    float faceSize = 10;
    BoxCollider col;
    Material[] materials;

    void Start() {
        col = GetComponent<BoxCollider>();
        if (!lockStructure) Build();
    }

    void InitMaterials() {
        materials = new Material[size.y];
        int n = 0;

        for (int i = 0; i < faceTypes.Length; i++) {
            for (int j = 0; j < faceTypes[i].floors; j++) {
                materials[n] = faceTypes[i].material;
                if (n == size.y - 1) break;
                else n++;
            }
            if (n == size.y - 1) break;
        }

        for (int i = 0; i < size.y; i++) {
            if (materials[i] == null)
                materials[i] = faceTypes[faceTypes.Length-1].material;
        }
    }

    public void Build() {
        if (faceTypes.Length > 0) InitMaterials();

        var children = new List<GameObject>();
        foreach (Transform child in transform) children.Add(child.gameObject);
        children.ForEach(child => DestroyImmediate(child));

        BuildFace(true, new Vector3(-(faceSize * size.x / 2) + faceSize/2, 0, (faceSize * size.z / 2)), 0);
        BuildFace(false, new Vector3((faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 90);
        BuildFace(true, new Vector3(-(faceSize * size.x / 2) + faceSize/2, 0, -(faceSize * size.z / 2)), 180);
        BuildFace(false, new Vector3(-(faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize/2), 270);

        BuildCeil(new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, -(faceSize * size.z / 2)), 90);
        BuildCeil(new Vector3(-(faceSize * size.x / 2) + faceSize / 2, (faceSize * size.y), -(faceSize * size.z / 2) + faceSize), 270);

        for (int i =0; i < edges.Length; i++) BuildEdge(edges[i]);

        col.center = new Vector3(0, (size.y * faceSize) / 2, 0);
        col.size = new Vector3(size.x * faceSize, size.y * faceSize, size.z * faceSize);
    }
    
    void BuildFace(bool isx, Vector3 o, float rot) {
        int rsize = isx ? size.x : size.z;

        for (int j=0; j < size.y; j++) {
            for (int i = 0; i < rsize; i++) {
                Vector3 pos = isx ? new Vector3(o.x + i*faceSize, o.y + j*faceSize, o.z) : new Vector3(o.x, o.y + j * faceSize, o.z + i * faceSize);
                Face face;
                if (Random.value < density) {
                    face = (Face)PrefabUtility.InstantiatePrefab(faces[Random.Range(0, faces.Length)]);
                    while (j != 0 && face.firstFloor) {
                        DestroyImmediate(face.gameObject);
                        face = (Face)PrefabUtility.InstantiatePrefab(faces[Random.Range(0, faces.Length)]);
                    }
                } else face = (Face)PrefabUtility.InstantiatePrefab(emptyFace);
                face.transform.parent = transform;
                face.transform.localPosition = pos;
                face.transform.Rotate(transform.localEulerAngles.x, transform.localEulerAngles.y + rot, transform.localEulerAngles.z);
                if (faceTypes.Length > 0) face.SetMaterial(materials[j]);
            }
        }

    }

    void BuildCeil(Vector3 o, float rot) {
        for (int j=0; j < size.x; j++) {
            for (int i=0; i < size.z; i++) {
                Face face = (Face)PrefabUtility.InstantiatePrefab(emptyFace);
                face.transform.parent = transform;
                face.transform.localPosition = new Vector3(o.x + j * faceSize, o.y, o.z + i * faceSize);
                face.transform.Rotate(transform.localEulerAngles.x+rot, transform.localEulerAngles.y, transform.localEulerAngles.z);
                if (faceTypes.Length > 0) {
                    if (rot == 90) face.SetMaterial(materials[0]);
                    else  face.SetMaterial(materials[size.y - 1]);
                }
            }
        }
    }

    void BuildEdgeFace(bool isx, bool invert, Vector3 o, float rot, float h) {
        int rsize = isx ? size.x : size.z;
        
        for (int i = 0; i < rsize; i++) {
            Vector3 pos = isx ? new Vector3(o.x + i * faceSize, o.y + h * faceSize, o.z) : new Vector3(o.x, o.y + h * faceSize, o.z + i * faceSize);
            GameObject edge, prefab = edgePrefab.neutral;
            if (i == 0 && i == rsize-1) prefab = edgePrefab.full;
            else if (i == 0 && !invert || i == rsize-1 && invert) prefab = edgePrefab.left;
            else if (i == rsize-1 && !invert || i == 0 && invert) prefab = edgePrefab.right;
            edge = (GameObject)PrefabUtility.InstantiatePrefab(prefab);
            edge.transform.parent = transform;
            edge.transform.localPosition = pos;
            edge.transform.Rotate(transform.localEulerAngles.x, transform.localEulerAngles.y+rot, transform.localEulerAngles.z, Space.World);
        }

    }

    void BuildEdge(float height) {
        float h = height * size.y;
        
        BuildEdgeFace(true, true, new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, (faceSize * size.z / 2)), 0, h);
        BuildEdgeFace(false, false, new Vector3((faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 90, h);
        BuildEdgeFace(true, false, new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, -(faceSize * size.z / 2)), 180, h);
        BuildEdgeFace(false, true, new Vector3(-(faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 270, h);
    }
}
