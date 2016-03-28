// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1,x:33715,y:32626,varname:node_1,prsc:2|diff-14-OUT,emission-106-OUT;n:type:ShaderForge.SFN_Add,id:3,x:33027,y:32635,varname:node_3,prsc:2|A-31-RGB,B-89-RGB;n:type:ShaderForge.SFN_Color,id:4,x:33211,y:32494,ptovrint:False,ptlb:under colour,ptin:_undercolour,varname:node_3259,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1544118,c3:0.566,c4:1;n:type:ShaderForge.SFN_Multiply,id:7,x:33380,y:32616,varname:node_7,prsc:2|A-4-RGB,B-3-OUT;n:type:ShaderForge.SFN_Tex2d,id:8,x:33088,y:32267,ptovrint:False,ptlb:dark matter texture,ptin:_darkmattertexture,varname:node_8353,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b8fd60abc83f85b439f776406f9a632b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:14,x:33549,y:32438,varname:node_14,prsc:2|A-8-RGB,B-16-OUT;n:type:ShaderForge.SFN_ValueProperty,id:16,x:33380,y:32490,ptovrint:False,ptlb:dark matter multiply value,ptin:_darkmattermultiplyvalue,varname:node_6766,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_TexCoord,id:22,x:32575,y:32902,varname:node_22,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:30,x:33302,y:32863,varname:node_30,prsc:2|A-33-OUT,B-3-OUT,C-55-OUT;n:type:ShaderForge.SFN_Tex2d,id:31,x:32790,y:32646,ptovrint:False,ptlb:mvt under texture,ptin:_mvtundertexture,varname:node_1636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-61-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:32,x:32790,y:32420,varname:node_32,prsc:2|IN-8-B;n:type:ShaderForge.SFN_Power,id:33,x:33027,y:32504,varname:node_33,prsc:2|VAL-32-OUT,EXP-34-OUT;n:type:ShaderForge.SFN_ValueProperty,id:34,x:32790,y:32569,ptovrint:False,ptlb:contrast value,ptin:_contrastvalue,varname:node_9031,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Slider,id:55,x:32978,y:33044,ptovrint:False,ptlb:node_55,ptin:_node_55,varname:node_8167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Panner,id:61,x:32831,y:32902,varname:node_61,prsc:2,spu:1,spv:1|UVIN-22-UVOUT;n:type:ShaderForge.SFN_Color,id:89,x:33027,y:32870,ptovrint:False,ptlb:idk a colour,ptin:_idkacolour,varname:node_2619,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Blend,id:106,x:33538,y:32732,varname:node_106,prsc:2,blmd:10,clmp:True|SRC-7-OUT,DST-30-OUT;proporder:4-8-16-34-31-55-89;pass:END;sub:END;*/

Shader "Luce_Lizard_DarkMatter" {
    Properties {
        _undercolour ("under colour", Color) = (1,0.1544118,0.566,1)
        _darkmattertexture ("dark matter texture", 2D) = "white" {}
        _darkmattermultiplyvalue ("dark matter multiply value", Float ) = 0.2
        _contrastvalue ("contrast value", Float ) = 10
        _mvtundertexture ("mvt under texture", 2D) = "white" {}
        _node_55 ("node_55", Range(0, 1)) = 1
        _idkacolour ("idk a colour", Color) = (0.5,0.5,0.5,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _undercolour;
            uniform sampler2D _darkmattertexture; uniform float4 _darkmattertexture_ST;
            uniform float _darkmattermultiplyvalue;
            uniform sampler2D _mvtundertexture; uniform float4 _mvtundertexture_ST;
            uniform float _contrastvalue;
            uniform float _node_55;
            uniform float4 _idkacolour;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _darkmattertexture_var = tex2D(_darkmattertexture,TRANSFORM_TEX(i.uv0, _darkmattertexture));
                float3 diffuseColor = (_darkmattertexture_var.rgb*_darkmattermultiplyvalue);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_3517 = _Time + _TimeEditor;
                float2 node_61 = (i.uv0+node_3517.g*float2(1,1));
                float4 _mvtundertexture_var = tex2D(_mvtundertexture,TRANSFORM_TEX(node_61, _mvtundertexture));
                float3 node_3 = (_mvtundertexture_var.rgb+_idkacolour.rgb);
                float3 emissive = saturate(( (pow((1.0 - _darkmattertexture_var.b),_contrastvalue)*node_3*_node_55) > 0.5 ? (1.0-(1.0-2.0*((pow((1.0 - _darkmattertexture_var.b),_contrastvalue)*node_3*_node_55)-0.5))*(1.0-(_undercolour.rgb*node_3))) : (2.0*(pow((1.0 - _darkmattertexture_var.b),_contrastvalue)*node_3*_node_55)*(_undercolour.rgb*node_3)) ));
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _undercolour;
            uniform sampler2D _darkmattertexture; uniform float4 _darkmattertexture_ST;
            uniform float _darkmattermultiplyvalue;
            uniform sampler2D _mvtundertexture; uniform float4 _mvtundertexture_ST;
            uniform float _contrastvalue;
            uniform float _node_55;
            uniform float4 _idkacolour;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _darkmattertexture_var = tex2D(_darkmattertexture,TRANSFORM_TEX(i.uv0, _darkmattertexture));
                float3 diffuseColor = (_darkmattertexture_var.rgb*_darkmattermultiplyvalue);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
