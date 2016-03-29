using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Pilar : MonoBehaviour {

    LampManager lm;
    public GameObject fireflies;
    public Material newMat;
    
    public List<LampController> lamps = new List<LampController>();

    // Use this for initialization
    void Start () {
        lm = LampManager.Instance;
    }

    // Update is called once per frame
    void Update()
    {
        if (lm.nbLampLighted >= lamps.Count)
        {
            fireflies.SetActive(true);  
        }
        else if(lm.nbLampLighted >= lamps.Count * 2 / 3)
        {         
            GetComponent<Renderer>().material.color = Color.yellow;
        }
        else if(lm.nbLampLighted >= lamps.Count * 1 / 3)
        {
            GetComponent<Renderer>().material = newMat;
        }
    }
}
