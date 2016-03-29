// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1,x:33883,y:32635,varname:node_1,prsc:2|custl-9377-OUT;n:type:ShaderForge.SFN_Add,id:3,x:33027,y:32635,varname:node_3,prsc:2|A-31-RGB,B-89-RGB;n:type:ShaderForge.SFN_Color,id:4,x:33211,y:32494,ptovrint:False,ptlb:node_4,ptin:_node_4,varname:node_3259,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7317444,c3:0.1544118,c4:1;n:type:ShaderForge.SFN_Multiply,id:7,x:33380,y:32616,varname:node_7,prsc:2|A-4-RGB,B-31-RGB;n:type:ShaderForge.SFN_Multiply,id:14,x:33549,y:32438,varname:node_14,prsc:2|B-16-OUT;n:type:ShaderForge.SFN_ValueProperty,id:16,x:33380,y:32490,ptovrint:False,ptlb:node_16,ptin:_node_16,varname:node_6766,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_TexCoord,id:22,x:32650,y:32902,varname:node_22,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:30,x:33354,y:32760,varname:node_30,prsc:2|B-3-OUT,C-55-OUT;n:type:ShaderForge.SFN_Tex2d,id:31,x:32771,y:32567,ptovrint:False,ptlb:node_31,ptin:_node_31,varname:node_1636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-61-UVOUT;n:type:ShaderForge.SFN_Slider,id:55,x:32988,y:32870,ptovrint:False,ptlb:node_55,ptin:_node_55,varname:node_8167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Panner,id:61,x:32831,y:32902,varname:node_61,prsc:2,spu:1,spv:1|UVIN-22-UVOUT,DIST-3149-TSL;n:type:ShaderForge.SFN_Color,id:89,x:33027,y:32870,ptovrint:False,ptlb:node_89,ptin:_node_89,varname:node_2619,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7867647,c2:0.6673936,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:2753,x:33323,y:33005,varname:node_2753,prsc:2|A-3-OUT,B-55-OUT;n:type:ShaderForge.SFN_Lerp,id:9377,x:33560,y:32814,varname:node_9377,prsc:2|A-7-OUT,B-2753-OUT,T-7908-RGB;n:type:ShaderForge.SFN_Color,id:7908,x:33514,y:33056,ptovrint:False,ptlb:node_7908,ptin:_node_7908,varname:node_7908,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8448276,c3:0.3382353,c4:1;n:type:ShaderForge.SFN_Slider,id:6798,x:33525,y:33196,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_6798,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Time,id:3149,x:32723,y:33081,varname:node_3149,prsc:2;proporder:4-16-31-55-89-7908-6798;pass:END;sub:END;*/

Shader "Luce/lizard" {
    Properties {
        _node_4 ("node_4", Color) = (1,0.7317444,0.1544118,1)
        _node_16 ("node_16", Float ) = 0.2
        _node_31 ("node_31", 2D) = "white" {}
        _node_55 ("node_55", Range(0, 1)) = 1
        _node_89 ("node_89", Color) = (0.7867647,0.6673936,0,1)
        _node_7908 ("node_7908", Color) = (1,0.8448276,0.3382353,1)
        _opacity ("opacity", Range(0, 1)) = 1
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _node_4;
            uniform sampler2D _node_31; uniform float4 _node_31_ST;
            uniform float _node_55;
            uniform float4 _node_89;
            uniform float4 _node_7908;
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
                float4 node_3149 = _Time + _TimeEditor;
                float2 node_61 = (i.uv0+node_3149.r*float2(1,1));
                float4 _node_31_var = tex2D(_node_31,TRANSFORM_TEX(node_61, _node_31));
                float3 node_3 = (_node_31_var.rgb+_node_89.rgb);
                float3 finalColor = lerp((_node_4.rgb*_node_31_var.rgb),(node_3*_node_55),_node_7908.rgb);
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
