using UnityEngine;
using System.Collections.Generic;

public class OpenableDarkMatter : MonoBehaviour {

    LampManager lm;
    bool fadeOut;
    float speed = 8;
    
    [Header("Set Size and leave empty if no specific lamps")]
    public List<LampController> lamps = new List<LampController>();

    void Start() {
        lm = LampManager.Instance;
    }

    void Update() {
        if (fadeOut) {
            transform.localScale -= new Vector3(speed * Time.deltaTime, speed * Time.deltaTime, speed * Time.deltaTime);
            if (transform.localScale.x < 1) { Destroy(this.gameObject); }
        } else if (lm.nbLampLighted >= lamps.Count) {
            bool rip = false;
            for (int i = 0; i < lamps.Count; i++) if (lamps[i] != null && !lamps[i].lighted) rip = true;
            if (!rip) fadeOut = true;
        }
    }
}
