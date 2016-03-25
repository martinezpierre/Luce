using UnityEngine;
using System.Collections;

public class HeadController : MonoBehaviour {

    public float moveSpeed = 5f;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

        Vector3 move = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));

        move.Normalize();

        move *= Time.deltaTime * moveSpeed;

        /*transform.Translate(0, 0, Input.GetAxis("Vertical") * moveSpeed * Time.deltaTime);
        transform.Translate(Input.GetAxis("Horizontal") * moveSpeed * Time.deltaTime, 0, 0);*/

        transform.Translate(move);
    }
}
