using UnityEngine;
using System.Collections;

public class LampController : MonoBehaviour {

    bool lighted = false;

    void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Player" && !lighted)
        {
            gameObject.GetComponent<Renderer>().material.color = Color.yellow;
            GetComponent<Light>().enabled = true;
            LampManager.Instance.NewLampLighted(gameObject);
            lighted = true;
        }
    }

}
