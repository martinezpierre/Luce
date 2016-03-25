using UnityEngine;
using System.Collections;

public class LimbController : MonoBehaviour {

    public GameObject feet;
    public GameObject highPos;
    Vector3 target;

    public GameObject controller;

    public float speed = 5f;
    public float maxLength = 2f;

    RaycastHit hit;
    
    float feetHeigh;
    
    // Use this for initialization
    void Start () {
        
        feetHeigh = feet.GetComponent<BoxCollider>().bounds.extents.y;

        Debug.Log(feetHeigh);
	}
	
	// Update is called once per frame
	void Update () {
        
    }

    public void StartLimbMove()
    {
        StartCoroutine(MoveLimb());
    }

    IEnumerator MoveLimb()
    {
        bool canMove = true;

        bool up = true;
        
        target = highPos.transform.position;

        while (canMove)
        {
            if (up)
            {
                target = highPos.transform.position;
            }

            /*if(!(up && highPos.transform.localPosition.x < feet.transform.localPosition.x))
            {*/
                float step = speed * Time.deltaTime;
                feet.transform.position = Vector3.MoveTowards(feet.transform.position, target, step);
            //}
            
            if(Vector3.Distance(feet.transform.position, target) <= 0.01f)
            {
                if (up)
                {
                    Vector3 direction = controller.transform.forward - controller.transform.up;

                    //Debug.DrawLine(feet.transform.position, feet.transform.position + direction * maxLength, Color.red, 100);

                    if (Physics.Raycast(feet.transform.position, direction, out hit, maxLength) && hit.transform.tag == "Building")
                    {
                        target = hit.point + controller.transform.up * feetHeigh;

                        up = false;
                    }
                }
                else
                {
                    canMove = false;
                }
                
            }
            
            yield return new WaitForSeconds(0.001f);
        }

        controller.GetComponent<newIKController>().NotifyEndMoveLimb(gameObject);
        
    }
}
