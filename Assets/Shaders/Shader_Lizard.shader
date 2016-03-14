// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7241-RGB,alpha-3960-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32320,y:32560,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7982759,c3:0.1397059,c4:1;n:type:ShaderForge.SFN_Slider,id:3960,x:32392,y:32888,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_3960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Panner,id:7113,x:32105,y:32833,varname:node_7113,prsc:2,spu:0.3,spv:0|UVIN-9843-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9843,x:31887,y:32833,varname:node_9843,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:9589,x:32152,y:32694,varname:node_9589,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-7113-UVOUT,TEX-552-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:552,x:31871,y:32617,ptovrint:False,ptlb:nuage,ptin:_nuage,varname:node_552,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:4837,x:32240,y:32869,varname:node_4837,prsc:2,v1:-0.1;n:type:ShaderForge.SFN_Add,id:2270,x:32065,y:33059,varname:node_2270,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7100,x:32372,y:32729,varname:node_7100,prsc:2|A-7241-RGB,B-9589-RGB;n:type:ShaderForge.SFN_Multiply,id:844,x:32545,y:32729,varname:node_844,prsc:2|A-7241-RGB,B-7100-OUT;n:type:ShaderForge.SFN_Color,id:5235,x:32392,y:33011,ptovrint:False,ptlb:outline,ptin:_outline,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.6,c3:0,c4:1;n:type:ShaderForge.SFN_Vector1,id:2650,x:32444,y:33174,varname:node_2650,prsc:2,v1:0.03;proporder:7241-3960-552-5235;pass:END;sub:END;*/

Shader "Luce/Shader_Lizard" {
    Properties {
        _Color ("Color", Color) = (1,0.7982759,0.1397059,1)
        _opacity ("opacity", Range(0, 1)) = 1
        _nuage ("nuage", 2D) = "white" {}
        _outline ("outline", Color) = (1,0.6,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _opacity;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,_opacity);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
