using System;
using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
    [ExecuteInEditMode]
    [RequireComponent (typeof(Camera))]
    [AddComponentMenu ("Image Effects/Rendering/Custom Fog")]

    public class CustomFog : PostEffectsBase
	{
		[Tooltip("Push fog away from the camera by this amount")]
        public float startDistance = 0.0f;
        [Tooltip("Push fog away from the camera by this amount")]
        public float endDistance = 0.0f;
        [Tooltip("The gradient applied to fog")]
        public Gradient fogGradient;

        public Shader fogShader = null;
        private Material fogMaterial = null;

        public Texture2D gradientTex = null;
        public RenderTexture TexSkybox;

        public override bool CheckResources ()
		{
            RenderSettings.fogStartDistance = startDistance;
            RenderSettings.fogEndDistance = endDistance;

            if (gradientTex == null)
            {
                gradientTex = new Texture2D(512, 1);
            }

            for(int i=0;i<512;i+=1)
            {
                gradientTex.SetPixel(511-i, 0, fogGradient.Evaluate((float)i/512f));
            }

            gradientTex.wrapMode = TextureWrapMode.Clamp;
            gradientTex.Apply();

            CheckSupport (true);

            fogMaterial = CheckShaderAndCreateMaterial (fogShader, fogMaterial);

            if (!isSupported)
                ReportAutoDisable ();
            return isSupported;
        }

        [ImageEffectOpaque]
        void OnRenderImage (RenderTexture source, RenderTexture destination)
		{
            if (CheckResources()==false)
            {
                Graphics.Blit (source, destination);
                return;
            }

			Camera cam = GetComponent<Camera>();
			Transform camtr = cam.transform;
			float camNear = cam.nearClipPlane;
			float camFar = cam.farClipPlane;
			float camFov = cam.fieldOfView;
			float camAspect = cam.aspect;

            Matrix4x4 frustumCorners = Matrix4x4.identity;

			float fovWHalf = camFov * 0.5f;

			Vector3 toRight = camtr.right * camNear * Mathf.Tan (fovWHalf * Mathf.Deg2Rad) * camAspect;
			Vector3 toTop = camtr.up * camNear * Mathf.Tan (fovWHalf * Mathf.Deg2Rad);

			Vector3 topLeft = (camtr.forward * camNear - toRight + toTop);
			float camScale = topLeft.magnitude * camFar/camNear;

            topLeft.Normalize();
			topLeft *= camScale;

			Vector3 topRight = (camtr.forward * camNear + toRight + toTop);
            topRight.Normalize();
			topRight *= camScale;

			Vector3 bottomRight = (camtr.forward * camNear + toRight - toTop);
            bottomRight.Normalize();
			bottomRight *= camScale;

			Vector3 bottomLeft = (camtr.forward * camNear - toRight - toTop);
            bottomLeft.Normalize();
			bottomLeft *= camScale;

            frustumCorners.SetRow (0, topLeft);
            frustumCorners.SetRow (1, topRight);
            frustumCorners.SetRow (2, bottomRight);
            frustumCorners.SetRow (3, bottomLeft);

			var camPos= camtr.position;


            fogMaterial.SetMatrix ("_FrustumCornersWS", frustumCorners);
            fogMaterial.SetVector ("_CameraWS", camPos);

            fogMaterial.SetVector ("_DistanceParams", new Vector4 (-Mathf.Max(startDistance,0.0f), 0, 0, 0));

            var sceneMode= RenderSettings.fogMode;
            var sceneDensity= RenderSettings.fogDensity;
            var sceneStart= RenderSettings.fogStartDistance;
            var sceneEnd= RenderSettings.fogEndDistance;
            Vector4 sceneParams;
            bool  linear = (sceneMode == FogMode.Linear);
            float diff = linear ? sceneEnd - sceneStart : 0.0f;
            float invDiff = Mathf.Abs(diff) > 0.0001f ? 1.0f / diff : 0.0f;
            sceneParams.x = sceneDensity * 1.2011224087f; // density / sqrt(ln(2)), used by Exp2 fog mode
            sceneParams.y = sceneDensity * 1.4426950408f; // density / ln(2), used by Exp fog mode
            sceneParams.z = linear ? -invDiff : 0.0f;
            sceneParams.w = linear ? sceneEnd * invDiff : 0.0f;
            fogMaterial.SetVector ("_SceneFogParams", sceneParams);
			fogMaterial.SetVector ("_SceneFogMode", new Vector4((int)sceneMode, 1, 0, 0));

            CustomGraphicsBlit (source, destination, fogMaterial, 0,gradientTex, TexSkybox);
        }

        static void CustomGraphicsBlit (RenderTexture source, RenderTexture dest, Material fxMaterial, int passNr,Texture2D gradtex,RenderTexture skytex)
		{
            RenderTexture.active = dest;

            fxMaterial.SetTexture ("_MainTex", source);
            fxMaterial.SetTexture("_Gradient", gradtex);
            fxMaterial.SetTexture("_Skybox", skytex);
            GL.PushMatrix ();
            GL.LoadOrtho ();

            fxMaterial.SetPass (passNr);

            GL.Begin (GL.QUADS);

            GL.MultiTexCoord2 (0, 0.0f, 0.0f);
            GL.Vertex3 (0.0f, 0.0f, 3.0f); // BL

            GL.MultiTexCoord2 (0, 1.0f, 0.0f);
            GL.Vertex3 (1.0f, 0.0f, 2.0f); // BR

            GL.MultiTexCoord2 (0, 1.0f, 1.0f);
            GL.Vertex3 (1.0f, 1.0f, 1.0f); // TR

            GL.MultiTexCoord2 (0, 0.0f, 1.0f);
            GL.Vertex3 (0.0f, 1.0f, 0.0f); // TL

            GL.End ();
            GL.PopMatrix ();
        }
    }
}
