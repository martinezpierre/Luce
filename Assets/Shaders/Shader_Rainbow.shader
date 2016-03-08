// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:1,fgcb:1,fgca:0,fgde:0.01,fgrn:15,fgrf:200,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5174,x:33275,y:32591,varname:node_5174,prsc:2|emission-3239-RGB,clip-3239-A;n:type:ShaderForge.SFN_NormalVector,id:8010,x:32147,y:32753,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:8064,x:32365,y:32678,varname:node_8064,prsc:2,dt:0|A-3719-XYZ,B-8010-OUT;n:type:ShaderForge.SFN_Vector3,id:9945,x:31987,y:32600,varname:node_9945,prsc:2,v1:0,v2:0,v3:0.5;n:type:ShaderForge.SFN_Transform,id:3719,x:32147,y:32600,varname:node_3719,prsc:2,tffrom:1,tfto:0|IN-9945-OUT;n:type:ShaderForge.SFN_Slider,id:8107,x:32557,y:33026,ptovrint:False,ptlb:Weight,ptin:_Weight,varname:node_8107,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:7843,x:32380,y:32858,ptovrint:False,ptlb:Size,ptin:_Size,varname:node_7843,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:3239,x:33053,y:32653,ptovrint:False,ptlb:TexRainbow,ptin:_TexRainbow,varname:node_3239,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:25427ed6a28c3044d80e243b5f85cd31,ntxv:0,isnm:False|UVIN-8921-OUT;n:type:ShaderForge.SFN_Append,id:8921,x:32888,y:32615,varname:node_8921,prsc:2|A-1129-OUT,B-2070-OUT;n:type:ShaderForge.SFN_Vector1,id:1129,x:32714,y:32615,varname:node_1129,prsc:2,v1:0;n:type:ShaderForge.SFN_RemapRange,id:9047,x:32537,y:32678,varname:node_9047,prsc:2,frmn:1,frmx:-1,tomn:1,tomx:0|IN-8064-OUT;n:type:ShaderForge.SFN_Subtract,id:6953,x:32714,y:32766,varname:node_6953,prsc:2|A-9047-OUT,B-7843-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2070,x:32888,y:32766,varname:node_2070,prsc:2|IN-6953-OUT,IMIN-9991-OUT,IMAX-8107-OUT,OMIN-9991-OUT,OMAX-220-OUT;n:type:ShaderForge.SFN_Vector1,id:9991,x:32714,y:32895,varname:node_9991,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:220,x:32714,y:32953,varname:node_220,prsc:2,v1:1;proporder:8107-7843-3239;pass:END;sub:END;*/

Shader "Unlit/Shader_Rainbow" {
    Properties {
        _Weight ("Weight", Range(0, 1)) = 1
        _Size ("Size", Range(0, 1)) = 1
        _TexRainbow ("TexRainbow", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 100
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Always
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _Weight;
            uniform float _Size;
            uniform sampler2D _TexRainbow; uniform float4 _TexRainbow_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float3 normalDir : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_9991 = 0.0;
                float2 node_8921 = float2(0.0,(node_9991 + ( (((dot(mul( _Object2World, float4(float3(0,0,0.5),0) ).xyz.rgb,i.normalDir)*0.5+0.5)-_Size) - node_9991) * (1.0 - node_9991) ) / (_Weight - node_9991)));
                float4 _TexRainbow_var = tex2D(_TexRainbow,TRANSFORM_TEX(node_8921, _TexRainbow));
                clip(_TexRainbow_var.a - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = _TexRainbow_var.rgb;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(1,1,1,0));
                return finalRGBA;
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
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _Weight;
            uniform float _Size;
            uniform sampler2D _TexRainbow; uniform float4 _TexRainbow_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_9991 = 0.0;
                float2 node_8921 = float2(0.0,(node_9991 + ( (((dot(mul( _Object2World, float4(float3(0,0,0.5),0) ).xyz.rgb,i.normalDir)*0.5+0.5)-_Size) - node_9991) * (1.0 - node_9991) ) / (_Weight - node_9991)));
                float4 _TexRainbow_var = tex2D(_TexRainbow,TRANSFORM_TEX(node_8921, _TexRainbow));
                clip(_TexRainbow_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
