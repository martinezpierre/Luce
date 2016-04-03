// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3217992,fgcg:0.174308,fgcb:0.9117647,fgca:1,fgde:0.01,fgrn:100,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7859,x:33954,y:32211,varname:node_7859,prsc:2|emission-8150-OUT,voffset-9203-OUT,tess-6731-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6619,x:32374,y:32500,ptovrint:False,ptlb:Tex_Cloud,ptin:_Tex_Cloud,varname:node_6619,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4176,x:32619,y:32273,varname:node_4176,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-9167-UVOUT,TEX-6619-TEX;n:type:ShaderForge.SFN_FragmentPosition,id:8362,x:31764,y:32442,varname:node_8362,prsc:2;n:type:ShaderForge.SFN_Append,id:4421,x:31998,y:32454,varname:node_4421,prsc:2|A-8362-X,B-8362-Y;n:type:ShaderForge.SFN_Panner,id:9167,x:32374,y:32341,varname:node_9167,prsc:2,spu:1.3,spv:4|UVIN-4421-OUT;n:type:ShaderForge.SFN_Tex2d,id:4572,x:32619,y:32500,varname:node_4572,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-9663-UVOUT,TEX-5270-TEX;n:type:ShaderForge.SFN_Panner,id:9663,x:32374,y:32680,varname:node_9663,prsc:2,spu:2.7,spv:-3|UVIN-4421-OUT;n:type:ShaderForge.SFN_Add,id:7494,x:33079,y:32443,varname:node_7494,prsc:2|A-7355-OUT,B-687-OUT;n:type:ShaderForge.SFN_Multiply,id:9203,x:33705,y:32566,varname:node_9203,prsc:2|A-6978-OUT,B-2780-OUT,C-7813-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5270,x:32374,y:32842,ptovrint:False,ptlb:Tex_BigCloud,ptin:_Tex_BigCloud,varname:node_5270,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector3,id:7813,x:33705,y:32810,cmnt:offset direction,varname:node_7813,prsc:2,v1:0.3,v2:0.3,v3:1;n:type:ShaderForge.SFN_ValueProperty,id:2780,x:33705,y:32489,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_2780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7355,x:32900,y:32274,varname:node_7355,prsc:2|A-4176-R,B-7824-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7824,x:32760,y:32410,ptovrint:False,ptlb:Force1,ptin:_Force1,varname:node_7824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7551,x:32791,y:32648,ptovrint:False,ptlb:Force2,ptin:_Force2,varname:node_7551,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:687,x:32900,y:32461,varname:node_687,prsc:2|A-4572-R,B-7551-OUT;n:type:ShaderForge.SFN_Time,id:6359,x:32551,y:32818,varname:node_6359,prsc:2;n:type:ShaderForge.SFN_Sin,id:9383,x:33142,y:32876,varname:node_9383,prsc:2|IN-9932-OUT;n:type:ShaderForge.SFN_RemapRange,id:747,x:33310,y:32876,varname:node_747,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9383-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4737,x:32712,y:33006,ptovrint:False,ptlb:WaveSpeed,ptin:_WaveSpeed,varname:node_4737,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:9619,x:32760,y:32833,varname:node_9619,prsc:2|A-6359-T,B-4737-OUT;n:type:ShaderForge.SFN_Add,id:9932,x:32983,y:32876,varname:node_9932,prsc:2|A-9619-OUT,B-7996-OUT;n:type:ShaderForge.SFN_Add,id:6978,x:33320,y:32508,varname:node_6978,prsc:2|A-7494-OUT,B-747-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1282,x:32039,y:33057,ptovrint:False,ptlb:Tex_WaveCloud,ptin:_Tex_WaveCloud,varname:node_1282,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3487,x:32374,y:33037,varname:node_3487,prsc:2,tex:9664107dab8b7eb47b60b15d908bf7d6,ntxv:0,isnm:False|UVIN-4421-OUT,TEX-1282-TEX;n:type:ShaderForge.SFN_Multiply,id:7996,x:32688,y:33083,varname:node_7996,prsc:2|A-3487-R,B-9364-OUT;n:type:ShaderForge.SFN_Tau,id:9364,x:32390,y:33189,varname:node_9364,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:9960,x:33496,y:32048,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_9960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b07750ad21c73b74699037a14aa8ff6a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:6731,x:33949,y:32708,ptovrint:False,ptlb:Tessellation,ptin:_Tessellation,varname:node_6731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:10,cur:10,max:30;n:type:ShaderForge.SFN_Lerp,id:8150,x:33698,y:32135,varname:node_8150,prsc:2|A-9960-RGB,B-3376-OUT,T-1631-OUT;n:type:ShaderForge.SFN_Vector3,id:3376,x:33496,y:32221,varname:node_3376,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector1,id:1631,x:33606,y:32314,varname:node_1631,prsc:2,v1:0.9;proporder:6619-5270-2780-7824-7551-4737-1282-9960-6731;pass:END;sub:END;*/

Shader "Luce/DarkMatterBlock_Zup" {
    Properties {
        _Tex_Cloud ("Tex_Cloud", 2D) = "white" {}
        _Tex_BigCloud ("Tex_BigCloud", 2D) = "white" {}
        _Height ("Height", Float ) = 1
        _Force1 ("Force1", Float ) = 0
        _Force2 ("Force2", Float ) = 0
        _WaveSpeed ("WaveSpeed", Float ) = 0
        _Tex_WaveCloud ("Tex_WaveCloud", 2D) = "white" {}
        _diffuse ("diffuse", 2D) = "white" {}
        _Tessellation ("Tessellation", Range(10, 30)) = 10
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "Tessellation.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 5.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Tex_Cloud; uniform float4 _Tex_Cloud_ST;
            uniform sampler2D _Tex_BigCloud; uniform float4 _Tex_BigCloud_ST;
            uniform float _Height;
            uniform float _Force1;
            uniform float _Force2;
            uniform float _WaveSpeed;
            uniform sampler2D _Tex_WaveCloud; uniform float4 _Tex_WaveCloud_ST;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _Tessellation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
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
                float4 node_8842 = _Time + _TimeEditor;
                float2 node_4421 = float2(mul(_Object2World, v.vertex).r,mul(_Object2World, v.vertex).g);
                float2 node_9167 = (node_4421+node_8842.g*float2(1.3,4));
                float4 node_4176 = tex2Dlod(_Tex_Cloud,float4(TRANSFORM_TEX(node_9167, _Tex_Cloud),0.0,0));
                float2 node_9663 = (node_4421+node_8842.g*float2(2.7,-3));
                float4 node_4572 = tex2Dlod(_Tex_BigCloud,float4(TRANSFORM_TEX(node_9663, _Tex_BigCloud),0.0,0));
                float4 node_6359 = _Time + _TimeEditor;
                float4 node_3487 = tex2Dlod(_Tex_WaveCloud,float4(TRANSFORM_TEX(node_4421, _Tex_WaveCloud),0.0,0));
                v.vertex.xyz += ((((node_4176.r*_Force1)+(node_4572.r*_Force2))+(sin(((node_6359.g*_WaveSpeed)+(node_3487.r*6.28318530718)))*0.5+0.5))*_Height*float3(0.3,0.3,1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                float Tessellation(TessVertex v){
                    return _Tessellation;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o = (OutputPatchConstant)0;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v = (VertexInput)0;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                float3 emissive = lerp(_diffuse_var.rgb,float3(0,0,0),0.9);
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "Tessellation.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 5.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Tex_Cloud; uniform float4 _Tex_Cloud_ST;
            uniform sampler2D _Tex_BigCloud; uniform float4 _Tex_BigCloud_ST;
            uniform float _Height;
            uniform float _Force1;
            uniform float _Force2;
            uniform float _WaveSpeed;
            uniform sampler2D _Tex_WaveCloud; uniform float4 _Tex_WaveCloud_ST;
            uniform float _Tessellation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 node_4752 = _Time + _TimeEditor;
                float2 node_4421 = float2(mul(_Object2World, v.vertex).r,mul(_Object2World, v.vertex).g);
                float2 node_9167 = (node_4421+node_4752.g*float2(1.3,4));
                float4 node_4176 = tex2Dlod(_Tex_Cloud,float4(TRANSFORM_TEX(node_9167, _Tex_Cloud),0.0,0));
                float2 node_9663 = (node_4421+node_4752.g*float2(2.7,-3));
                float4 node_4572 = tex2Dlod(_Tex_BigCloud,float4(TRANSFORM_TEX(node_9663, _Tex_BigCloud),0.0,0));
                float4 node_6359 = _Time + _TimeEditor;
                float4 node_3487 = tex2Dlod(_Tex_WaveCloud,float4(TRANSFORM_TEX(node_4421, _Tex_WaveCloud),0.0,0));
                v.vertex.xyz += ((((node_4176.r*_Force1)+(node_4572.r*_Force2))+(sin(((node_6359.g*_WaveSpeed)+(node_3487.r*6.28318530718)))*0.5+0.5))*_Height*float3(0.3,0.3,1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    return o;
                }
                float Tessellation(TessVertex v){
                    return _Tessellation;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o = (OutputPatchConstant)0;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v = (VertexInput)0;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
