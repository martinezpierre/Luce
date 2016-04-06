using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour
{
    [HideInInspector]
    public Transform spawn = null;

    public float moveSpeed = 6f; // move speed
    float lerpSpeed = 10; // smoothing speed
    float gravity = 10; // gravity acceleration
    bool isGrounded;
    float deltaGround = 0.2f; // character is grounded up to this distance
    public float jumpRange = .1f; // range to detect target wall
    public float GroundDetection = 0.5f;

    public float maxDistance = 100f;

    private Vector3 surfaceNormal; // current surface normal
    private Vector3 myNormal; // character normal
    private float distGround; // distance from character position to ground
    [HideInInspector]
    public bool jumping = false; // flag &quot;I'm jumping to wall&quot;

    private GameObject finder;
    private GameObject finderRear;
    private GameObject grapin;

    bool falling = false;

    [HideInInspector]
    public bool somethingFoward = false;

    [HideInInspector]
    public static bool fpsView = false;

    Vector3 grapinPos;

    public MouseLook BodyMouseLook;
    public MouseLook CameraMouseLook;

    [HideInInspector]
    public Image aim;

    public Sprite defaultAim;
    public Sprite unreachableAim;
    public Sprite canReachAim;
    public Sprite canHookAim;

    public bool canJump = true;

    public float hookSize = 10f;

    Animator aC;

    float sizeZ;

    void Start()
    {
        aC = GetComponentInChildren<Animator>();
        
        spawn = transform;

        aim = GameObject.Find("Aim").GetComponent<Image>();

        aim.sprite = defaultAim;

        aim.enabled = false;

        myNormal = transform.up; // normal starts as character up direction 

        GetComponent<Rigidbody>().freezeRotation = true; // disable physics rotation
                                                         // distance from transform.position to ground
        distGround = GetComponentInChildren<CapsuleCollider>().bounds.extents.y - GetComponentInChildren<CapsuleCollider>().center.y;

        sizeZ = GetComponentInChildren<CapsuleCollider>().bounds.extents.z;

        finder = transform.Find("finder").gameObject;
        finderRear = transform.Find("finderRear").gameObject;
        grapin = transform.Find("grapin").gameObject;

        grapinPos = grapin.transform.localPosition;

    }

    void FixedUpdate()
    {
        // apply constant weight force according to character normal:
        GetComponent<Rigidbody>().AddForce(-gravity * GetComponent<Rigidbody>().mass * myNormal);
    }

    public void TriggerDetect(Collider other)
    {
        if (other.gameObject.tag == "Building" || other.gameObject.tag == "Floor")
        {
            if (falling)
            {
                falling = false;
            }
            if (other.gameObject.tag == "Floor")
            {
                GameOver();
            }
        }
    }

    void Update()
    {

        if (jumping || falling) return;  // abort Update while jumping to a wall

        Ray ray = new Ray();
        RaycastHit hit;

        aim.transform.position = Input.mousePosition;
        if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit, maxDistance))
        {
            if (hit.transform.gameObject.tag == "Building")
            {
                aim.sprite = canReachAim;
            }
            else if (hit.transform.gameObject.tag == "Hookable")
            {
                aim.sprite = canHookAim;
            }
            else
            {
                aim.sprite = unreachableAim;
            }
        }
        else
        {
            aim.sprite = defaultAim;
        }

        if ((Input.GetAxis("Vertical") == 0f && Input.GetAxis("Horizontal") == 0f))
        {
            if (BodyMouseLook.enabled)
            {
                BodyMouseLook.enabled = false;
                CameraMouseLook.enabled = true;
            }
        }
        else if (!BodyMouseLook.enabled)
        {
            BodyMouseLook.enabled = true;
            CameraMouseLook.enabled = false;
            BodyMouseLook.transform.eulerAngles = CameraMouseLook.transform.eulerAngles;
            CameraMouseLook.transform.localEulerAngles = Vector3.zero;
        }

        if (Input.GetAxis("Vertical") < 0)
        {
            ray = new Ray(transform.position, -transform.forward);
        }
        else if (Input.GetAxis("Vertical") > 0)
        {
            ray = new Ray(transform.position, transform.forward);
        }

        if (Physics.Raycast(ray, out hit, jumpRange) && (hit.transform.gameObject.tag == "Building" || hit.transform.gameObject.tag == "Unpraticable"))
        { // wall ahead?
            somethingFoward = true;
            StartCoroutine(JumpToWall(hit.point, hit.normal, false, true)); // yes: jump to the wall

            Debug.Log(hit.normal + " " + myNormal);
        }
        else
        {
            somethingFoward = false;
            //ray = new Ray(transform.position, transform.forward);
            if (Input.GetMouseButtonDown(0))
            {

                //Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
                RaycastHit rHit;

                if (!fpsView)
                {
                    if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out rHit, maxDistance))
                    {
                        if (rHit.transform.gameObject.tag == "Building")
                        {
                            StartCoroutine(JumpToWall(rHit.point, rHit.normal, true, false));
                        }
                        else if (rHit.transform.gameObject.tag == "Hookable")
                        {
                            StartCoroutine(Hook(rHit.point, rHit.normal));
                        }
                    }
                }
                else
                {
                    Vector3 CameraCenter = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width / 2, Screen.height / 2, Camera.main.nearClipPlane));
                    if (Physics.Raycast(CameraCenter, transform.forward, out rHit, maxDistance))
                    {
                        fpsView = !fpsView;
                        transform.Find("CameraFPS").GetComponent<Camera>().enabled = !transform.Find("CameraFPS").GetComponent<Camera>().enabled;
                        transform.Find("Main Camera").GetComponent<Camera>().enabled = !transform.Find("Main Camera").GetComponent<Camera>().enabled;
                        StartCoroutine(JumpToWall(rHit.point, rHit.normal, true, false));
                    }
                }

            }
        }

        // update surface normal and isGrounded:
        ray = new Ray(transform.position, -myNormal); // cast ray downwards

        if (Physics.Raycast(ray, out hit, GroundDetection))
        { // use it to update myNormal and isGrounded

            isGrounded = hit.distance <= distGround + deltaGround;

            if (isGrounded && hit.transform.gameObject.tag == "Floor")
            {
                GameOver();
            }
            else if (isGrounded && hit.transform.gameObject.tag == "Unpraticable")
            {
                myNormal = new Vector3(0, 1, 0);
                falling = true;
            }

            surfaceNormal = hit.normal;
        }
        else
        {
            isGrounded = false;

            Vector3 newforward = Vector3.zero;

            ray = new Ray();
            if (Input.GetAxis("Vertical") < 0)
            {
                newforward = -0.5f * (-transform.forward + surfaceNormal);
                ray = new Ray(finderRear.transform.position, newforward);
            }
            else if (Input.GetAxis("Vertical") > 0)
            {
                newforward = -0.5f * (transform.forward + surfaceNormal);
                ray = new Ray(finder.transform.position, newforward);
            }

            if (Physics.Raycast(ray, out hit, 100) && (hit.transform.gameObject.tag == "Building" || hit.transform.gameObject.tag == "Unpraticable"))
            { // wall ahead?

                Debug.DrawLine(finder.transform.position, hit.point, Color.red, 100f);
                StartCoroutine(JumpToWall(hit.point, hit.normal, false, false)); // yes: jump to the wall
            }

        }

        myNormal = Vector3.Lerp(myNormal, surfaceNormal, lerpSpeed * Time.deltaTime);

        // find forward direction with new myNormal:
        var myForward = Vector3.Cross(transform.right, myNormal);
        // align character to the new myNormal while keeping the forward direction:
        var targetRot = Quaternion.LookRotation(myForward, myNormal);
        transform.rotation = Quaternion.Lerp(transform.rotation, targetRot, lerpSpeed * Time.deltaTime);
        // move the character forth/back with Vertical axis:
        if (!fpsView)
        {
            transform.Translate(0, 0, Input.GetAxis("Vertical") * moveSpeed * Time.deltaTime);
            transform.Translate(Input.GetAxis("Horizontal") * moveSpeed * Time.deltaTime, 0, 0);

        }
        
        aC.SetBool("isWalking", Mathf.Abs(Input.GetAxis("Vertical")) + Mathf.Abs(Input.GetAxis("Horizontal")) > 0);
        
        if (!isGrounded)
        {
            myNormal = Vector3.up;
        }
    }

    IEnumerator JumpToWall(Vector3 point, Vector3 normal, bool smooth, bool convex)
    {
        if (canJump)
        {
            aC.SetBool("Flying", smooth);

            Transform cameraParent = CameraMouseLook.transform/*.GetChild(0)*/;

            Vector3 cameraOriginPos = cameraParent.localPosition;
            Quaternion cameraOriginRot = cameraParent.localRotation;

            if (smooth)
            {
                cameraParent.parent = null;
            }

            // jump to wall 
            jumping = true; // signal it's jumping to wall
            GetComponent<Rigidbody>().isKinematic = true; // disable physics while jumping

            Vector3 orgPos = transform.position;
            Quaternion orgRot = transform.rotation;

            Vector3 dstPos = Vector3.zero;

            if (convex)
            {
                dstPos = point + normal * distGround + myNormal * sizeZ * 3f; // will jump to 0.5 above wall
            }
            else
            {
                dstPos = point + normal * distGround; // will jump to 0.5 above wall
            }

            Vector3 myForward = Vector3.Cross(transform.right, normal);
            Quaternion dstRot = Quaternion.LookRotation(myForward, normal);

            Debug.Log(normal + " " + sizeZ + " " + distGround);

            //Debug.Log(grapinPos+" -> "+dstPos);

            if (smooth)
            {
                for (float t = 0.0f; t < 1.0;)
                {
                    t += Time.deltaTime;
                    grapin.transform.position = Vector3.Lerp(orgPos, dstPos, t);
                    yield return null; // return here next frame
                }
                grapin.transform.parent = null;
            }


            //Camera.main.GetComponent<MouseOrbitImproved>().startCorrection();

            for (float t = 0.0f; t < 1.0;)
            {
                t += Time.deltaTime;
                transform.position = Vector3.Lerp(orgPos, dstPos, t);
                transform.rotation = Quaternion.Slerp(orgRot, dstRot, t);

                if (smooth)
                {
                    cameraParent.position = Vector3.MoveTowards(cameraParent.position, transform.position, t*10000);
                }

                yield return null; // return here next frame
            }


            aC.SetBool("Flying", false);

            if (smooth)
            {


                cameraParent.parent = /*CameraMouseLook.*/transform;
                //cameraParent.transform.localEulerAngles = Vector3.zero;

                Vector3 cameraOrgPos = cameraParent.localPosition;
                Quaternion cameraOrgRot = cameraParent.localRotation;

                for (float t = 0.0f; t < 1.0;)
                {
                    t += Time.deltaTime;
                    cameraParent.localPosition = Vector3.Lerp(cameraOrgPos, cameraOriginPos, t);
                    cameraParent.localRotation = Quaternion.Slerp(cameraOrgRot, cameraOriginRot, t);
                    
                    yield return null; // return here next frame
                }

                /*Vector3 camrot = cameraParent.GetComponentInChildren<Camera>().transform.eulerAngles;
                Vector3 campos = cameraParent.GetComponentInChildren<Camera>().transform.position;

                cameraParent.localRotation = cameraOriginRot;

                cameraParent.GetComponentInChildren<Camera>().transform.eulerAngles = camrot;
                cameraParent.GetComponentInChildren<Camera>().transform.position = campos;*/

            }

            grapin.transform.parent = gameObject.transform;
            grapin.transform.localPosition = grapinPos;
            grapin.transform.localEulerAngles = new Vector3(270, 0, 0);

            myNormal = normal; // update myNormal
            GetComponent<Rigidbody>().isKinematic = false; // enable physics
            jumping = false; // jumping to wall finished


            Camera.main.GetComponent<MouseOrbitImproved>().aiming = false;
            Cursor.visible = false;
            Cursor.lockState = CursorLockMode.Locked;
            aim.enabled = false;

            hooked = false;


        }

        yield return null;


    }

   

    IEnumerator Hook(Vector3 point, Vector3 normal)
    {
        if (canJump)
        {
            aC.SetBool("Flying", true);

            ConfigurableJoint cJ = grapin.GetComponent<ConfigurableJoint>();

            // jump to wall 
            jumping = true; // signal it's jumping to wall
            GetComponent<Rigidbody>().isKinematic = true; // disable physics while jumping

            Vector3 orgPos = transform.position;
            //Quaternion orgRot = transform.rotation;
            Vector3 dstPos = point + normal * distGround; // will jump to 0.5 above wall

            SoftJointLimit sJL = new SoftJointLimit();

            sJL.limit = Vector3.Distance(orgPos, dstPos);

            cJ.linearLimit = sJL;

            for (float t = 0.0f; t < 1.0;)
            {
                t += Time.deltaTime;
                grapin.transform.position = Vector3.Lerp(orgPos, dstPos, t);
                yield return null; // return here next frame
            }


            grapin.transform.parent = null;

            myNormal = normal; // update myNormal
            GetComponent<Rigidbody>().isKinematic = false; // enable physics
            
            while (sJL.limit > hookSize)
            {
                sJL.limit -= 1;

                cJ.linearLimit = sJL;

                yield return null;
            }

            jumping = false; // jumping to wall finished
        }

        hooked = true;

        StartCoroutine(clampVelocity());

        yield return null;
    }

    bool hooked;

    IEnumerator clampVelocity()
    {
        while (hooked)
        {
            Debug.Log("" + GetComponent<Rigidbody>().velocity.magnitude);
            GetComponent<Rigidbody>().velocity = Vector3.ClampMagnitude(GetComponent<Rigidbody>().velocity, 8);
            yield return null;
        }

        yield return null;
    }

    public void GameOver()
    {
        //Destroy(gameObject);
        if (spawn)
        {
            StartCoroutine(FadeGameOver());
        }
        else
        {
        }
    }

    IEnumerator FadeGameOver()
    {
        enabled = false;

        Image deadIm = GameObject.Find("DeadScreen").GetComponent<Image>();
        //Text deadTx = GameObject.Find("DeadText").GetComponent<Text>();

        deadIm.enabled = true;
        deadIm.transform.localScale = new Vector3(Screen.width, Screen.height, 0);
        //deadTx.enabled = true;

        float i = 0;

        for (i = 0f; i < 1; i += 0.05f)
        {
            deadIm.color = new Color(deadIm.color.r, deadIm.color.g, deadIm.color.b, i);
            // deadTx.color = new Color(deadTx.color.r, deadTx.color.g, deadTx.color.b, i);
            yield return new WaitForSeconds(0.01f);
        }

        transform.position = spawn.position;
        transform.rotation = spawn.rotation;
        myNormal = spawn.transform.up;

        yield return new WaitForSeconds(0.1f);

        for (i = 1f; i > 0; i -= 0.05f)
        {
            deadIm.color = new Color(deadIm.color.r, deadIm.color.g, deadIm.color.b, i);
            //deadTx.color = new Color(deadTx.color.r, deadTx.color.g, deadTx.color.b, i);
            yield return new WaitForSeconds(0.01f);
        }

        enabled = true;

    }

}

