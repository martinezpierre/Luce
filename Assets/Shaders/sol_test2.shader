// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-121-OUT,voffset-2591-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32716,y:32527,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:472,x:30496,y:33075,varname:node_472,prsc:2,uv:0;n:type:ShaderForge.SFN_Noise,id:6020,x:31755,y:33171,varname:node_6020,prsc:2|XY-5826-UVOUT;n:type:ShaderForge.SFN_NormalVector,id:1320,x:32280,y:33117,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:7452,x:32422,y:33003,varname:node_7452,prsc:2|A-6659-OUT,B-1320-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3670,x:31857,y:33490,varname:node_3670,prsc:2,min:0,max:1;n:type:ShaderForge.SFN_Time,id:820,x:32096,y:33290,varname:node_820,prsc:2;n:type:ShaderForge.SFN_Sin,id:5756,x:32522,y:33335,varname:node_5756,prsc:2|IN-6234-OUT;n:type:ShaderForge.SFN_Vector1,id:4001,x:32096,y:33430,varname:node_4001,prsc:2,v1:5;n:type:ShaderForge.SFN_Multiply,id:6234,x:32339,y:33335,varname:node_6234,prsc:2|A-820-T,B-4001-OUT;n:type:ShaderForge.SFN_Multiply,id:2591,x:32522,y:33158,varname:node_2591,prsc:2|A-7452-OUT,B-5818-OUT;n:type:ShaderForge.SFN_Vector3,id:7610,x:32282,y:32768,varname:node_7610,prsc:2,v1:0.07352942,v2:0.07352942,v3:0.07352942;n:type:ShaderForge.SFN_Tex2d,id:4206,x:31048,y:33202,varname:node_4206,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-3930-OUT,TEX-4968-TEX;n:type:ShaderForge.SFN_ComponentMask,id:3538,x:31310,y:33236,varname:node_3538,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1;n:type:ShaderForge.SFN_Tex2dAsset,id:4968,x:30855,y:33310,ptovrint:False,ptlb:Nuage,ptin:_Nuage,varname:node_4968,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4187,x:31048,y:33035,varname:node_4187,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-831-OUT,TEX-4968-TEX;n:type:ShaderForge.SFN_Lerp,id:5506,x:31272,y:33065,varname:node_5506,prsc:2|A-4187-RGB,B-4206-RGB,T-783-OUT;n:type:ShaderForge.SFN_Vector1,id:783,x:30926,y:32973,varname:node_783,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:831,x:30689,y:33085,varname:node_831,prsc:2|A-472-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Slider,id:1015,x:30228,y:33249,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_1015,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6505727,max:1;n:type:ShaderForge.SFN_Multiply,id:3930,x:30855,y:33140,varname:node_3930,prsc:2|A-831-OUT,B-5228-OUT;n:type:ShaderForge.SFN_Vector1,id:5228,x:30652,y:33343,varname:node_5228,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:2565,x:30534,y:33291,varname:node_2565,prsc:2|A-1015-OUT,B-8624-T;n:type:ShaderForge.SFN_Time,id:8624,x:30345,y:33345,varname:node_8624,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:5826,x:31592,y:33159,varname:node_5826,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:8458,x:31637,y:32902,ptovrint:False,ptlb:cloudd,ptin:_cloudd,varname:node_4206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:6659,x:32020,y:33032,varname:node_6659,prsc:2|A-8458-RGB,B-6020-OUT,T-7147-OUT;n:type:ShaderForge.SFN_Vector1,id:7147,x:31986,y:33171,varname:node_7147,prsc:2,v1:0.5;n:type:ShaderForge.SFN_RemapRange,id:5818,x:32709,y:33311,varname:node_5818,prsc:2,frmn:-1,frmx:1,tomn:-0.5,tomx:2|IN-5756-OUT;n:type:ShaderForge.SFN_Tex2d,id:7575,x:32282,y:32610,ptovrint:False,ptlb:cloudd_copy,ptin:_cloudd_copy,varname:_cloudd_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:121,x:32489,y:32590,varname:node_121,prsc:2|A-7575-RGB,B-7610-OUT,T-1726-OUT;n:type:ShaderForge.SFN_Vector1,id:1726,x:32394,y:32858,varname:node_1726,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Rotator,id:7359,x:32197,y:32895,varname:node_7359,prsc:2;n:type:ShaderForge.SFN_Panner,id:3112,x:31943,y:32878,varname:node_3112,prsc:2,spu:1,spv:1;proporder:1304-4968-1015-8458-7575;pass:END;sub:END;*/

Shader "Shader Forge/sol_test2" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Nuage ("Nuage", 2D) = "white" {}
        _speed ("speed", Range(0, 1)) = 0.6505727
        _cloudd ("cloudd", 2D) = "white" {}
        _cloudd_copy ("cloudd_copy", 2D) = "white" {}
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _cloudd; uniform float4 _cloudd_ST;
            uniform sampler2D _cloudd_copy; uniform float4 _cloudd_copy_ST;
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
                float4 _cloudd_var = tex2Dlod(_cloudd,float4(TRANSFORM_TEX(o.uv0, _cloudd),0.0,0));
                float2 node_6020_skew = o.uv0 + 0.2127+o.uv0.x*0.3713*o.uv0.y;
                float2 node_6020_rnd = 4.789*sin(489.123*(node_6020_skew));
                float node_6020 = frac(node_6020_rnd.x*node_6020_rnd.y*(1+node_6020_skew.x));
                float4 node_820 = _Time + _TimeEditor;
                v.vertex.xyz += ((lerp(_cloudd_var.rgb,float3(node_6020,node_6020,node_6020),0.5)*v.normal)*(sin((node_820.g*5.0))*1.25+0.75));
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
                float4 _cloudd_copy_var = tex2D(_cloudd_copy,TRANSFORM_TEX(i.uv0, _cloudd_copy));
                float3 diffuseColor = lerp(_cloudd_copy_var.rgb,float3(0.07352942,0.07352942,0.07352942),0.8);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _cloudd; uniform float4 _cloudd_ST;
            uniform sampler2D _cloudd_copy; uniform float4 _cloudd_copy_ST;
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
                float4 _cloudd_var = tex2Dlod(_cloudd,float4(TRANSFORM_TEX(o.uv0, _cloudd),0.0,0));
                float2 node_6020_skew = o.uv0 + 0.2127+o.uv0.x*0.3713*o.uv0.y;
                float2 node_6020_rnd = 4.789*sin(489.123*(node_6020_skew));
                float node_6020 = frac(node_6020_rnd.x*node_6020_rnd.y*(1+node_6020_skew.x));
                float4 node_820 = _Time + _TimeEditor;
                v.vertex.xyz += ((lerp(_cloudd_var.rgb,float3(node_6020,node_6020,node_6020),0.5)*v.normal)*(sin((node_820.g*5.0))*1.25+0.75));
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
                float4 _cloudd_copy_var = tex2D(_cloudd_copy,TRANSFORM_TEX(i.uv0, _cloudd_copy));
                float3 diffuseColor = lerp(_cloudd_copy_var.rgb,float3(0.07352942,0.07352942,0.07352942),0.8);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            uniform sampler2D _cloudd; uniform float4 _cloudd_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 _cloudd_var = tex2Dlod(_cloudd,float4(TRANSFORM_TEX(o.uv0, _cloudd),0.0,0));
                float2 node_6020_skew = o.uv0 + 0.2127+o.uv0.x*0.3713*o.uv0.y;
                float2 node_6020_rnd = 4.789*sin(489.123*(node_6020_skew));
                float node_6020 = frac(node_6020_rnd.x*node_6020_rnd.y*(1+node_6020_skew.x));
                float4 node_820 = _Time + _TimeEditor;
                v.vertex.xyz += ((lerp(_cloudd_var.rgb,float3(node_6020,node_6020,node_6020),0.5)*v.normal)*(sin((node_820.g*5.0))*1.25+0.75));
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
