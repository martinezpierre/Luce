using UnityEngine;
using System.Collections;

public class CameraManager : MonoBehaviour {

    static CameraManager instance;

    public static CameraManager Instance
    {
        get
        {
            return instance;
        }
    }

    void Awake()
    {
        instance = this;
    }

    Camera mainCam;

    Vector3 savedModifier;
    int n;

	// Use this for initialization
	void Start () {
        mainCam = Camera.main;
        n = 0;
    }
	
	// Update is called once per frame
	void Update () {
	
	}

    public void UpdateCamera(Vector3 newPos)
    {
        Debug.Log(newPos);   

        switch (n)
        {
            case 0:
                savedModifier = newPos;
                break;
            case 1:
                mainCam.transform.localPosition = mainCam.transform.localPosition + newPos + savedModifier;
                break;
        }
        
        n = (n + 1) % 2;
    }
}
