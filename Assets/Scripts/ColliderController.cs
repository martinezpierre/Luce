using UnityEngine;
using System.Collections;

public class ColliderController : MonoBehaviour {

    PlayerController pC;

    // Use this for initialization
    void Start () {
        pC = GetComponentInParent<PlayerController>();
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnTriggerEnter(Collider other)
    {
        pC.OnTriggerEnter(other);

        Debug.Log("trigger enter");
    }
}
