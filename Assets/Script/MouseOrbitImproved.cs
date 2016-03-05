using UnityEngine;
using System.Collections;

[AddComponentMenu("Camera-Control/Mouse Orbit with zoom")]
public class MouseOrbitImproved : MonoBehaviour
{

    public Transform target;
    public Material corpMaterial;

    public float distance = 5.0f;
    public float xSpeed = 120.0f;
    public float ySpeed = 120.0f;

    public float yMinLimit = -20f;
    public float yMaxLimit = 80f;

    public float distanceMin = .5f;
    public float distanceMax = 15f;

    float x = 0.0f;
    float y = 0.0f;

    float distanceCoef;

    PlayerController pC;

    // Use this for initialization
    void Start()
    {
        pC = FindObjectOfType<PlayerController>();

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        Vector3 angles = transform.eulerAngles;
        x = angles.y;
        y = angles.x;

        distanceCoef = 1f;

        corpMaterial.SetFloat("_Transparent", distanceCoef);
    }

    bool correcting = false;
    bool aiming = false;
    
    void LateUpdate()
    {

        if (Input.GetKeyDown("escape"))
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }

        if (Input.GetMouseButtonDown(1))
        {
            Debug.Log("click");
            Cursor.lockState = CursorLockMode.None;
            //Cursor.visible = true;
            aiming = true;
            pC.aim.enabled = true;
        }
        else if (Input.GetMouseButtonUp(1))
        {
            aiming = false;
            Cursor.visible = false;
            Cursor.lockState = CursorLockMode.Locked;
            pC.aim.enabled = false;
        }

        if (aiming || PlayerController.fpsView) return;

        x += Input.GetAxis("Mouse X") * xSpeed * distance * 0.02f;
        if (target.GetComponent<PlayerController>().jumping && target.GetComponent<PlayerController>().somethingFoward)
        {
            if (!correcting)
            {
                StartCoroutine(correctCameraAngle());
            }
        }

        if (!correcting)
        {
            y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;
        }

        y = ClampAngle(y, yMinLimit, yMaxLimit);
        Quaternion rotation = Quaternion.Euler(y, 0, 0);

        distance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * 5, distanceMin, distanceMax);

        //camera change

        RaycastHit hit;

        if (Physics.Linecast(target.position, transform.position, out hit) && hit.transform.tag == "Building")
        {
            distance -= .25f; //hit.distance;
        }
        else if(!Physics.Raycast(transform.position, -transform.forward, out hit, 1f))
        {
            distance += .25f;
        }

        distanceCoef = distance / distanceMax;

        corpMaterial.SetFloat("_Transparent", distanceCoef);
        
        Vector3 negDistance = new Vector3(0.0f, 0.0f, -distance);
        Vector3 position = rotation * negDistance;

        transform.localRotation = rotation;
        transform.localPosition = position;
    }

    public void startCorrection()
    {
        StartCoroutine(correctCameraAngle());
    }

    IEnumerator correctCameraAngle()
    {
        correcting = true;

        float dif = yMaxLimit - y;

        while (y < yMaxLimit)
        {
            y += dif / 50f;
            yield return new WaitForEndOfFrame();
        }
        correcting = false;
    }

    public static float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360F)
            angle += 360F;
        if (angle > 360F)
            angle -= 360F;
        return Mathf.Clamp(angle, min, max);
    }
}

/*using UnityEngine;
using System.Collections;

[AddComponentMenu("Camera-Control/Mouse Orbit with zoom")]
public class MouseOrbitImproved : MonoBehaviour
{

    public Transform target;
    public float distance = 5.0f;
    public float xSpeed = 120.0f;
    public float ySpeed = 120.0f;

    public float yMinLimit = -20f;
    public float yMaxLimit = 80f;

    public float distanceMin = .5f;
    public float distanceMax = 15f;

    private Rigidbody rigidbody;

    float x = 0.0f;
    float y = 0.0f;

    // Use this for initialization
    void Start()
    {
        Vector3 angles = transform.localEulerAngles;
        x = angles.y;
        y = angles.x;

        rigidbody = GetComponent<Rigidbody>();

        // Make the rigid body not change rotation
        if (rigidbody != null)
        {
            rigidbody.freezeRotation = true;
        }
    }

    void LateUpdate()
    {
        if (target && !Input.GetMouseButton(1))
        {
            //x += Input.GetAxis("Mouse X") * xSpeed * distance * 0.02f;
            y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;

            y = ClampAngle(y, yMinLimit, yMaxLimit);

            Quaternion rotation = Quaternion.Euler(y, x, 0);

            distance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * 5, distanceMin, distanceMax);

            RaycastHit hit;
            if (Physics.Linecast(target.position, transform.position, out hit) && hit.transform.tag == "Building")
            {
                distance -= hit.distance/2;
            }

            Vector3 negDistance = new Vector3(0.0f, 0.0f, -distance);
            Vector3 position = rotation * negDistance + target.position;

            transform.localRotation = rotation;
            transform.localPosition = position;
        }
    }

    public static float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360F)
            angle += 360F;
        if (angle > 360F)
            angle -= 360F;
        return Mathf.Clamp(angle, min, max);
    }
}*/