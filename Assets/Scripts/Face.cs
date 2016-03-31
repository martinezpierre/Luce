using UnityEngine;
public class Face : MonoBehaviour {
    public bool firstFloor;

    public void SetMaterial(Material m) {
        GetComponent<MeshRenderer>().material = m;
    }
}
