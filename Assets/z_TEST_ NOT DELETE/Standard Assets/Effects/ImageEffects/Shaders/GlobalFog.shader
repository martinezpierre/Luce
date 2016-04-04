Shader "Hidden/GlobalFog" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "black" {}
	}

		CGINCLUDE

#include "UnityCG.cginc"

		uniform sampler2D _MainTex;
	uniform sampler2D _Gradient;
	uniform sampler2D _Skybox;
	uniform sampler2D_float _CameraDepthTexture;

	// x = fog height
	// y = FdotC (CameraY-FogHeight)
	// z = k (FdotC > 0.0)
	// w = a/2
	uniform float4 _HeightParams;

	// x = start distance
	uniform float4 _DistanceParams;

	int4 _SceneFogMode; // x = fog mode, y = use radial flag
	float4 _SceneFogParams;

#ifndef UNITY_APPLY_FOG
	half4 unity_FogColor;
	half4 unity_FogDensity;
#endif	

	uniform float4 _MainTex_TexelSize;

	// for fast world space reconstruction
	uniform float4x4 _FrustumCornersWS;
	uniform float4 _CameraWS;

	struct v2f
	{
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
		float2 uv_depth : TEXCOORD1;
		float4 interpolatedRay : TEXCOORD2;
	};

	v2f vert(appdata_img v)
	{
		v2f o;
		half index = v.vertex.z;
		v.vertex.z = 0.1;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uv = v.texcoord.xy;
		o.uv_depth = v.texcoord.xy;

#if UNITY_UV_STARTS_AT_TOP
		if (_MainTex_TexelSize.y < 0)
			o.uv.y = 1 - o.uv.y;
#endif				

		o.interpolatedRay = _FrustumCornersWS[(int)index];
		o.interpolatedRay.w = index;

		return o;
	}

	// Applies one of standard fog formulas, given fog coordinate (i.e. distance)
	half ComputeFogFactor(float coord)
	{
		float fogFac = 0.0;
		if (_SceneFogMode.x == 1) // linear
		{
			// factor = (end-z)/(end-start) = z * (-1/(end-start)) + (end/(end-start))
			fogFac = coord * _SceneFogParams.z + _SceneFogParams.w;
		}
		if (_SceneFogMode.x == 2) // exp
		{
			// factor = exp(-density*z)
			fogFac = _SceneFogParams.y * coord; fogFac = exp2(-fogFac);
		}
		if (_SceneFogMode.x == 3) // exp2
		{
			// factor = exp(-(density*z)^2)
			fogFac = _SceneFogParams.x * coord; fogFac = exp2(-fogFac*fogFac);
		}
		return saturate(fogFac);
	}

	// Distance-based fog
	float ComputeDistance(float3 camDir, float zdepth)
	{
		float dist;
		if (_SceneFogMode.y == 1)
			dist = length(camDir);
		else
			dist = zdepth * _ProjectionParams.z;
		// Built-in fog starts at near plane, so match that by
		// subtracting the near value. Not a perfect approximation
		// if near plane is very large, but good enough.
		dist -= _ProjectionParams.y;
		return dist;
	}

	half4 ComputeFog(v2f i, bool distance, bool height) : SV_Target
	{
		half4 sceneColor = tex2D(_MainTex, i.uv);
		float2 uvsky = float2(i.uv.x, 1 - i.uv.y);
		//Commenter/decommenter si la skybox flippe de sens vvv
		uvsky = i.uv;
		half4 skyboxColor = tex2D(_Skybox, uvsky);

		// Reconstruct world space position & direction
		// towards this screen pixel.

		float rawDepth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture,i.uv_depth);

		float dpth = Linear01Depth(rawDepth);

		float4 wsDir = dpth * i.interpolatedRay;
		float4 wsPos = _CameraWS + wsDir;

		// Compute fog distance
		float g = _DistanceParams.x;

		if (distance)
			g += ComputeDistance(wsDir, dpth);

		// Compute fog amount
		half fogFac = ComputeFogFactor(max(0.0,g));

		fogFac = 1 - dpth;

		// Do not fog skybox
		if (rawDepth >= 0.99999999f)
			fogFac = 0.0;

		float2 readgrad = float2(clamp(fogFac,0,1), 0);
		float4 colfog = tex2D(_Gradient, readgrad);

		float4 colsky = float4(skyboxColor.r, skyboxColor.g, skyboxColor.b, colfog.a);

		//colfog = colsky;

		if (fogFac < 0.3)
			colfog = lerp(colfog, colsky, (0.3-fogFac) / 0.3);

		float4 colopa = float4(colfog.r, colfog.g, colfog.b, 0);

		//colfog = float4(skyboxColor.r, skyboxColor.g, skyboxColor.b, colfog.a);

		return lerp(colopa, sceneColor,fogFac*(1 - colfog.a));
	}

		ENDCG

		SubShader
	{
		ZTest Always Cull Off ZWrite Off Fog{ Mode Off }

			Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			half4 frag(v2f i) : SV_Target { return ComputeFog(i, true, false); }
			ENDCG
		}

	}

	Fallback off

}
