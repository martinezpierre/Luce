using UnityEngine;
using System.Collections;

public class HeadController : MonoBehaviour {

    public float moveSpeed = 5f;

    public float wallDetectionRange = 4f;

    public GameObject headRenderer;

    bool somethingFoward = false;

    float groundDetection = 0;

    RaycastHit hit;

    float radius;
    
    // Use this for initialization
    void Start () {

        radius = headRenderer.GetComponent<Collider>().bounds.extents.z;

        if(Physics.Raycast(transform.position,-transform.up,out hit, 100))
        {
            groundDetection = Vector3.Distance(transform.position, hit.point);
        }
    }
	
	// Update is called once per frame
	void Update () {

        DetectWall();

        Move();
    }

    void DetectWall()
    {
        int multiplicatorFoward = 1;// Input.GetAxis("Vertical") == 0 ? 0 : (int)(Input.GetAxis("Vertical") / Mathf.Abs(Input.GetAxis("Vertical")));
        //int multiplicatorRight = Input.GetAxis("Horizontal") == 0 ? 0 : (int)(Input.GetAxis("Horizontal") / Mathf.Abs(Input.GetAxis("Horizontal")));

        Ray ray = new Ray(transform.position, multiplicatorFoward * transform.forward);
        //Ray rayRight = new Ray(transform.position, multiplicatorRight * transform.right);

        if (Physics.Raycast(ray, out hit, wallDetectionRange) && hit.transform.gameObject.tag == "Building")
        { // wall ahead?
            somethingFoward = true;

            ChangeWall(hit.normal);
        }
        else if (!Physics.Raycast(transform.position - multiplicatorFoward * groundDetection * transform.forward, -transform.up, groundDetection + 1f))
        {
            
            Vector3 newforward = Vector3.zero;
            
            newforward = -0.5f * (multiplicatorFoward * transform.forward + transform.up);
            ray = new Ray(transform.position + multiplicatorFoward * radius * transform.forward, newforward);
            
            Debug.DrawRay(ray.origin, ray.direction, Color.red, 100);

            if (Physics.Raycast(ray, out hit, 5) && hit.transform.gameObject.tag == "Building")
            { // wall ahead?
                
                ChangeWall(hit.normal);
            }
        }
    }

    void ChangeWall(Vector3 normal)
    {
        Vector3 myForward = Vector3.Cross(transform.right, normal);

        Debug.Log(normal + " " + transform.up);

        Quaternion dstRot = Quaternion.LookRotation(myForward, normal);

        transform.rotation = dstRot;
    }

    void Move()
    {
        Vector3 previousPos = transform.position;

        Vector3 move = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));

        move.Normalize();

        move *= Time.deltaTime * moveSpeed;

        transform.Translate(move);
        
        //headRenderer.transform.LookAt(transform.position + (transform.position - previousPos), transform.up);

        //headRenderer.transform.localEulerAngles = new Vector3(0, headRenderer.transform.localEulerAngles.y, 0);
    }
}
