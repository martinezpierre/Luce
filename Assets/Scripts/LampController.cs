using UnityEngine;

public class LampController : MonoBehaviour
{

    [HideInInspector]
    public bool lighted = false;
    public float fadeDuration, smolFireflies = 1;
    public bool isMap;
    float elapsedT, intensity, lightModifier = 0.5f, random;
    Light halo;
    ParticleSystem.SizeOverLifetimeModule fireflies;

    void Awake()
    {
        halo = GetComponentInChildren<Light>();
        fireflies = GetComponentInChildren<ParticleSystem>().sizeOverLifetime;
        intensity = halo.intensity;
        halo.intensity = 0;
        random = Random.Range(0.0f, 65535.0f);
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            other.GetComponentInParent<Burst>().canReload = true;

            if (!lighted)
            {
                halo.enabled = true;
                if (!isMap) LampManager.Instance.NewLampLighted(gameObject);
                lighted = true;
                
                AnimationCurve curve = new AnimationCurve();
                curve.AddKey(0.0f, 0.0f);
                curve.AddKey(0.5f, smolFireflies);
                curve.AddKey(1, 0.0f);

                fireflies.size = new ParticleSystem.MinMaxCurve(1, curve);
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.tag == "Player")
        {
            other.GetComponentInParent<Burst>().canReload = false;
        }
    }

    void Update()
    {
        if (lighted)
        {
            if (elapsedT < fadeDuration)
            {
                GetComponent<Renderer>().material.SetFloat("_blend", Mathf.Lerp(0, 1, elapsedT / fadeDuration));
                halo.intensity = Mathf.Lerp(0, intensity, elapsedT / fadeDuration);
                elapsedT += Time.deltaTime;
                if (Mathf.Abs(elapsedT / fadeDuration - 1) < 0.05) GetComponent<Renderer>().material.SetFloat("_blend", 1);
            }
            else
            {
                float noise = Mathf.PerlinNoise(random, Time.time);
                halo.intensity = Mathf.Lerp(intensity - lightModifier, intensity + lightModifier, noise);
                GetComponent<Renderer>().material.SetFloat("_blend", Mathf.Lerp(1 - lightModifier, 1, noise));
            }
        }
    }
}
