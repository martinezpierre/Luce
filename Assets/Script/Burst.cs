using UnityEngine;
using System.Collections;

public class Burst : MonoBehaviour {

    float burstJauge = 100;

    public float maxSize = 2f;

    public float speedModifier = .75f;

    public GameObject burstAura;

    bool burstActive = false;

    float lastDrop = 0f;
    public float dropDelay = 1f;

    float lastIncrease = 0f;
    public float reloadDelay = 1f;

    PlayerController pC;

    [HideInInspector]
    public bool canReload = false;

	// Use this for initialization
	void Start () {
        burstAura = Instantiate(burstAura);
        burstAura.transform.parent = transform;
        burstAura.transform.localPosition = Vector3.zero;
        burstAura.transform.localScale = Vector3.one * maxSize;
        burstAura.SetActive(false);

        pC = GetComponent<PlayerController>();
    }
	
	// Update is called once per frame
	void Update () {

        if (Input.GetKey(KeyCode.Space) && canReload && burstJauge < 100)
        {
            if (Time.time - lastIncrease > reloadDelay)
            {
                lastIncrease = Time.time;

                burstJauge += 1f;
            }
        }
        else if (Input.GetKeyDown(KeyCode.Space) && burstJauge > 0)
        {
            Debug.Log("burst");

            ToggleBurst();
        }

        if (burstActive)
        {
            if(Time.time - lastDrop > dropDelay)
            {
                lastDrop = Time.time;

                burstJauge -= .1f;
                
                burstAura.transform.localScale = (Vector3.one * maxSize)*(burstJauge*1.0f/100.0f);

                if(burstJauge <= 0)
                {
                    ToggleBurst();
                }
            }
        }
	}

    void ToggleBurst()
    {
        burstActive = !burstActive;

        burstAura.SetActive(burstActive);

        pC.moveSpeed = burstActive ? pC.moveSpeed * speedModifier : pC.moveSpeed / speedModifier;

        pC.canJump = !pC.canJump;
    }
}
