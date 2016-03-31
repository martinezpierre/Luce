using UnityEngine;
using System.Collections;

public class Map : MonoBehaviour {

    GameObject player;

	// Use this for initialization
	void Start () {
        player = GameObject.FindGameObjectWithTag("Player");
	}
	
	// Update is called once per frame
	void Update () {
	    if(player && Vector3.Distance(player.transform.position,transform.position) < 5f)
        {
            player.GetComponentInParent<PlayerController>().spawn = transform;
        }
	}
}
