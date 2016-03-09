using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Aura : MonoBehaviour {

    List<GameObject> darkMatters;

	// Use this for initialization
	void Start () {
        darkMatters = new List<GameObject>();
    }
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Floor")
        {
            other.GetComponent<Renderer>().material.color = Color.gray;
            other.tag = "Building";
            darkMatters.Add(other.gameObject);
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (darkMatters.Contains(other.gameObject))
        {
            other.GetComponent<Renderer>().material.color = Color.black;
            other.tag = "Floor";
            darkMatters.Remove(other.gameObject);
        }
    }
}
