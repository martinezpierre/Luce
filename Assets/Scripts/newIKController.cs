using UnityEngine;
using System.Collections;

public class newIKController : MonoBehaviour {

    public LimbController rightLimb;
    public LimbController leftLimb;

    public GameObject mustFollow;

    public bool lookAt = true;

    public float distFollow = 2f;

    public float moveSpeed = 5f;

	// Use this for initialization
	void Start () {
        StartCoroutine(PrepareLimb(leftLimb));
    }
	
	// Update is called once per frame
	void Update () {
        if (mustFollow && Vector3.Distance(transform.position,mustFollow.transform.position) > distFollow)
        {
            transform.position = Vector3.MoveTowards(transform.position, mustFollow.transform.position, Time.deltaTime * moveSpeed);
        }
        if (mustFollow && lookAt)
        {
            transform.LookAt(mustFollow.transform,mustFollow.transform.up);
        }
	}

    public void NotifyEndMoveLimb(GameObject limb)
    {
        if(limb == rightLimb.gameObject)
        {
            StartCoroutine(PrepareLimb(leftLimb));
        }
        else
        {
            StartCoroutine(PrepareLimb(rightLimb));
        }
    }

    IEnumerator PrepareLimb(LimbController limb)
    {
        Debug.Log("prepareLimb");

        /*while(Mathf.Abs(Input.GetAxis("Vertical")) < 0.1f && Mathf.Abs(Input.GetAxis("Horizontal")) < 0.1f)
        {
            yield return null;
        }*/

        Debug.Log("Limb prepared");

        limb.StartLimbMove();

        yield return null;
    }
}
