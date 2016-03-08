// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3217992,fgcg:0.174308,fgcb:0.9117647,fgca:1,fgde:0.01,fgrn:100,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7859,x:33954,y:32211,varname:node_7859,prsc:2|emission-9960-RGB,voffset-9203-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6619,x:32374,y:32659,ptovrint:False,ptlb:Tex_Cloud,ptin:_Tex_Cloud,varname:node_6619,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4176,x:32619,y:32351,varname:node_4176,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-9167-UVOUT,TEX-6619-TEX;n:type:ShaderForge.SFN_FragmentPosition,id:8362,x:31764,y:32442,varname:node_8362,prsc:2;n:type:ShaderForge.SFN_Append,id:4421,x:31998,y:32454,varname:node_4421,prsc:2|A-8362-X,B-8362-Z;n:type:ShaderForge.SFN_Panner,id:9167,x:32374,y:32341,varname:node_9167,prsc:2,spu:1.3,spv:4|UVIN-4421-OUT;n:type:ShaderForge.SFN_Tex2d,id:4572,x:32619,y:32500,varname:node_4572,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-9663-UVOUT,TEX-5270-TEX;n:type:ShaderForge.SFN_Panner,id:9663,x:32374,y:32490,varname:node_9663,prsc:2,spu:2.7,spv:-3|UVIN-4421-OUT;n:type:ShaderForge.SFN_Add,id:7494,x:33079,y:32443,varname:node_7494,prsc:2|A-7355-OUT,B-687-OUT;n:type:ShaderForge.SFN_Multiply,id:9203,x:33576,y:32461,varname:node_9203,prsc:2|A-7813-OUT,B-6978-OUT,C-2780-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5270,x:32374,y:32842,ptovrint:False,ptlb:Tex_BigCloud,ptin:_Tex_BigCloud,varname:node_5270,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector3,id:7813,x:33023,y:32349,varname:node_7813,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_ValueProperty,id:2780,x:33236,y:32621,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_2780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Multiply,id:7355,x:32798,y:32349,varname:node_7355,prsc:2|A-4176-R,B-7824-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7824,x:32554,y:32169,ptovrint:False,ptlb:Force1,ptin:_Force1,varname:node_7824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7551,x:32712,y:32731,ptovrint:False,ptlb:Force2,ptin:_Force2,varname:node_7551,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:687,x:32900,y:32461,varname:node_687,prsc:2|A-4572-R,B-7551-OUT;n:type:ShaderForge.SFN_Time,id:6359,x:32539,y:32822,varname:node_6359,prsc:2;n:type:ShaderForge.SFN_Sin,id:9383,x:33142,y:32876,varname:node_9383,prsc:2|IN-9932-OUT;n:type:ShaderForge.SFN_RemapRange,id:747,x:33335,y:32812,varname:node_747,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9383-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4737,x:32712,y:33006,ptovrint:False,ptlb:WaveSpeed,ptin:_WaveSpeed,varname:node_4737,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:9619,x:32712,y:32837,varname:node_9619,prsc:2|A-6359-T,B-4737-OUT;n:type:ShaderForge.SFN_Add,id:9932,x:32983,y:32876,varname:node_9932,prsc:2|A-9619-OUT,B-7996-OUT;n:type:ShaderForge.SFN_Add,id:6978,x:33280,y:32471,varname:node_6978,prsc:2|A-7494-OUT,B-747-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1282,x:32305,y:33061,ptovrint:False,ptlb:Tex_WaveCloud,ptin:_Tex_WaveCloud,varname:node_1282,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3487,x:32695,y:33131,varname:node_3487,prsc:2,ntxv:0,isnm:False|UVIN-4421-OUT,TEX-1282-TEX;n:type:ShaderForge.SFN_Multiply,id:7996,x:32966,y:33097,varname:node_7996,prsc:2|A-3487-R,B-9364-OUT;n:type:ShaderForge.SFN_Tau,id:9364,x:32741,y:33263,varname:node_9364,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:9960,x:33561,y:32187,ptovrint:False,ptlb:node_9960,ptin:_node_9960,varname:node_9960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e3e8b2cf90fb7404e9e3dc62e316a39e,ntxv:0,isnm:False;proporder:6619-5270-2780-7824-7551-4737-1282-9960;pass:END;sub:END;*/

Shader "Unlit/shader_ground" {
    Properties {
        _Tex_Cloud ("Tex_Cloud", 2D) = "white" {}
        _Tex_BigCloud ("Tex_BigCloud", 2D) = "white" {}
        _Height ("Height", Float ) = 10
        _Force1 ("Force1", Float ) = 0
        _Force2 ("Force2", Float ) = 0
        _WaveSpeed ("WaveSpeed", Float ) = 0
        _Tex_WaveCloud ("Tex_WaveCloud", 2D) = "white" {}
        _node_9960 ("node_9960", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Tex_Cloud; uniform float4 _Tex_Cloud_ST;
            uniform sampler2D _Tex_BigCloud; uniform float4 _Tex_BigCloud_ST;
            uniform float _Height;
            uniform float _Force1;
            uniform float _Force2;
            uniform float _WaveSpeed;
            uniform sampler2D _Tex_WaveCloud; uniform float4 _Tex_WaveCloud_ST;
            uniform sampler2D _node_9960; uniform float4 _node_9960_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_2292 = _Time + _TimeEditor;
                float2 node_4421 = float2(mul(_Object2World, v.vertex).r,mul(_Object2World, v.vertex).b);
                float2 node_9167 = (node_4421+node_2292.g*float2(1.3,4));
                float4 node_4176 = tex2Dlod(_Tex_Cloud,float4(TRANSFORM_TEX(node_9167, _Tex_Cloud),0.0,0));
                float2 node_9663 = (node_4421+node_2292.g*float2(2.7,-3));
                float4 node_4572 = tex2Dlod(_Tex_BigCloud,float4(TRANSFORM_TEX(node_9663, _Tex_BigCloud),0.0,0));
                float4 node_6359 = _Time + _TimeEditor;
                float4 node_3487 = tex2Dlod(_Tex_WaveCloud,float4(TRANSFORM_TEX(node_4421, _Tex_WaveCloud),0.0,0));
                v.vertex.xyz += (float3(0,0,1)*(((node_4176.r*_Force1)+(node_4572.r*_Force2))+(sin(((node_6359.g*_WaveSpeed)+(node_3487.r*6.28318530718)))*0.5+0.5))*_Height);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _node_9960_var = tex2D(_node_9960,TRANSFORM_TEX(i.uv0, _node_9960));
                float3 emissive = _node_9960_var.rgb;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
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
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Tex_Cloud; uniform float4 _Tex_Cloud_ST;
            uniform sampler2D _Tex_BigCloud; uniform float4 _Tex_BigCloud_ST;
            uniform float _Height;
            uniform float _Force1;
            uniform float _Force2;
            uniform float _WaveSpeed;
            uniform sampler2D _Tex_WaveCloud; uniform float4 _Tex_WaveCloud_ST;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 node_5215 = _Time + _TimeEditor;
                float2 node_4421 = float2(mul(_Object2World, v.vertex).r,mul(_Object2World, v.vertex).b);
                float2 node_9167 = (node_4421+node_5215.g*float2(1.3,4));
                float4 node_4176 = tex2Dlod(_Tex_Cloud,float4(TRANSFORM_TEX(node_9167, _Tex_Cloud),0.0,0));
                float2 node_9663 = (node_4421+node_5215.g*float2(2.7,-3));
                float4 node_4572 = tex2Dlod(_Tex_BigCloud,float4(TRANSFORM_TEX(node_9663, _Tex_BigCloud),0.0,0));
                float4 node_6359 = _Time + _TimeEditor;
                float4 node_3487 = tex2Dlod(_Tex_WaveCloud,float4(TRANSFORM_TEX(node_4421, _Tex_WaveCloud),0.0,0));
                v.vertex.xyz += (float3(0,0,1)*(((node_4176.r*_Force1)+(node_4572.r*_Force2))+(sin(((node_6359.g*_WaveSpeed)+(node_3487.r*6.28318530718)))*0.5+0.5))*_Height);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
