// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32920,y:32733,varname:node_3138,prsc:2|emission-5321-RGB,custl-2018-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32946,y:32611,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2827586,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Posterize,id:4907,x:31982,y:32425,varname:node_4907,prsc:2|IN-5167-OUT,STPS-8026-OUT;n:type:ShaderForge.SFN_Vector1,id:1514,x:32199,y:32295,cmnt:étapes atténuation,varname:node_1514,prsc:2,v1:2;n:type:ShaderForge.SFN_LightAttenuation,id:5167,x:31563,y:32753,varname:node_5167,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9770,x:33157,y:32551,varname:node_9770,prsc:2|A-1103-R,B-7241-RGB;n:type:ShaderForge.SFN_LightPosition,id:1377,x:33186,y:33117,cmnt:attenuation to brighten and darken evenly via distance,varname:node_1377,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:6862,x:32880,y:33591,cmnt:httppolycount.comdiscussion146334how-would-i-create-attenuation-with-no-shadows-in-shader-forge,varname:node_6862,prsc:2;n:type:ShaderForge.SFN_Distance,id:3345,x:33076,y:33274,varname:node_3345,prsc:2|A-1377-XYZ,B-6862-XYZ;n:type:ShaderForge.SFN_Divide,id:5538,x:33242,y:33274,varname:node_5538,prsc:2|A-3345-OUT,B-4323-OUT;n:type:ShaderForge.SFN_Vector1,id:4323,x:33076,y:33421,cmnt:light range,varname:node_4323,prsc:2,v1:3;n:type:ShaderForge.SFN_Power,id:3104,x:33400,y:33274,varname:node_3104,prsc:2|VAL-5538-OUT,EXP-5015-OUT;n:type:ShaderForge.SFN_Vector1,id:5015,x:33242,y:33421,cmnt:attenuation,varname:node_5015,prsc:2,v1:2;n:type:ShaderForge.SFN_Color,id:5988,x:33400,y:33421,ptovrint:False,ptlb:light colour,ptin:_lightcolour,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:5744,x:33564,y:33274,varname:node_5744,prsc:2|A-3104-OUT,B-5988-RGB;n:type:ShaderForge.SFN_Clamp01,id:1795,x:33734,y:33274,varname:node_1795,prsc:2|IN-5744-OUT;n:type:ShaderForge.SFN_Color,id:5321,x:32595,y:31954,ptovrint:False,ptlb:Color_copy,ptin:_Color_copy,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3241377,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:8026,x:31982,y:32363,ptovrint:False,ptlb:test,ptin:_test,varname:node_8026,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:691,x:32595,y:32117,ptovrint:False,ptlb:lol,ptin:_lol,varname:node_691,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:5983,x:32760,y:32054,varname:node_5983,prsc:2|A-5321-RGB,B-691-RGB;n:type:ShaderForge.SFN_Append,id:7575,x:32023,y:32645,varname:node_7575,prsc:2|A-219-OUT,B-219-OUT;n:type:ShaderForge.SFN_TexCoord,id:7521,x:31565,y:32369,varname:node_7521,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:1103,x:32372,y:32612,ptovrint:False,ptlb:gradient,ptin:_gradient,varname:node_1103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d8efd092405b8354b9f176e28c026144,ntxv:0,isnm:False|UVIN-7575-OUT;n:type:ShaderForge.SFN_LightVector,id:5212,x:31374,y:33001,varname:node_5212,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:2236,x:31374,y:33150,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:4915,x:31652,y:33110,varname:node_4915,prsc:2,dt:0|A-5212-OUT,B-2236-OUT;n:type:ShaderForge.SFN_Multiply,id:3097,x:31844,y:32950,varname:node_3097,prsc:2|A-5321-RGB,B-4915-OUT;n:type:ShaderForge.SFN_HalfVector,id:5713,x:31374,y:33314,varname:node_5713,prsc:2;n:type:ShaderForge.SFN_Dot,id:8163,x:31652,y:33260,varname:node_8163,prsc:2,dt:0|A-2236-OUT,B-5713-OUT;n:type:ShaderForge.SFN_Power,id:9538,x:31904,y:33230,varname:node_9538,prsc:2|VAL-8163-OUT,EXP-2254-OUT;n:type:ShaderForge.SFN_Slider,id:2254,x:31840,y:33407,ptovrint:False,ptlb:glossiness,ptin:_glossiness,varname:node_2254,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:5449,x:32127,y:33137,varname:node_5449,prsc:2|A-9538-OUT,B-5061-OUT;n:type:ShaderForge.SFN_Slider,id:5061,x:32164,y:33418,ptovrint:False,ptlb:specularitty,ptin:_specularitty,varname:_glossiness_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:4;n:type:ShaderForge.SFN_Add,id:3510,x:32336,y:33077,varname:node_3510,prsc:2|A-3097-OUT,B-5449-OUT;n:type:ShaderForge.SFN_LightColor,id:9196,x:32580,y:33316,varname:node_9196,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2018,x:32729,y:32967,varname:node_2018,prsc:2|A-1103-RGB,B-9196-RGB;n:type:ShaderForge.SFN_Desaturate,id:219,x:32389,y:32886,varname:node_219,prsc:2|COL-3099-OUT;n:type:ShaderForge.SFN_Multiply,id:3099,x:32143,y:32854,varname:node_3099,prsc:2|A-3097-OUT,B-5167-OUT;n:type:ShaderForge.SFN_Tex2d,id:9484,x:32330,y:31972,ptovrint:False,ptlb:block,ptin:_block,varname:node_9484,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1ca1f535a383c0343a6f4ea0655c37db,ntxv:0,isnm:False;proporder:7241-5988-5321-8026-691-1103-2254-5061-9484;pass:END;sub:END;*/

Shader "Shader Forge/lamp_aura_test" {
    Properties {
        _Color ("Color", Color) = (0.2827586,1,0,1)
        _lightcolour ("light colour", Color) = (1,0,0,1)
        _Color_copy ("Color_copy", Color) = (0.3241377,0,1,1)
        _test ("test", Float ) = 1
        _lol ("lol", Color) = (0.5,0.5,0.5,1)
        _gradient ("gradient", 2D) = "white" {}
        _glossiness ("glossiness", Range(1, 10)) = 1
        _specularitty ("specularitty", Range(0, 4)) = 1
        _block ("block", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color_copy;
            uniform sampler2D _gradient; uniform float4 _gradient_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float3 emissive = _Color_copy.rgb;
                float3 node_3097 = (_Color_copy.rgb*dot(lightDirection,normalDirection));
                float node_219 = dot((node_3097*attenuation),float3(0.3,0.59,0.11));
                float2 node_7575 = float2(node_219,node_219);
                float4 _gradient_var = tex2D(_gradient,TRANSFORM_TEX(node_7575, _gradient));
                float3 finalColor = emissive + (_gradient_var.rgb*_LightColor0.rgb);
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color_copy;
            uniform sampler2D _gradient; uniform float4 _gradient_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 node_3097 = (_Color_copy.rgb*dot(lightDirection,normalDirection));
                float node_219 = dot((node_3097*attenuation),float3(0.3,0.59,0.11));
                float2 node_7575 = float2(node_219,node_219);
                float4 _gradient_var = tex2D(_gradient,TRANSFORM_TEX(node_7575, _gradient));
                float3 finalColor = (_gradient_var.rgb*_LightColor0.rgb);
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
