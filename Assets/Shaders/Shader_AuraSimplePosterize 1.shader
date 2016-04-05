// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:0,x:34436,y:31973,varname:node_0,prsc:2|emission-2977-RGB,custl-6188-OUT;n:type:ShaderForge.SFN_Tex2d,id:2977,x:33620,y:31886,ptovrint:False,ptlb:texture object,ptin:_textureobject,varname:node_2977,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Posterize,id:2650,x:33620,y:32131,varname:node_2650,prsc:2|IN-9572-OUT,STPS-5303-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5574,x:33984,y:32383,varname:node_5574,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:5303,x:33421,y:32299,ptovrint:False,ptlb:posterize steps,ptin:_posterizesteps,varname:node_5303,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_NormalVector,id:1996,x:33275,y:32065,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:6200,x:33275,y:32218,varname:node_6200,prsc:2;n:type:ShaderForge.SFN_Dot,id:9572,x:33435,y:32121,varname:node_9572,prsc:2,dt:0|A-1996-OUT,B-6200-OUT;n:type:ShaderForge.SFN_Multiply,id:6188,x:34240,y:32194,varname:node_6188,prsc:2|A-4492-RGB,B-1063-OUT,C-2039-OUT,D-5574-OUT;n:type:ShaderForge.SFN_Multiply,id:1063,x:33817,y:32116,varname:node_1063,prsc:2|A-2977-RGB,B-2650-OUT;n:type:ShaderForge.SFN_Add,id:2039,x:33984,y:32238,varname:node_2039,prsc:2|A-1063-OUT,B-8585-RGB;n:type:ShaderForge.SFN_AmbientLight,id:8585,x:33817,y:32261,varname:node_8585,prsc:2;n:type:ShaderForge.SFN_LightColor,id:4492,x:33972,y:32019,varname:node_4492,prsc:2;proporder:2977-5303;pass:END;sub:END;*/

Shader "Luce/AuraSimplePosterize" {
    Properties {
        _textureobject ("texture object", 2D) = "white" {}
        _posterizesteps ("posterize steps", Float ) = 3
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform sampler2D _textureobject; uniform float4 _textureobject_ST;
            uniform float _posterizesteps;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float4 _textureobject_var = tex2D(_textureobject,TRANSFORM_TEX(i.uv0, _textureobject));
                float3 emissive = _textureobject_var.rgb;
                float3 node_1063 = (_textureobject_var.rgb*floor(dot(i.normalDir,lightDirection) * _posterizesteps) / (_posterizesteps - 1));
                float3 finalColor = emissive + (_LightColor0.rgb*node_1063*(node_1063+UNITY_LIGHTMODEL_AMBIENT.rgb)*attenuation);
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform sampler2D _textureobject; uniform float4 _textureobject_ST;
            uniform float _posterizesteps;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float4 _textureobject_var = tex2D(_textureobject,TRANSFORM_TEX(i.uv0, _textureobject));
                float3 node_1063 = (_textureobject_var.rgb*floor(dot(i.normalDir,lightDirection) * _posterizesteps) / (_posterizesteps - 1));
                float3 finalColor = (_LightColor0.rgb*node_1063*(node_1063+UNITY_LIGHTMODEL_AMBIENT.rgb)*attenuation);
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #include "UnityCG.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform sampler2D _textureobject; uniform float4 _textureobject_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _textureobject_var = tex2D(_textureobject,TRANSFORM_TEX(i.uv0, _textureobject));
                o.Emission = _textureobject_var.rgb;
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
