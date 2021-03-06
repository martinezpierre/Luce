﻿using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

[SelectionBase]
[ExecuteInEditMode]
[RequireComponent(typeof(BoxCollider))]
public class Building : MonoBehaviour {

    [System.Serializable]
    public struct EdgePrefab {
        public GameObject neutral, left, right, full;
    }

    public IntVector3 size;
    public Face[] faces;
    public Face emptyFace;
    [Range(0, 1)]
    public float density;
    public EdgePrefab edgePrefab;
    [Range(0, 1)]
    public float[] edges;
    public bool lockStructure;

    float faceSize = 10;
    BoxCollider col;

    void Start() {
        col = GetComponent<BoxCollider>();
        if (!lockStructure) Build();
    }

    public void Build() {
        var children = new List<GameObject>();
        foreach (Transform child in transform) children.Add(child.gameObject);
        children.ForEach(child => DestroyImmediate(child));

        BuildFace(true, transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize/2, 0, (faceSize * size.z / 2)), 0);
        BuildFace(false, transform.position + new Vector3((faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 90);
        BuildFace(true, transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize/2, 0, -(faceSize * size.z / 2)), 180);
        BuildFace(false, transform.position + new Vector3(-(faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize/2), 270);

        BuildCeil(transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, -(faceSize * size.z / 2)), 90);
        BuildCeil(transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize / 2, (faceSize * size.y), -(faceSize * size.z / 2) + faceSize), 270);

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
                    face.transform.position = pos;
                    face.transform.Rotate(0, 0, rot);
                } else {
                    face = (Face)PrefabUtility.InstantiatePrefab(emptyFace);
                    face.transform.position = pos;
                    face.transform.Rotate(0, rot, 0);
                }
                face.transform.parent = transform;
             }
        }

    }

    void BuildCeil(Vector3 o, float rot) {
        for (int j=0; j < size.x; j++) {
            for (int i=0; i < size.z; i++) {
                Face face = (Face)PrefabUtility.InstantiatePrefab(emptyFace);
                face.transform.position = new Vector3(o.x + j * faceSize, o.y, o.z + i * faceSize);
                face.transform.Rotate(rot, 0, 0);
                face.transform.parent = transform;
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
            edge.transform.position = pos;
            edge.transform.Rotate(0, rot, 0, Space.World);
            edge.transform.parent = transform;
        }

    }

    void BuildEdge(float height) {
        float h = height * size.y;
        
        BuildEdgeFace(true, true, transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, (faceSize * size.z / 2)), 0, h);
        BuildEdgeFace(false, false, transform.position + new Vector3((faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 90, h);
        BuildEdgeFace(true, false, transform.position + new Vector3(-(faceSize * size.x / 2) + faceSize / 2, 0, -(faceSize * size.z / 2)), 180, h);
        BuildEdgeFace(false, true, transform.position + new Vector3(-(faceSize * size.x / 2), 0, -(faceSize * size.z / 2) + faceSize / 2), 270, h);
    }
}
