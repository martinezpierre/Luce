using UnityEngine;
using System.Collections;

public class Damager : MonoBehaviour {

	void OnTriggerEnter(Collider other)
    {
        //Debug.Log("ok");
        if (other.tag == "Player")
        {
            other.GetComponentInParent<LifeController>().toucheEnemy = true;
        }
    }

    void OnTriggerExit(Collider other)
    {

        if (other.tag == "Player")
        {
            other.GetComponentInParent<LifeController>().toucheEnemy = false;
        }
    }
}
