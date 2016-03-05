using UnityEngine;
using System.Collections;

public class LifeController : MonoBehaviour {

    [HideInInspector]public bool toucheEnemy = false;
    public int life = 100;

    public float damageDelay = 0.5f;
    float lastDamage = 0;

    public int damage = 5;

    void Update()
    {
        if(toucheEnemy && Time.time - lastDamage > damageDelay)
        {
            life -= damage;
            lastDamage = Time.time;

            if (life <= 0)
            {
                GetComponent<PlayerController>().GameOver();
            }

        }
    }
}
