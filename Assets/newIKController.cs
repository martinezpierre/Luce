using UnityEngine;
using System.Collections;

public class newIKController : MonoBehaviour {

    public LimbController rightLimb;
    public LimbController leftLimb;

    public GameObject mustFollow;

    public float distFollow = 2f;

    public float moveSpeed = 5f;

	// Use this for initialization
	void Start () {
        //leftLimb.StartLimbMove();
        StartCoroutine(PrepareLimb(leftLimb));
    }
	
	// Update is called once per frame
	void Update () {
        if (mustFollow && Vector3.Distance(transform.position,mustFollow.transform.position) > distFollow)
        {
            transform.position = Vector3.MoveTowards(transform.position, mustFollow.transform.position, Time.deltaTime * moveSpeed);
        }
        if (mustFollow)
        {
            transform.LookAt(mustFollow.transform);
        }
	}

    public void NotifyEndMoveLimb(GameObject limb)
    {
        if(limb == rightLimb.gameObject)
        {
            StartCoroutine(PrepareLimb(leftLimb));
            //leftLimb.StartLimbMove();
        }
        else
        {
            StartCoroutine(PrepareLimb(rightLimb));
            //rightLimb.StartLimbMove();
        }
    }

    IEnumerator PrepareLimb(LimbController limb)
    {
        while(Mathf.Abs(Input.GetAxis("Vertical")) < 0.1f && Mathf.Abs(Input.GetAxis("Horizontal")) < 0.1f)
        {
            yield return null;
        }

        limb.StartLimbMove();
    }
}
