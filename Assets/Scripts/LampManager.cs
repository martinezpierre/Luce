﻿using UnityEngine;

public class LampManager : MonoBehaviour {

    static LampManager instance;

    public static LampManager Instance
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

    public int nbLampLighted = 0;

    public void NewLampLighted(GameObject Lamp)
    {
        nbLampLighted++;
        Debug.Log("nbLampLighted: " + nbLampLighted);
    }

}
