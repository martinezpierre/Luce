// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|emission-4540-OUT;n:type:ShaderForge.SFN_Tex2d,id:1870,x:32078,y:32532,ptovrint:False,ptlb:_t_off,ptin:__t_off,varname:node_1870,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bad83bf9e4b2920449e1a90b21a5c534,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5305,x:31770,y:32743,ptovrint:False,ptlb:_t_on,ptin:__t_on,varname:node_5305,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f8538f5dccb83004eaafb91d11f642b6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:4949,x:32283,y:33171,ptovrint:False,ptlb:blend,ptin:_blend,varname:node_4949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Lerp,id:4540,x:32435,y:32810,varname:node_4540,prsc:2|A-1870-RGB,B-5305-RGB,T-4949-OUT;n:type:ShaderForge.SFN_Tex2d,id:9307,x:32004,y:33056,ptovrint:False,ptlb:lamp_alpha,ptin:_lamp_alpha,varname:__t_on_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b4982608b4b798e4bb85bc33d11e7e34,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:2098,x:31795,y:32972,varname:node_2098,prsc:2,v1:0.1;proporder:1870-5305-4949-9307;pass:END;sub:END;*/

Shader "Luce/Lamps" {
    Properties {
        __t_off ("_t_off", 2D) = "white" {}
        __t_on ("_t_on", 2D) = "white" {}
        _blend ("blend", Range(0, 1)) = 1
        _lamp_alpha ("lamp_alpha", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D __t_off; uniform float4 __t_off_ST;
            uniform sampler2D __t_on; uniform float4 __t_on_ST;
            uniform float _blend;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 __t_off_var = tex2D(__t_off,TRANSFORM_TEX(i.uv0, __t_off));
                float4 __t_on_var = tex2D(__t_on,TRANSFORM_TEX(i.uv0, __t_on));
                float3 emissive = lerp(__t_off_var.rgb,__t_on_var.rgb,_blend);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
