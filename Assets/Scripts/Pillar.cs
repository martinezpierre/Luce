using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Pillar : MonoBehaviour {

    LampManager lm;
    
    public List<LampController> lamps = new List<LampController>();

    public List<GameObject> darkmatters = new List<GameObject>();

    public List<GameObject> level4Objects = new List<GameObject>();

    // Use this for initialization
    void Start () {
        lm = LampManager.Instance;
    }

    // Update is called once per frame
    void Update()
    {
        if (lm.nbLampLighted >= lamps.Count)
        {
            //last
            foreach (GameObject ob in level4Objects)
            {
                ob.SetActive(true);
            }
        }
        else if(lm.nbLampLighted >= lamps.Count * 2 / 3)
        {
            //second
            GetComponent<Renderer>().material.SetFloat("_blend", 1);
        }
        else if(lm.nbLampLighted >= lamps.Count * 1 / 3)
        {
            //first
            foreach(GameObject darkmat in darkmatters)
            {
                darkmat.SetActive(false);
            }
        }
    }
}
