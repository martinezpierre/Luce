using UnityEngine;
using System.Collections;

public class CameraFollow : MonoBehaviour {

    public Transform target;

    public float distance = 5f;

    public float moveSpeed = 5f;

	// Use this for initialization
	void Start () {
        transform.parent = target;
	}
	
	// Update is called once per frame
	void Update () {
        /*if (target && Vector3.Distance(transform.position, target.position) > distance)
        {
            transform.position = Vector3.MoveTowards(transform.position, target.position, Time.deltaTime * moveSpeed);
        }
        if (target)
        {
            transform.LookAt(target.transform);
        }*/
    }
}
