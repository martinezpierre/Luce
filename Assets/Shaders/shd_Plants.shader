// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-708-OUT,clip-2365-A,voffset-967-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32261,y:32590,ptovrint:False,ptlb:Tint 1,ptin:_Tint1,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5172414,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6905,x:32261,y:32403,ptovrint:False,ptlb:texture,ptin:_texture,varname:node_6905,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d81d286b400b63e4d86608328652cf6b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:911,x:32548,y:32523,varname:node_911,prsc:2|A-6905-RGB,B-7241-RGB;n:type:ShaderForge.SFN_Tex2d,id:2365,x:32454,y:32910,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_2365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c09202ba620256742afa6627818bb560,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Add,id:2983,x:32548,y:32358,varname:node_2983,prsc:2|A-6905-RGB,B-4023-RGB;n:type:ShaderForge.SFN_Multiply,id:708,x:32728,y:32479,varname:node_708,prsc:2|A-2983-OUT,B-911-OUT;n:type:ShaderForge.SFN_Color,id:4023,x:32428,y:32210,ptovrint:False,ptlb:Tint 2,ptin:_Tint2,varname:_Tint2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5172414,c3:0,c4:1;n:type:ShaderForge.SFN_Normalize,id:8867,x:32060,y:32883,varname:node_8867,prsc:2|IN-3862-OUT;n:type:ShaderForge.SFN_Multiply,id:967,x:32281,y:33066,varname:node_967,prsc:2|A-3862-OUT,B-2174-OUT,C-5406-OUT;n:type:ShaderForge.SFN_Sin,id:2174,x:32077,y:33306,varname:node_2174,prsc:2|IN-1617-OUT;n:type:ShaderForge.SFN_Add,id:1617,x:31913,y:33306,varname:node_1617,prsc:2|A-3088-OUT,B-777-OUT;n:type:ShaderForge.SFN_Pi,id:3088,x:31763,y:33306,varname:node_3088,prsc:2;n:type:ShaderForge.SFN_Time,id:5536,x:31556,y:33394,varname:node_5536,prsc:2;n:type:ShaderForge.SFN_Slider,id:5406,x:32260,y:33232,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_5406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.01;n:type:ShaderForge.SFN_Multiply,id:3862,x:31923,y:33031,varname:node_3862,prsc:2|A-4922-XYZ,B-679-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:828,x:31141,y:32972,varname:node_828,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:679,x:31746,y:33129,varname:node_679,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5077-OUT;n:type:ShaderForge.SFN_Multiply,id:5077,x:31524,y:33049,varname:node_5077,prsc:2|A-828-XYZ,B-6688-OUT;n:type:ShaderForge.SFN_Subtract,id:6688,x:31355,y:33087,varname:node_6688,prsc:2|A-828-Y,B-2887-Y;n:type:ShaderForge.SFN_ObjectPosition,id:2887,x:31166,y:33120,varname:node_2887,prsc:2;n:type:ShaderForge.SFN_Multiply,id:777,x:31746,y:33416,varname:node_777,prsc:2|A-5536-T,B-7184-OUT;n:type:ShaderForge.SFN_Slider,id:7184,x:31556,y:33595,ptovrint:False,ptlb:Vitesse,ptin:_Vitesse,varname:node_7184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Vector4Property,id:4922,x:31724,y:32939,ptovrint:False,ptlb:WindDirection,ptin:_WindDirection,varname:node_4922,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;proporder:7241-2365-6905-4023-5406-7184-4922;pass:END;sub:END;*/

Shader "Shader Forge/shd_Plants" {
    Properties {
        _Tint1 ("Tint 1", Color) = (1,0.5172414,0,1)
        _alpha ("alpha", 2D) = "black" {}
        _texture ("texture", 2D) = "white" {}
        _Tint2 ("Tint 2", Color) = (1,0.5172414,0,1)
        _Amplitude ("Amplitude", Range(0, 0.01)) = 0
        _Vitesse ("Vitesse", Range(0, 10)) = 0
        _WindDirection ("WindDirection", Vector) = (0,0,0,0)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Tint1;
            uniform sampler2D _texture; uniform float4 _texture_ST;
            uniform sampler2D _alpha; uniform float4 _alpha_ST;
            uniform float4 _Tint2;
            uniform float _Amplitude;
            uniform float _Vitesse;
            uniform float4 _WindDirection;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 node_3862 = (_WindDirection.rgb*(mul(_Object2World, v.vertex).rgb*(mul(_Object2World, v.vertex).g-objPos.g)).r);
                float4 node_5536 = _Time + _TimeEditor;
                v.vertex.xyz += (node_3862*sin((3.141592654+(node_5536.g*_Vitesse)))*_Amplitude);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float4 _alpha_var = tex2D(_alpha,TRANSFORM_TEX(i.uv0, _alpha));
                clip(_alpha_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 _texture_var = tex2D(_texture,TRANSFORM_TEX(i.uv0, _texture));
                float3 emissive = ((_texture_var.rgb+_Tint2.rgb)*(_texture_var.rgb*_Tint1.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _alpha; uniform float4 _alpha_ST;
            uniform float _Amplitude;
            uniform float _Vitesse;
            uniform float4 _WindDirection;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 node_3862 = (_WindDirection.rgb*(mul(_Object2World, v.vertex).rgb*(mul(_Object2World, v.vertex).g-objPos.g)).r);
                float4 node_5536 = _Time + _TimeEditor;
                v.vertex.xyz += (node_3862*sin((3.141592654+(node_5536.g*_Vitesse)))*_Amplitude);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float4 _alpha_var = tex2D(_alpha,TRANSFORM_TEX(i.uv0, _alpha));
                clip(_alpha_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
