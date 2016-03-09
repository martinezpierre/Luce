using UnityEngine;
using System.Collections;

public class EnemyController : MonoBehaviour {
    
    public float moveSpeed = 6f; // move speed
    float lerpSpeed  = 10; // smoothing speed
    float gravity = 10; // gravity acceleration
    bool isGrounded;
    float deltaGround  = 0.2f; // character is grounded up to this distance
    public float jumpRange  = .1f; // range to detect target wall
    public float GroundDetection = 0.5f;

    private Vector3 surfaceNormal; // current surface normal
    private Vector3 myNormal; // character normal
    private float distGround; // distance from character position to ground
    private bool jumping = false; // flag &quot;I'm jumping to wall&quot;

    private GameObject finder;

    public enum PatrolStyle
    {
        IDLE,
        FOWARD,
        WAYPOINTS,
    }

    public PatrolStyle patrolStyle = PatrolStyle.IDLE;

    public Transform[] waypoints;
    int wayPointIndex = 0;
    Transform target;

    void Start()
    {
        myNormal = transform.up; // normal starts as character up direction 
        
        GetComponent<Rigidbody>().freezeRotation = true; // disable physics rotation
                                         // distance from transform.position to ground
        distGround = GetComponent<CapsuleCollider>().bounds.extents.y - GetComponent<CapsuleCollider>().center.y;

        finder = transform.Find("finder").gameObject;


    }

    void FixedUpdate()
    {
        // apply constant weight force according to character normal:
        GetComponent<Rigidbody>().AddForce(-gravity * GetComponent<Rigidbody>().mass * myNormal);
    }

    void Update()
    {
        if (jumping) return;  // abort Update while jumping to a wall
        Ray ray;
        RaycastHit hit;

        ray = new Ray(transform.position, transform.forward);
        if (Physics.Raycast(ray, out hit, jumpRange) && hit.transform.gameObject.tag == "Building")
        { // wall ahead?
            StartCoroutine(JumpToWall(hit.point, hit.normal,false)); // yes: jump to the wall
        }
        
        // update surface normal and isGrounded:
        ray = new Ray(transform.position, -myNormal); // cast ray downwards

        if (Physics.Raycast(ray, out hit, hit.distance+GroundDetection))
        { // use it to update myNormal and isGrounded
            isGrounded = hit.distance <= distGround + deltaGround;

            if (isGrounded && hit.transform.gameObject.tag == "Floor")
            {
               GameOver();
            }

            surfaceNormal = hit.normal;
        }
        else
        {

            Vector3 newforward = -0.5f * (transform.forward + surfaceNormal);

            ray = new Ray(finder.transform.position, newforward);
            Debug.DrawLine(ray.origin, ray.direction, Color.red, 1000f);

            if (Physics.Raycast(ray, out hit, 100) && hit.transform.gameObject.tag == "Building")
            { // wall ahead?
                StartCoroutine(JumpToWall(hit.point, hit.normal,false)); // yes: jump to the wall
            }
            
        }

        myNormal = Vector3.Lerp(myNormal, surfaceNormal, lerpSpeed * Time.deltaTime);
        // find forward direction with new myNormal:
        //var myForward = Vector3.Cross(transform.right, myNormal);
        // align character to the new myNormal while keeping the forward direction:
        //var targetRot = Quaternion.LookRotation(myForward, myNormal);
        //transform.rotation = Quaternion.Lerp(transform.rotation, targetRot, lerpSpeed * Time.deltaTime);

        if(patrolStyle == PatrolStyle.FOWARD)
        {
            transform.Translate(0, 0, moveSpeed * Time.deltaTime);
        }
        else if(patrolStyle == PatrolStyle.WAYPOINTS)
        {
            Patrol();

        }
    }

    void Patrol()
    {
        float step = moveSpeed * Time.deltaTime;

        float stoppingDistance = 0.1f;

        target = waypoints[wayPointIndex];

        if (Vector3.Distance(transform.position, target.position) < stoppingDistance)
        {
            // ... increment the wayPointIndex.
            if (wayPointIndex == waypoints.Length - 1)
            {
                wayPointIndex = 0;
            }
            else
            {
                wayPointIndex++;
            }
        }
        else
        {
            // Set the destination to the patrolWayPoint.
            transform.position = Vector3.MoveTowards(transform.position, target.position, step);
            transform.LookAt(target.position);
        }

    }

    IEnumerator JumpToWall(Vector3 point, Vector3 normal, bool smooth)
    {
        // jump to wall 
        jumping = true; // signal it's jumping to wall
        GetComponent<Rigidbody>().isKinematic = true; // disable physics while jumping

        Vector3 orgPos = transform.position;
        Quaternion orgRot = transform.rotation;
        Vector3 dstPos = point + normal * distGround; // will jump to 0.5 above wall
        Vector3 myForward = Vector3.Cross(transform.right, normal);
        Quaternion dstRot = Quaternion.LookRotation(myForward, normal);

        for (float t = 0.0f; t < 1.0;)
        {
            t += Time.deltaTime;
            transform.position = Vector3.Lerp(orgPos, dstPos, t);
            transform.rotation = Quaternion.Slerp(orgRot, dstRot, t);
            yield return null; // return here next frame
        }
        
        myNormal = normal; // update myNormal
        GetComponent<Rigidbody>().isKinematic = false; // enable physics
        jumping = false; // jumping to wall finished
    }

    void GameOver()
    {
        Destroy(gameObject);
    }

}
