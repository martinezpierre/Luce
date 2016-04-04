using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityStandardAssets.ImageEffects;

public class Cam : MonoBehaviour
{
    public Transform SkyboxContainer = null;
    public LayerMask LayerAll, LayerSkybox;
    public RenderTexture TexSkybox;
    public Camera myCam;

    void Start()
    {
        if (GameObject.Find("Skybox") && SkyboxContainer == null)
            SkyboxContainer = GameObject.Find("Skybox").transform;
    }

    public void LateUpdate()
    {
        UpdateSkybox();
    }

    public void UpdateSkybox()
    {
        if (SkyboxContainer != null)
        {
            SkyboxContainer.position = transform.position;
        }


        myCam.cullingMask = LayerSkybox.value;
        myCam.targetTexture = TexSkybox;
        myCam.Render();
        myCam.cullingMask = LayerAll.value;
        myCam.targetTexture = null;
    }
}
