#pragma pack_matrix(row_major)
#ifdef SLANG_HLSL_ENABLE_NVAPI
#include "nvHLSLExtns.h"
#endif
#pragma warning(disable: 3557)


#line 67 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct SLANG_ParameterGroup_CB_0
{
    uint gFrameCount_0;
    uint gPRNGDimension_0;
    bool gUseFixedSeed_0;
    uint gFixedSeed_0;
    bool gDisableDivergence_0;
    uint gGamma_0;
    float gAssertThreshold_0;
    uint gSubpixelCount_0;
};


#line 67
cbuffer CB_0 : register(b0)
{
    SLANG_ParameterGroup_CB_0 CB_0;
}

#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
struct LightCollection_0
{
    uint triangleCount_0;
    uint activeTriangleCount_0;
    uint meshCount_0;
};


#line 30 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightProfile.slang"
struct LightProfile_0
{
    float fluxFactor_0;
};


#line 35 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/EnvMapData.slang"
struct EnvMapData_0
{
    matrix<float,int(3),int(4)>  transform_0;
    matrix<float,int(3),int(4)>  invTransform_0;
    float3 tint_0;
    float intensity_0;
};


#line 33 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/EnvMap.slang"
struct EnvMap_0
{
    EnvMapData_0 data_0;
};


#line 35 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Camera/CameraData.slang"
struct CameraData_0
{
    matrix<float,int(4),int(4)>  viewMat_0;
    matrix<float,int(4),int(4)>  prevViewMat_0;
    matrix<float,int(4),int(4)>  projMat_0;
    matrix<float,int(4),int(4)>  viewProjMat_0;
    matrix<float,int(4),int(4)>  invViewProj_0;
    matrix<float,int(4),int(4)>  viewProjMatNoJitter_0;
    matrix<float,int(4),int(4)>  prevViewProjMatNoJitter_0;
    matrix<float,int(4),int(4)>  projMatNoJitter_0;
    float3 posW_0;
    float focalLength_0;
    float3 prevPosW_0;
    float _padding0_0;
    float3 up_0;
    float aspectRatio_0;
    float3 target_0;
    float nearZ_0;
    float3 cameraU_0;
    float farZ_0;
    float3 cameraV_0;
    float jitterX_0;
    float3 cameraW_0;
    float jitterY_0;
    float frameHeight_0;
    float frameWidth_0;
    float focalDistance_0;
    float apertureRadius_0;
    float shutterSpeed_0;
    float ISOSpeed_0;
    float _padding1_0;
    float _padding2_0;
};


#line 32 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Camera/Camera.slang"
struct Camera_0
{
    CameraData_0 data_1;
};


#line 33 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Volume/Grid.slang"
struct Grid_0
{
    int3 minIndex_0;
    float minValue_0;
    int3 maxIndex_0;
    float maxValue_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
struct Scene_0
{
    uint customPrimitiveInstanceOffset_0;
    uint customPrimitiveInstanceCount_0;
    uint customPrimitiveAABBOffset_0;
    uint lightCount_0;
    LightCollection_0 lightCollection_0;
    LightProfile_0 lightProfile_0;
    EnvMap_0 envMap_0;
    Camera_0 camera_0;
    uint gridVolumeCount_0;
    Grid_0  grids_0[int(1)];
};


#line 46 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Volume/Grid.slang"
cbuffer gScene_0 : register(b0, space2)
{
    Scene_0 gScene_0;
}

#line 5189 "hlsl.meta.slang"
RaytracingAccelerationStructure gScene_rtAccel_0 : register(t0, space2);


#line 5189
struct _S1
{
    matrix<float,int(4),int(4)>  _S2;
};


#line 5189
StructuredBuffer<_S1 > gScene_worldMatrices_0 : register(t1, space2);


#line 5189
StructuredBuffer<_S1 > gScene_inverseTransposeWorldMatrices_0 : register(t2, space2);


#line 5189
StructuredBuffer<_S1 > gScene_prevWorldMatrices_0 : register(t3, space2);


#line 5189
StructuredBuffer<_S1 > gScene_prevInverseTransposeWorldMatrices_0 : register(t4, space2);


#line 108 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct GeometryInstanceData_0
{
    uint flags_0;
    uint globalMatrixID_0;
    uint materialID_0;
    uint geometryID_0;
    uint vbOffset_0;
    uint ibOffset_0;
    uint instanceIndex_0;
    uint geometryIndex_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<GeometryInstanceData_0 > gScene_geometryInstances_0 : register(t5, space2);


#line 163 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct MeshDesc_0
{
    uint vbOffset_1;
    uint ibOffset_1;
    uint vertexCount_0;
    uint indexCount_0;
    uint skinningVbOffset_0;
    uint prevVbOffset_0;
    uint materialID_1;
    uint flags_1;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<MeshDesc_0 > gScene_meshes_0 : register(t6, space2);


#line 232 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct PackedStaticVertexData_0
{
    float3 position_0;
    float3 packedNormalTangentCurveRadius_0;
    float2 texCrd_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<PackedStaticVertexData_0 > gScene_vertices_0 : register(t7, space2);


#line 303 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct PrevVertexData_0
{
    float3 position_1;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<PrevVertexData_0 > gScene_prevVertices_0 : register(t8, space2);


#line 13 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
ByteAddressBuffer gScene_indexData_0 : register(t9, space2);


#line 333 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct CurveDesc_0
{
    uint vbOffset_2;
    uint ibOffset_2;
    uint vertexCount_1;
    uint indexCount_1;
    uint degree_0;
    uint materialID_2;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<CurveDesc_0 > gScene_curves_0 : register(t10, space2);


#line 348 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct StaticCurveVertexData_0
{
    float3 position_2;
    float radius_0;
    float2 texCrd_1;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<StaticCurveVertexData_0 > gScene_curveVertices_0 : register(t11, space2);


#line 355 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct DynamicCurveVertexData_0
{
    float3 position_3;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<DynamicCurveVertexData_0 > gScene_prevCurveVertices_0 : register(t12, space2);


#line 58
ByteAddressBuffer gScene_curveIndices_0 : register(t13, space2);


#line 33 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/AABB.slang"
struct AABB_0
{
    float3 minPoint_0;
    float3 maxPoint_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<AABB_0 > gScene_proceduralPrimitiveAABBs_0 : register(t14, space2);


#line 363 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct CustomPrimitiveDesc_0
{
    uint userID_0;
    uint aabbOffset_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<CustomPrimitiveDesc_0 > gScene_customPrimitives_0 : register(t15, space2);


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
struct MaterialHeader_0
{
    uint2 packedData_0;
};


#line 181
struct MaterialPayload_0
{
    uint  data_2[int(30)];
};


#line 192
struct MaterialDataBlob_0
{
    MaterialHeader_0 header_0;
    MaterialPayload_0 payload_0;
};


#line 51 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
StructuredBuffer<MaterialDataBlob_0 > gScene_materials_materialData_0 : register(t0, space3);


#line 51
SamplerState  gScene_materials_materialSamplers_0[int(256)] : register(s0, space3);


#line 51
Texture2D<float4 >  gScene_materials_materialTextures_0[int(49)] : register(t1, space3);


#line 51
ByteAddressBuffer  gScene_materials_materialBuffers_0[int(1)] : register(t50, space3);


#line 48 "C:/Falcor/build/python-3.8/bin/Release/shaders/Internal/Utils/Neural/Network.slang"
struct NetworkParamStorageFP16_0
{
    vector<half,4> a_0;
    vector<half,4> b_0;
    vector<half,4> c_0;
    vector<half,4> d_0;
};


#line 51 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
StructuredBuffer<NetworkParamStorageFP16_0 > gScene_materials_networkParamsFP16_0 : register(t51, space3);


#line 140 "C:/Falcor/build/python-3.8/bin/Release/shaders/Internal/Utils/Neural/Network.slang"
struct NetworkParamStorageFP32_0
{
    float4 a_1;
    float4 b_1;
};


#line 51 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
StructuredBuffer<NetworkParamStorageFP32_0 > gScene_materials_networkParamsFP32_0 : register(t52, space3);


#line 51
StructuredBuffer<int > gScene_materials_udimIndirection_0 : register(t53, space3);


#line 48 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightData.slang"
struct LightData_0
{
    float3 posW_1;
    uint type_0;
    float3 dirW_0;
    float openingAngle_0;
    float3 intensity_1;
    float cosOpeningAngle_0;
    float cosSubtendedAngle_0;
    float penumbraAngle_0;
    float2 _pad0_0;
    float3 tangent_0;
    float surfaceArea_0;
    float3 bitangent_0;
    float _pad1_0;
    matrix<float,int(4),int(4)>  transMat_0;
    matrix<float,int(4),int(4)>  transMatIT_0;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<LightData_0 > gScene_lights_0 : register(t16, space2);


#line 76 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollectionShared.slang"
struct PackedEmissiveTriangle_0
{
    float4  posAndTexCoords_0[int(3)];
    uint normal_0;
    uint area_0;
    uint materialID_3;
    uint lightIdx_0;
};


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
StructuredBuffer<PackedEmissiveTriangle_0 > gScene_lightCollection_triangleData_0 : register(t17, space2);


#line 41
StructuredBuffer<uint > gScene_lightCollection_activeTriangles_0 : register(t18, space2);


#line 41
StructuredBuffer<uint > gScene_lightCollection_triToActiveMapping_0 : register(t19, space2);


#line 153 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollectionShared.slang"
struct EmissiveFlux_0
{
    float flux_0;
    float3 averageRadiance_0;
};


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
StructuredBuffer<EmissiveFlux_0 > gScene_lightCollection_fluxData_0 : register(t20, space2);


#line 39 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/MeshLightData.slang"
struct MeshLightData_0
{
    uint instanceID_0;
    uint triangleOffset_0;
    uint triangleCount_1;
    uint materialID_4;
};


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
StructuredBuffer<MeshLightData_0 > gScene_lightCollection_meshData_0 : register(t21, space2);


#line 41
StructuredBuffer<uint > gScene_lightCollection_perMeshInstanceOffset_0 : register(t22, space2);


#line 41
Texture2D<float4 > gScene_lightProfile_texture_0 : register(t23, space2);


#line 41
SamplerState gScene_lightProfile_sampler_0 : register(s0, space2);


#line 41
Texture2D<float4 > gScene_envMap_envMap_0 : register(t24, space2);


#line 41
SamplerState gScene_envMap_envSampler_0 : register(s1, space2);


#line 35 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Volume/GridVolumeData.slang"
struct GridVolumeData_0
{
    matrix<float,int(4),int(4)>  transform_1;
    matrix<float,int(4),int(4)>  invTransform_1;
    float3 boundsMin_0;
    float densityScale_0;
    float3 boundsMax_0;
    float emissionScale_0;
    uint densityGrid_0;
    uint emissionGrid_0;
    uint flags_2;
    float anisotropy_0;
    float3 albedo_0;
    float emissionTemperature_0;
};


#line 34 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Volume/GridVolume.slang"
struct GridVolume_0
{
    GridVolumeData_0 data_3;
};


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
StructuredBuffer<GridVolume_0 > gScene_gridVolumes_0 : register(t25, space2);


#line 58
StructuredBuffer<uint >  gScene_grids_buf_0[int(1)] : register(t26, space2);


#line 33 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Volume/Grid.slang"
Texture3D<float2 >  gScene_grids_rangeTex_0[int(1)] : register(t27, space2);


#line 33
Texture3D<uint4 >  gScene_grids_indirectionTex_0[int(1)] : register(t28, space2);


#line 33
Texture3D<float >  gScene_grids_atlasTex_0[int(1)] : register(t29, space2);


#line 14 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
RWStructuredBuffer<uint > gIsVertexOpen_0 : register(u4);


#line 91 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
RWTexture2D<float4 > gBoundaryTerm_0 : register(u0);


#line 9 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
RWTexture2D<float4 > gOutputDColor_0 : register(u2);


#line 16 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
struct SLANG_ParameterGroup_ReparamCB_0
{
    uint gMaxFacesPerVertex_0;
    float gVMFConcentrationScreen_0;
    float gVMFConcentration_0;
    uint gAuxSampleCount_0;
    float gBoundaryTermBeta_0;
};


#line 16
cbuffer ReparamCB_0 : register(b1)
{
    SLANG_ParameterGroup_ReparamCB_0 ReparamCB_0;
}

#line 43 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Lights/EmissiveUniformSampler.slang"
struct EmissiveUniformSampler_0
{
    uint4 _dummy_0;
};


#line 80 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct PathTracerData_0
{
    EmissiveUniformSampler_0 emissiveSampler_0;
};

cbuffer gData_0 : register(b0, space1)
{
    PathTracerData_0 gData_0;
}

#line 10 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneIO.slang"
struct s_diff_s_diff_SceneDerivativeFlags_0
{
    int gradientMode_0;
};




s_diff_s_diff_SceneDerivativeFlags_0 SceneDerivativeFlags_make_0(int gradientMode_1)
{
    s_diff_s_diff_SceneDerivativeFlags_0 flags_3 = { gradientMode_1 };
    return flags_3;
}


#line 48
s_diff_s_diff_SceneDerivativeFlags_0 SceneDerivativeFlags_dzero_0()
{

    return SceneDerivativeFlags_make_0(int(1));
}


#line 34
s_diff_s_diff_SceneDerivativeFlags_0 SceneDerivativeFlags_dadd_0(s_diff_s_diff_SceneDerivativeFlags_0 a_2, s_diff_s_diff_SceneDerivativeFlags_0 b_2)
{

    return SceneDerivativeFlags_make_0(int(1));
}


#line 124 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct s_diff_s_diff_DifferentiableSceneQuery_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 gradientFlags_0;
};


#line 562 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
s_diff_s_diff_DifferentiableSceneQuery_0 DifferentiableSceneQuery_Differential_x24_syn_dzero_0()
{

#line 562
    s_diff_s_diff_DifferentiableSceneQuery_0 result_0;

#line 562
    result_0.gradientFlags_0 = SceneDerivativeFlags_dzero_0();

#line 562
    return result_0;
}


#line 562
s_diff_s_diff_DifferentiableSceneQuery_0 DifferentiableSceneQuery_Differential_x24_syn_dadd_0(s_diff_s_diff_DifferentiableSceneQuery_0 SLANG_anonymous_0_0, s_diff_s_diff_DifferentiableSceneQuery_0 SLANG_anonymous_1_0)
{

#line 562
    s_diff_s_diff_DifferentiableSceneQuery_0 result_1;

#line 562
    result_1.gradientFlags_0 = SceneDerivativeFlags_dadd_0(SLANG_anonymous_0_0.gradientFlags_0, SLANG_anonymous_1_0.gradientFlags_0);

#line 562
    return result_1;
}


#line 562
s_diff_s_diff_DifferentiableSceneQuery_0 DifferentiableSceneQuery_x24_syn_dzero_0()
{

#line 562
    s_diff_s_diff_DifferentiableSceneQuery_0 result_2;

#line 562
    result_2.gradientFlags_0 = SceneDerivativeFlags_dzero_0();

#line 562
    return result_2;
}


#line 562
s_diff_s_diff_DifferentiableSceneQuery_0 DifferentiableSceneQuery_x24_syn_dadd_0(s_diff_s_diff_DifferentiableSceneQuery_0 SLANG_anonymous_0_1, s_diff_s_diff_DifferentiableSceneQuery_0 SLANG_anonymous_1_1)
{

#line 562
    s_diff_s_diff_DifferentiableSceneQuery_0 result_3;

#line 562
    result_3.gradientFlags_0 = SceneDerivativeFlags_dadd_0(SLANG_anonymous_0_1.gradientFlags_0, SLANG_anonymous_1_1.gradientFlags_0);

#line 562
    return result_3;
}


#line 124 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct DifferentiableSceneQuery_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 gradientFlags_1;
};


DifferentiableSceneQuery_0 DifferentiableSceneQuery_x24init_0(s_diff_s_diff_SceneDerivativeFlags_0 _gradientFlags_0)
{

#line 130
    DifferentiableSceneQuery_0 _S3;


    _S3.gradientFlags_1 = _gradientFlags_0;

#line 130
    return _S3;
}


#line 21
struct s_diff_s_diff_DiffRay_0
{
    float3 origin_0;
    float3 direction_0;
};


#line 710 "diff.meta.slang"
s_diff_s_diff_DiffRay_0 DiffRay_x24_syn_dzero_0()
{

#line 710
    s_diff_s_diff_DiffRay_0 result_4;

#line 1182 "core.meta.slang"
    float3 _S4 = (float3)0.0;

#line 1182
    result_4.origin_0 = _S4;

#line 1182
    result_4.direction_0 = _S4;

#line 1182
    return result_4;
}


#line 1182
s_diff_s_diff_DiffRay_0 DiffRay_x24_syn_dadd_0(s_diff_s_diff_DiffRay_0 SLANG_anonymous_0_2, s_diff_s_diff_DiffRay_0 SLANG_anonymous_1_2)
{

#line 1182
    s_diff_s_diff_DiffRay_0 result_5;

#line 1182
    result_5.origin_0 = SLANG_anonymous_0_2.origin_0 + SLANG_anonymous_1_2.origin_0;

#line 1182
    result_5.direction_0 = SLANG_anonymous_0_2.direction_0 + SLANG_anonymous_1_2.direction_0;

#line 1182
    return result_5;
}


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct s_diff_s_diff_IntersectionInfo_0
{
    float3 barycentrics_0;
    float3 normalW_0;
    float3 posW_2;
    float hitT_0;
};


#line 718 "diff.meta.slang"
s_diff_s_diff_IntersectionInfo_0 IntersectionInfo_x24_syn_dzero_0()
{

#line 718
    s_diff_s_diff_IntersectionInfo_0 result_6;

#line 1182 "core.meta.slang"
    float3 _S5 = (float3)0.0;

#line 1182
    result_6.barycentrics_0 = _S5;

#line 1182
    result_6.normalW_0 = _S5;

#line 1182
    result_6.posW_2 = _S5;

#line 1182
    result_6.hitT_0 = 0.0;

#line 1182
    return result_6;
}


#line 1182
s_diff_s_diff_IntersectionInfo_0 IntersectionInfo_x24_syn_dadd_0(s_diff_s_diff_IntersectionInfo_0 SLANG_anonymous_0_3, s_diff_s_diff_IntersectionInfo_0 SLANG_anonymous_1_3)
{

#line 1182
    s_diff_s_diff_IntersectionInfo_0 result_7;

#line 1182
    result_7.barycentrics_0 = SLANG_anonymous_0_3.barycentrics_0 + SLANG_anonymous_1_3.barycentrics_0;

#line 1182
    result_7.normalW_0 = SLANG_anonymous_0_3.normalW_0 + SLANG_anonymous_1_3.normalW_0;

#line 1182
    result_7.posW_2 = SLANG_anonymous_0_3.posW_2 + SLANG_anonymous_1_3.posW_2;

#line 1182
    result_7.hitT_0 = SLANG_anonymous_0_3.hitT_0 + SLANG_anonymous_1_3.hitT_0;

#line 1182
    return result_7;
}


#line 1182
struct AnyValue120
{
    uint field0_0;
    uint field1_0;
    uint field2_0;
    uint field3_0;
    uint field4_0;
    uint field5_0;
    uint field6_0;
    uint field7_0;
    uint field8_0;
    uint field9_0;
    uint field10_0;
    uint field11_0;
    uint field12_0;
    uint field13_0;
    uint field14_0;
    uint field15_0;
    uint field16_0;
    uint field17_0;
    uint field18_0;
    uint field19_0;
    uint field20_0;
    uint field21_0;
    uint field22_0;
    uint field23_0;
    uint field24_0;
    uint field25_0;
    uint field26_0;
    uint field27_0;
    uint field28_0;
    uint field29_0;
};


#line 2597
AnyValue120 packAnyValue120_0(MaterialPayload_0 _S6)
{

#line 2597
    AnyValue120 _S7;

#line 2597
    _S7.field0_0 = 0U;

#line 2597
    _S7.field1_0 = 0U;

#line 2597
    _S7.field2_0 = 0U;

#line 2597
    _S7.field3_0 = 0U;

#line 2597
    _S7.field4_0 = 0U;

#line 2597
    _S7.field5_0 = 0U;

#line 2597
    _S7.field6_0 = 0U;

#line 2597
    _S7.field7_0 = 0U;

#line 2597
    _S7.field8_0 = 0U;

#line 2597
    _S7.field9_0 = 0U;

#line 2597
    _S7.field10_0 = 0U;

#line 2597
    _S7.field11_0 = 0U;

#line 2597
    _S7.field12_0 = 0U;

#line 2597
    _S7.field13_0 = 0U;

#line 2597
    _S7.field14_0 = 0U;

#line 2597
    _S7.field15_0 = 0U;

#line 2597
    _S7.field16_0 = 0U;

#line 2597
    _S7.field17_0 = 0U;

#line 2597
    _S7.field18_0 = 0U;

#line 2597
    _S7.field19_0 = 0U;

#line 2597
    _S7.field20_0 = 0U;

#line 2597
    _S7.field21_0 = 0U;

#line 2597
    _S7.field22_0 = 0U;

#line 2597
    _S7.field23_0 = 0U;

#line 2597
    _S7.field24_0 = 0U;

#line 2597
    _S7.field25_0 = 0U;

#line 2597
    _S7.field26_0 = 0U;

#line 2597
    _S7.field27_0 = 0U;

#line 2597
    _S7.field28_0 = 0U;

#line 2597
    _S7.field29_0 = 0U;

#line 2597
    _S7.field0_0 = _S6.data_2[int(0)];

#line 2597
    _S7.field1_0 = _S6.data_2[int(1)];

#line 2597
    _S7.field2_0 = _S6.data_2[int(2)];

#line 2597
    _S7.field3_0 = _S6.data_2[int(3)];

#line 2597
    _S7.field4_0 = _S6.data_2[int(4)];

#line 2597
    _S7.field5_0 = _S6.data_2[int(5)];

#line 2597
    _S7.field6_0 = _S6.data_2[int(6)];

#line 2597
    _S7.field7_0 = _S6.data_2[int(7)];

#line 2597
    _S7.field8_0 = _S6.data_2[int(8)];

#line 2597
    _S7.field9_0 = _S6.data_2[int(9)];

#line 2597
    _S7.field10_0 = _S6.data_2[int(10)];

#line 2597
    _S7.field11_0 = _S6.data_2[int(11)];

#line 2597
    _S7.field12_0 = _S6.data_2[int(12)];

#line 2597
    _S7.field13_0 = _S6.data_2[int(13)];

#line 2597
    _S7.field14_0 = _S6.data_2[int(14)];

#line 2597
    _S7.field15_0 = _S6.data_2[int(15)];

#line 2597
    _S7.field16_0 = _S6.data_2[int(16)];

#line 2597
    _S7.field17_0 = _S6.data_2[int(17)];

#line 2597
    _S7.field18_0 = _S6.data_2[int(18)];

#line 2597
    _S7.field19_0 = _S6.data_2[int(19)];

#line 2597
    _S7.field20_0 = _S6.data_2[int(20)];

#line 2597
    _S7.field21_0 = _S6.data_2[int(21)];

#line 2597
    _S7.field22_0 = _S6.data_2[int(22)];

#line 2597
    _S7.field23_0 = _S6.data_2[int(23)];

#line 2597
    _S7.field24_0 = _S6.data_2[int(24)];

#line 2597
    _S7.field25_0 = _S6.data_2[int(25)];

#line 2597
    _S7.field26_0 = _S6.data_2[int(26)];

#line 2597
    _S7.field27_0 = _S6.data_2[int(27)];

#line 2597
    _S7.field28_0 = _S6.data_2[int(28)];

#line 2597
    _S7.field29_0 = _S6.data_2[int(29)];

#line 2597
    return _S7;
}


#line 2597
struct AnyValue128
{
    uint field0_1;
    uint field1_1;
    uint field2_1;
    uint field3_1;
    uint field4_1;
    uint field5_1;
    uint field6_1;
    uint field7_1;
    uint field8_1;
    uint field9_1;
    uint field10_1;
    uint field11_1;
    uint field12_1;
    uint field13_1;
    uint field14_1;
    uint field15_1;
    uint field16_1;
    uint field17_1;
    uint field18_1;
    uint field19_1;
    uint field20_1;
    uint field21_1;
    uint field22_1;
    uint field23_1;
    uint field24_1;
    uint field25_1;
    uint field26_1;
    uint field27_1;
    uint field28_1;
    uint field29_1;
    uint field30_0;
    uint field31_0;
};


#line 2597
AnyValue128 packAnyValue128_0(MaterialDataBlob_0 _S8)
{

#line 2597
    AnyValue128 _S9;

#line 2597
    _S9.field0_1 = 0U;

#line 2597
    _S9.field1_1 = 0U;

#line 2597
    _S9.field2_1 = 0U;

#line 2597
    _S9.field3_1 = 0U;

#line 2597
    _S9.field4_1 = 0U;

#line 2597
    _S9.field5_1 = 0U;

#line 2597
    _S9.field6_1 = 0U;

#line 2597
    _S9.field7_1 = 0U;

#line 2597
    _S9.field8_1 = 0U;

#line 2597
    _S9.field9_1 = 0U;

#line 2597
    _S9.field10_1 = 0U;

#line 2597
    _S9.field11_1 = 0U;

#line 2597
    _S9.field12_1 = 0U;

#line 2597
    _S9.field13_1 = 0U;

#line 2597
    _S9.field14_1 = 0U;

#line 2597
    _S9.field15_1 = 0U;

#line 2597
    _S9.field16_1 = 0U;

#line 2597
    _S9.field17_1 = 0U;

#line 2597
    _S9.field18_1 = 0U;

#line 2597
    _S9.field19_1 = 0U;

#line 2597
    _S9.field20_1 = 0U;

#line 2597
    _S9.field21_1 = 0U;

#line 2597
    _S9.field22_1 = 0U;

#line 2597
    _S9.field23_1 = 0U;

#line 2597
    _S9.field24_1 = 0U;

#line 2597
    _S9.field25_1 = 0U;

#line 2597
    _S9.field26_1 = 0U;

#line 2597
    _S9.field27_1 = 0U;

#line 2597
    _S9.field28_1 = 0U;

#line 2597
    _S9.field29_1 = 0U;

#line 2597
    _S9.field30_0 = 0U;

#line 2597
    _S9.field31_0 = 0U;

#line 2597
    _S9.field0_1 = _S8.header_0.packedData_0[int(0)];

#line 2597
    _S9.field1_1 = _S8.header_0.packedData_0[int(1)];

#line 2597
    _S9.field2_1 = _S8.payload_0.data_2[int(0)];

#line 2597
    _S9.field3_1 = _S8.payload_0.data_2[int(1)];

#line 2597
    _S9.field4_1 = _S8.payload_0.data_2[int(2)];

#line 2597
    _S9.field5_1 = _S8.payload_0.data_2[int(3)];

#line 2597
    _S9.field6_1 = _S8.payload_0.data_2[int(4)];

#line 2597
    _S9.field7_1 = _S8.payload_0.data_2[int(5)];

#line 2597
    _S9.field8_1 = _S8.payload_0.data_2[int(6)];

#line 2597
    _S9.field9_1 = _S8.payload_0.data_2[int(7)];

#line 2597
    _S9.field10_1 = _S8.payload_0.data_2[int(8)];

#line 2597
    _S9.field11_1 = _S8.payload_0.data_2[int(9)];

#line 2597
    _S9.field12_1 = _S8.payload_0.data_2[int(10)];

#line 2597
    _S9.field13_1 = _S8.payload_0.data_2[int(11)];

#line 2597
    _S9.field14_1 = _S8.payload_0.data_2[int(12)];

#line 2597
    _S9.field15_1 = _S8.payload_0.data_2[int(13)];

#line 2597
    _S9.field16_1 = _S8.payload_0.data_2[int(14)];

#line 2597
    _S9.field17_1 = _S8.payload_0.data_2[int(15)];

#line 2597
    _S9.field18_1 = _S8.payload_0.data_2[int(16)];

#line 2597
    _S9.field19_1 = _S8.payload_0.data_2[int(17)];

#line 2597
    _S9.field20_1 = _S8.payload_0.data_2[int(18)];

#line 2597
    _S9.field21_1 = _S8.payload_0.data_2[int(19)];

#line 2597
    _S9.field22_1 = _S8.payload_0.data_2[int(20)];

#line 2597
    _S9.field23_1 = _S8.payload_0.data_2[int(21)];

#line 2597
    _S9.field24_1 = _S8.payload_0.data_2[int(22)];

#line 2597
    _S9.field25_1 = _S8.payload_0.data_2[int(23)];

#line 2597
    _S9.field26_1 = _S8.payload_0.data_2[int(24)];

#line 2597
    _S9.field27_1 = _S8.payload_0.data_2[int(25)];

#line 2597
    _S9.field28_1 = _S8.payload_0.data_2[int(26)];

#line 2597
    _S9.field29_1 = _S8.payload_0.data_2[int(27)];

#line 2597
    _S9.field30_0 = _S8.payload_0.data_2[int(28)];

#line 2597
    _S9.field31_0 = _S8.payload_0.data_2[int(29)];

#line 2597
    return _S9;
}


#line 37 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Camera/Camera.slang"
float3 Camera_getPosition_0(Camera_0 this_0)
{

#line 37
    return this_0.data_1.posW_0;
}


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/Pseudorandom/Xoshiro.slang"
struct Xoshiro128StarStar_0
{
    uint  state_0[int(4)];
};


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/UniformSampleGenerator.slang"
struct UniformSampleGenerator_0
{
    Xoshiro128StarStar_0 rng_0;
};


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/BitTricks.slang"
uint interleave_32bit_0(uint2 v_0)
{
    uint x_0 = v_0.x & 65535U;
    uint x_1 = (x_0 | x_0 << int(8)) & 16711935U;
    uint x_2 = (x_1 | x_1 << int(4)) & 252645135U;
    uint x_3 = (x_2 | x_2 << int(2)) & 858993459U;


    uint y_0 = v_0.y & 65535U;
    uint y_1 = (y_0 | y_0 << int(8)) & 16711935U;
    uint y_2 = (y_1 | y_1 << int(4)) & 252645135U;
    uint y_3 = (y_2 | y_2 << int(2)) & 858993459U;


    return (x_3 | x_3 << int(1)) & 1431655765U | ((y_3 | y_3 << int(1)) & 1431655765U) << int(1);
}


#line 48 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/Pseudorandom/SplitMix64.slang"
uint64_t asuint64_0(uint lowbits_0, uint highbits_0)
{
    return uint64_t(highbits_0) << int(32) | uint64_t(lowbits_0);
}


#line 43
struct SplitMix64_0
{
    uint64_t state_1;
};


#line 77
SplitMix64_0 createSplitMix64_0(uint s0_0, uint s1_0)
{
    SplitMix64_0 rng_1;
    rng_1.state_1 = asuint64_0(s0_0, s1_0);
    return rng_1;
}


#line 56
uint64_t nextRandom64_0(inout SplitMix64_0 rng_2)
{
    uint64_t _S10 = rng_2.state_1 + 11400714819323198485ULL;

#line 58
    rng_2.state_1 = _S10;
    uint64_t z_0 = (_S10 ^ _S10 >> int(30)) * 13787848793156543929ULL;
    uint64_t z_1 = (z_0 ^ z_0 >> int(27)) * 10723151780598845931ULL;
    return z_1 ^ z_1 >> int(31);
}


#line 110 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/Pseudorandom/Xoshiro.slang"
Xoshiro128StarStar_0 createXoshiro128StarStar_0(uint  s_0[int(4)])
{
    Xoshiro128StarStar_0 rng_3;
    rng_3.state_0[int(0)] = s_0[int(0)];
    rng_3.state_0[int(1)] = s_0[int(1)];
    rng_3.state_0[int(2)] = s_0[int(2)];
    rng_3.state_0[int(3)] = s_0[int(3)];
    return rng_3;
}


#line 53 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/UniformSampleGenerator.slang"
UniformSampleGenerator_0 UniformSampleGenerator_x24init_0(uint2 pixel_0, uint sampleNumber_0)
{

#line 64
    SplitMix64_0 rng_4 = createSplitMix64_0(interleave_32bit_0(pixel_0), sampleNumber_0);
    uint64_t s0_1 = nextRandom64_0(rng_4);
    uint64_t s1_1 = nextRandom64_0(rng_4);
    uint  seed_0[int(4)] = { uint(s0_1), uint(s0_1 >> int(32)), uint(s1_1), uint(s1_1 >> int(32)) };

#line 53
    UniformSampleGenerator_0 _S11;

#line 70
    _S11.rng_0 = createXoshiro128StarStar_0(seed_0);

#line 53
    return _S11;
}


#line 46 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/Pseudorandom/Xoshiro.slang"
uint rotl_0(uint x_4, int k_0)
{
    return x_4 << k_0 | x_4 >> int(32) - k_0;
}




uint nextRandom_0(inout Xoshiro128StarStar_0 rng_5)
{
    uint result_starstar_0 = rotl_0(rng_5.state_0[int(0)] * 5U, int(7)) * 9U;
    uint t_0 = rng_5.state_0[int(1)] << int(9);

    rng_5.state_0[int(2)] = rng_5.state_0[int(2)] ^ rng_5.state_0[int(0)];
    rng_5.state_0[int(3)] = rng_5.state_0[int(3)] ^ rng_5.state_0[int(1)];
    rng_5.state_0[int(1)] = rng_5.state_0[int(1)] ^ rng_5.state_0[int(2)];
    rng_5.state_0[int(0)] = rng_5.state_0[int(0)] ^ rng_5.state_0[int(3)];

    rng_5.state_0[int(2)] = rng_5.state_0[int(2)] ^ t_0;
    rng_5.state_0[int(3)] = rotl_0(rng_5.state_0[int(3)], int(11));

    return result_starstar_0;
}


#line 77 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/UniformSampleGenerator.slang"
uint UniformSampleGenerator_next_0(inout UniformSampleGenerator_0 this_1)
{

#line 77
    uint _S12 = nextRandom_0(this_1.rng_0);

#line 77
    return _S12;
}


#line 51 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Sampling/SampleGeneratorInterface.slang"
float sampleNext1D_0(inout UniformSampleGenerator_0 sg_0)
{


    uint bits_0 = UniformSampleGenerator_next_0(sg_0);
    return float(bits_0 >> int(8)) * 0.00000005960464477539;
}


float2 sampleNext2D_0(inout UniformSampleGenerator_0 sg_1)
{


    float _S13 = sampleNext1D_0(sg_1);

#line 62
    float2 sample_0;

    sample_0[int(0)] = _S13;
    float _S14 = sampleNext1D_0(sg_1);

#line 65
    sample_0[int(1)] = _S14;
    return sample_0;
}


#line 66
float s_bwd_log_0(float _S15)
{

#line 66
    return log(_S15);
}


#line 66
struct DiffPair_float_0
{
    float primal_0;
    float differential_0;
};


#line 1021 "diff.meta.slang"
void _d_max_0(inout DiffPair_float_0 dpx_0, inout DiffPair_float_0 dpy_0, float dOut_0)
{
    DiffPair_float_0 _S16 = dpx_0;

#line 1023
    float _S17;

#line 1023
    if(dpx_0.primal_0 > dpy_0.primal_0)
    {

#line 1023
        _S17 = dOut_0;

#line 1023
    }
    else
    {

#line 1023
        _S17 = 0.0;

#line 1023
    }

#line 1023
    dpx_0.primal_0 = _S16.primal_0;

#line 1023
    dpx_0.differential_0 = _S17;
    DiffPair_float_0 _S18 = dpy_0;

#line 1024
    if(dpy_0.primal_0 > _S16.primal_0)
    {

#line 1024
        _S17 = dOut_0;

#line 1024
    }
    else
    {

#line 1024
        _S17 = 0.0;

#line 1024
    }

#line 1024
    dpy_0.primal_0 = _S18.primal_0;

#line 1024
    dpy_0.differential_0 = _S17;
    return;
}


#line 1025
float s_bwd_max_0(float _S19, float _S20)
{

#line 1025
    return max(_S19, _S20);
}


#line 1025
void s_bwd_max_1(inout DiffPair_float_0 _S21, inout DiffPair_float_0 _S22, float _S23)
{

#line 1025
    _d_max_0(_S21, _S22, _S23);

#line 1025
    return;
}


#line 1 "token paste"
void _d_sqrt_0(inout DiffPair_float_0 dpx_1, float dOut_1)
{

#line 861 "diff.meta.slang"
    float _S24 = 0.5 / sqrt(max(0.00000010000000116861, dpx_1.primal_0)) * dOut_1;

#line 861
    dpx_1.primal_0 = dpx_1.primal_0;

#line 861
    dpx_1.differential_0 = _S24;

#line 835
    return;
}


#line 835
float s_bwd_sqrt_0(float _S25)
{

#line 835
    return sqrt(_S25);
}


#line 835
void s_bwd_sqrt_1(inout DiffPair_float_0 _S26, float _S27)
{

#line 835
    _d_sqrt_0(_S26, _S27);

#line 835
    return;
}


#line 835
float s_bwd_sin_0(float _S28)
{

#line 835
    return sin(_S28);
}


#line 835
float s_bwd_cos_0(float _S29)
{

#line 835
    return cos(_S29);
}


#line 1163 "hlsl.meta.slang"
struct DiffPair_float3_0
{
    float3 primal_0;
    float3 differential_0;
};


#line 555 "diff.meta.slang"
void _d_dot_0(inout DiffPair_float3_0 dpx_2, inout DiffPair_float3_0 dpy_1, float dOut_2)
{
    float3 x_d_result_0;



    x_d_result_0[int(0)] = dpy_1.primal_0[int(0)] * dOut_2;

#line 557
    float3 y_d_result_0;

#line 562
    y_d_result_0[int(0)] = dpx_2.primal_0[int(0)] * dOut_2;

#line 561
    x_d_result_0[int(1)] = dpy_1.primal_0[int(1)] * dOut_2;
    y_d_result_0[int(1)] = dpx_2.primal_0[int(1)] * dOut_2;

#line 561
    x_d_result_0[int(2)] = dpy_1.primal_0[int(2)] * dOut_2;
    y_d_result_0[int(2)] = dpx_2.primal_0[int(2)] * dOut_2;

#line 562
    dpx_2.primal_0 = dpx_2.primal_0;

#line 562
    dpx_2.differential_0 = x_d_result_0;

#line 562
    dpy_1.primal_0 = dpy_1.primal_0;

#line 562
    dpy_1.differential_0 = y_d_result_0;



    return;
}


#line 566
struct DiffPair_float2_0
{
    float2 primal_0;
    float2 differential_0;
};


#line 555
void _d_dot_1(inout DiffPair_float2_0 dpx_3, inout DiffPair_float2_0 dpy_2, float dOut_3)
{
    float2 x_d_result_1;



    x_d_result_1[int(0)] = dpy_2.primal_0[int(0)] * dOut_3;

#line 557
    float2 y_d_result_1;

#line 562
    y_d_result_1[int(0)] = dpx_3.primal_0[int(0)] * dOut_3;

#line 561
    x_d_result_1[int(1)] = dpy_2.primal_0[int(1)] * dOut_3;
    y_d_result_1[int(1)] = dpx_3.primal_0[int(1)] * dOut_3;

#line 562
    dpx_3.primal_0 = dpx_3.primal_0;

#line 562
    dpx_3.differential_0 = x_d_result_1;

#line 562
    dpy_2.primal_0 = dpy_2.primal_0;

#line 562
    dpy_2.differential_0 = y_d_result_1;



    return;
}


#line 379 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
struct HitInfo_0
{
    uint4 data_4;
};


#line 400
HitInfo_0 HitInfo_x24init_0()
{

#line 400
    HitInfo_0 _S30;

    _S30.data_4 = uint4(0U, 0U, 0U, 0U);

#line 400
    return _S30;
}


#line 45 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct GeometryInstanceID_0
{
    uint index_0;
};


#line 54
GeometryInstanceID_0 GeometryInstanceID_x24init_0(uint instanceID_1, uint geometryIndex_1)
{

#line 54
    GeometryInstanceID_0 _S31;

    _S31.index_0 = instanceID_1 + geometryIndex_1;

#line 54
    return _S31;
}


#line 68 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
struct GeometryHit_0
{
    GeometryInstanceID_0 instanceID_2;
    uint primitiveIndex_0;
    float2 barycentrics_1;
};


#line 92
struct TriangleHit_0
{
    GeometryHit_0 _SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit;
};


#line 61 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/RaytracingInline.slang"
TriangleHit_0 getCommittedTriangleHit_0(RayQuery<513U > rayQuery_0)
{
    TriangleHit_0 hit_0;
    hit_0._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2 = GeometryInstanceID_x24init_0(rayQuery_0.CommittedInstanceID(), rayQuery_0.CommittedGeometryIndex());
    hit_0._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0 = rayQuery_0.CommittedPrimitiveIndex();
    hit_0._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1 = rayQuery_0.CommittedTriangleBarycentrics();
    return hit_0;
}


#line 74
TriangleHit_0 getCandidateTriangleHit_0(RayQuery<513U > rayQuery_1)
{
    TriangleHit_0 hit_1;
    hit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2 = GeometryInstanceID_x24init_0(rayQuery_1.CandidateInstanceID(), rayQuery_1.CandidateGeometryIndex());
    hit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0 = rayQuery_1.CandidatePrimitiveIndex();
    hit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1 = rayQuery_1.CandidateTriangleBarycentrics();
    return hit_1;
}


#line 74
TriangleHit_0 getCandidateTriangleHit_1(RayQuery<517U > rayQuery_2)
{
    TriangleHit_0 hit_2;
    hit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2 = GeometryInstanceID_x24init_0(rayQuery_2.CandidateInstanceID(), rayQuery_2.CandidateGeometryIndex());
    hit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0 = rayQuery_2.CandidatePrimitiveIndex();
    hit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1 = rayQuery_2.CandidateTriangleBarycentrics();
    return hit_2;
}


#line 34 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/Ray.slang"
struct Ray_0
{
    float3 origin_1;
    float tMin_0;
    float3 dir_0;
    float tMax_0;
};


#line 55
RayDesc Ray_toRayDesc_0(Ray_0 this_2)
{

#line 55
    RayDesc _S32 = { this_2.origin_1, this_2.tMin_0, this_2.dir_0, this_2.tMax_0 };

#line 55
    return _S32;
}


#line 76 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
float3 GeometryHit_getBarycentricWeights_0(GeometryHit_0 this_3)
{
    float _S33 = this_3.barycentrics_1.x;

#line 78
    float _S34 = this_3.barycentrics_1.y;

#line 78
    return float3(1.0 - _S33 - _S34, _S33, _S34);
}


#line 267 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/FormatConversion.slang"
float2 unpackSnorm2x16_0(uint packed_0)
{

    precise float2 unpacked_0 = max(float2(int2(int(packed_0 << int(16)), int(packed_0)) >> int(16)) / 32767.0, (float2)-1.0);
    return unpacked_0;
}


#line 156 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/MathHelpers.slang"
float2 oct_wrap_0(float2 v_1)
{
    return (1.0 - abs(v_1.yx)) * (v_1.xy >= 0.0 ? (float2)1.0 : (float2)-1.0);
}


#line 189
float3 oct_to_ndir_snorm_0(float2 p_0)
{
    float3 _S35 = float3(p_0.xy, 1.0 - abs(p_0.x) - abs(p_0.y));

#line 191
    float3 n_0 = _S35;

#line 191
    float2 _S36;
    if(_S35.z < 0.0)
    {

#line 192
        _S36 = oct_wrap_0(n_0.xy);

#line 192
    }
    else
    {

#line 192
        _S36 = n_0.xy;

#line 192
    }

#line 192
    n_0.xy = _S36;
    return normalize(n_0);
}


#line 62 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/PackedFormats.slang"
float3 decodeNormal2x16_0(uint packedNormal_0)
{

    return oct_to_ndir_snorm_0(unpackSnorm2x16_0(packedNormal_0));
}


#line 221 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct StaticVertexData_0
{
    float3 position_4;
    float3 normal_1;
    float4 tangent_1;
    float2 texCrd_2;
    float curveRadius_0;
};


#line 282
StaticVertexData_0 PackedStaticVertexData_unpack_0(PackedStaticVertexData_0 this_4)
{
    StaticVertexData_0 v_2;
    v_2.position_4 = this_4.position_0;
    v_2.texCrd_2 = this_4.texCrd_0;

    uint _S37 = asuint(this_4.packedNormalTangentCurveRadius_0.x);

#line 288
    v_2.normal_1[int(0)] = f16tof32(_S37 & 65535U);
    v_2.normal_1[int(1)] = f16tof32(_S37 >> int(16));
    uint _S38 = asuint(this_4.packedNormalTangentCurveRadius_0.y);

#line 290
    v_2.normal_1[int(2)] = f16tof32(_S38 & 65535U);
    v_2.normal_1 = normalize(v_2.normal_1);


    float packedTangentSignCurveRadius_0 = f16tof32(_S38 >> int(16));
    v_2.tangent_1 = float4(decodeNormal2x16_0(asuint(this_4.packedNormalTangentCurveRadius_0.z)), float(sign(packedTangentSignCurveRadius_0)));

    v_2.curveRadius_0 = abs(packedTangentSignCurveRadius_0);

    return v_2;
}


#line 602 "diff.meta.slang"
void _d_cross_0(inout DiffPair_float3_0 a_3, inout DiffPair_float3_0 b_3, float3 dOut_4)
{

#line 609
    float _S39 = dOut_4.y;

#line 609
    float _S40 = dOut_4.z;
    float _S41 = dOut_4.x;


    float dbx_0 = a_3.primal_0.z * _S39 + - a_3.primal_0.y * _S40;
    float dby_0 = - a_3.primal_0.z * _S41 + a_3.primal_0.x * _S40;
    float dbz_0 = a_3.primal_0.y * _S41 + - a_3.primal_0.x * _S39;

    float3 _S42 = float3(- b_3.primal_0.z * _S39 + b_3.primal_0.y * _S40, b_3.primal_0.z * _S41 + - b_3.primal_0.x * _S40, - b_3.primal_0.y * _S41 + b_3.primal_0.x * _S39);

#line 617
    a_3.primal_0 = a_3.primal_0;

#line 617
    a_3.differential_0 = _S42;
    float3 _S43 = float3(dbx_0, dby_0, dbz_0);

#line 618
    b_3.primal_0 = b_3.primal_0;

#line 618
    b_3.differential_0 = _S43;
    return;
}


#line 64 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/TextureSampler.slang"
struct AnyValue16
{
    uint field0_2;
    uint field1_2;
    uint field2_2;
    uint field3_2;
};


#line 62
struct ExplicitLodTextureSampler_0
{
    float lod_0;
};


#line 62
AnyValue16 packAnyValue16_0(ExplicitLodTextureSampler_0 _S44)
{

#line 62
    AnyValue16 _S45;

#line 62
    _S45.field0_2 = 0U;

#line 62
    _S45.field1_2 = 0U;

#line 62
    _S45.field2_2 = 0U;

#line 62
    _S45.field3_2 = 0U;

#line 62
    _S45.field0_2 = (uint)(asuint(_S44.lod_0));

#line 62
    return _S45;
}


ExplicitLodTextureSampler_0 unpackAnyValue16_0(AnyValue16 _S46)
{

#line 66
    ExplicitLodTextureSampler_0 _S47;

#line 66
    _S47.lod_0 = asfloat(_S46.field0_2);

#line 66
    return _S47;
}


#line 87 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
int MaterialHeader_getAlphaMode_0(MaterialHeader_0 this_5)
{

#line 87
    return int(this_5.packedData_0.y >> 16U & 1U);
}


#line 34 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/ShadingFrame.slang"
struct s_diff_ShadingFrame_0
{
    float3 T_0;
    float3 B_0;
    float3 N_0;
};


#line 34
s_diff_ShadingFrame_0 ShadingFrame_x24_syn_dzero_0()
{

#line 34
    s_diff_ShadingFrame_0 result_8;

#line 1182 "core.meta.slang"
    float3 _S48 = (float3)0.0;

#line 1182
    result_8.T_0 = _S48;

#line 1182
    result_8.B_0 = _S48;

#line 1182
    result_8.N_0 = _S48;

#line 1182
    return result_8;
}


#line 1182
s_diff_ShadingFrame_0 ShadingFrame_x24_syn_dadd_0(s_diff_ShadingFrame_0 SLANG_anonymous_0_4, s_diff_ShadingFrame_0 SLANG_anonymous_1_4)
{

#line 1182
    s_diff_ShadingFrame_0 result_9;

#line 1182
    result_9.T_0 = SLANG_anonymous_0_4.T_0 + SLANG_anonymous_1_4.T_0;

#line 1182
    result_9.B_0 = SLANG_anonymous_0_4.B_0 + SLANG_anonymous_1_4.B_0;

#line 1182
    result_9.N_0 = SLANG_anonymous_0_4.N_0 + SLANG_anonymous_1_4.N_0;

#line 1182
    return result_9;
}


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/ShadingData.slang"
struct s_diff_ShadingData_0
{
    float3 V_0;
    float2 uv_0;
    s_diff_ShadingFrame_0 frame_0;
    float IoR_0;
};


#line 47
s_diff_ShadingData_0 ShadingData_x24_syn_dzero_0()
{

#line 47
    s_diff_ShadingData_0 result_10;

#line 47
    result_10.V_0 = (float3)0.0;

#line 47
    result_10.uv_0 = (float2)0.0;

#line 47
    result_10.frame_0 = ShadingFrame_x24_syn_dzero_0();

#line 47
    result_10.IoR_0 = 0.0;

#line 47
    return result_10;
}


#line 47
s_diff_ShadingData_0 ShadingData_x24_syn_dadd_0(s_diff_ShadingData_0 SLANG_anonymous_0_5, s_diff_ShadingData_0 SLANG_anonymous_1_5)
{

#line 47
    s_diff_ShadingData_0 result_11;

#line 47
    result_11.V_0 = SLANG_anonymous_0_5.V_0 + SLANG_anonymous_1_5.V_0;

#line 47
    result_11.uv_0 = SLANG_anonymous_0_5.uv_0 + SLANG_anonymous_1_5.uv_0;

#line 47
    result_11.frame_0 = ShadingFrame_x24_syn_dadd_0(SLANG_anonymous_0_5.frame_0, SLANG_anonymous_1_5.frame_0);

#line 47
    result_11.IoR_0 = SLANG_anonymous_0_5.IoR_0 + SLANG_anonymous_1_5.IoR_0;

#line 47
    return result_11;
}


#line 47
uint2 U_SR35Rendering_2FxMaterials_2FxIMaterial9IMaterial16MaterialInstanceIR43Rendering_2FxMaterials_2FxIMaterialInstance17IMaterialInstance_0(uint2 _S49)
{

#line 47
    switch(_S49.x)
    {
    case 6U:
        {

#line 47
            return uint2(0U, 0U);
        }
    default:
        {

#line 47
            return uint2(1U, 0U);
        }
    }

#line 47
}


#line 79 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
int MaterialHeader_getMaterialType_0(MaterialHeader_0 this_6)
{

#line 79
    return int(this_6.packedData_0.x >> 0U & 65535U);
}


#line 95
half MaterialHeader_getAlphaThreshold_0(MaterialHeader_0 this_7)
{

#line 95
    return asfloat16(uint16_t(this_7.packedData_0.y >> 0U & 65535U));
}


#line 81 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/AlphaTest.slang"
bool evalBasicAlphaTest_0(float alpha_0, float threshold_0)
{
    return alpha_0 < threshold_0;
}


#line 1093 "diff.meta.slang"
void _d_clamp_0(inout DiffPair_float_0 dpx_4, inout DiffPair_float_0 dpMin_0, inout DiffPair_float_0 dpMax_0, float dOut_5)
{
    DiffPair_float_0 _S50 = dpx_4;

#line 1095
    float _S51;

#line 1095
    if(dpx_4.primal_0 > dpMin_0.primal_0 && dpx_4.primal_0 < dpMax_0.primal_0)
    {

#line 1095
        _S51 = dOut_5;

#line 1095
    }
    else
    {

#line 1095
        _S51 = 0.0;

#line 1095
    }

#line 1095
    dpx_4.primal_0 = _S50.primal_0;

#line 1095
    dpx_4.differential_0 = _S51;
    DiffPair_float_0 _S52 = dpMin_0;

#line 1096
    if(_S50.primal_0 <= dpMin_0.primal_0)
    {

#line 1096
        _S51 = dOut_5;

#line 1096
    }
    else
    {

#line 1096
        _S51 = 0.0;

#line 1096
    }

#line 1096
    dpMin_0.primal_0 = _S52.primal_0;

#line 1096
    dpMin_0.differential_0 = _S51;
    if(dpx_4.primal_0 >= dpMax_0.primal_0)
    {

#line 1097
        _S51 = dOut_5;

#line 1097
    }
    else
    {

#line 1097
        _S51 = 0.0;

#line 1097
    }

#line 1097
    dpMax_0.primal_0 = _S52.primal_0;

#line 1097
    dpMax_0.differential_0 = _S51;
    return;
}


#line 54 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/AlphaTest.slang"
bool evalAlphaTest_0(float alpha_1, float threshold_1, float3 posW_3)
{

#line 63
    return evalBasicAlphaTest_0(alpha_1, threshold_1);
}


#line 71 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/TextureSampler.slang"
float4 ExplicitLodTextureSampler_sampleTexture_0(ExplicitLodTextureSampler_0 this_8, Texture2D<float4 > t_1, SamplerState s_1, float2 uv_1)
{
    float4 _S53 = t_1.SampleLevel(s_1, uv_1, this_8.lod_0);

#line 73
    return _S53;
}


#line 73
float4 U_SR35Scene_2FxMaterial_2FxTextureSampler25ExplicitLodTextureSampler13sampleTexturep3p4core9Texture2DG1v4f4core12SamplerStatev2fv4f_wtwrapper_0(AnyValue16 _S54, Texture2D<float4 > _S55, SamplerState _S56, float2 _S57)
{

#line 73
    return ExplicitLodTextureSampler_sampleTexture_0(unpackAnyValue16_0(_S54), _S55, _S56, _S57);
}


#line 562 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
void HitInfo_packHeader_0(inout uint4 packed_1, uint type_1, GeometryInstanceID_0 instanceID_3, uint primitiveIndex_1)
{


    packed_1[int(0)] = type_1 << 29U | instanceID_3.index_0 << 13U | primitiveIndex_1;

#line 573
    return;
}


#line 109
uint4 TriangleHit_pack_0(TriangleHit_0 this_9)
{
    uint4 packed_2 = uint4(0U, 0U, 0U, 0U);

    HitInfo_packHeader_0(packed_2, 1U, this_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, this_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0);



    packed_2[int(2)] = asuint(this_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1.x);
    packed_2[int(3)] = asuint(this_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1.y);


    return packed_2;
}


#line 416
HitInfo_0 HitInfo_x24init_1(TriangleHit_0 triangleHit_0)
{

#line 416
    HitInfo_0 _S58;

    _S58.data_4 = TriangleHit_pack_0(triangleHit_0);

#line 416
    return _S58;
}


#line 322 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/SceneTypes.slang"
struct VertexData_0
{
    float3 posW_4;
    float3 normalW_1;
    float4 tangentW_0;
    float2 texC_0;
    float3 faceNormalW_0;
    float curveRadius_1;
    float coneTexLODValue_0;
};


#line 129 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"
GeometryInstanceData_0 Scene_getGeometryInstance_0(RaytracingAccelerationStructure _S59, StructuredBuffer<_S1 > _S60, StructuredBuffer<_S1 > _S61, StructuredBuffer<_S1 > _S62, StructuredBuffer<_S1 > _S63, StructuredBuffer<GeometryInstanceData_0 > _S64, StructuredBuffer<MeshDesc_0 > _S65, StructuredBuffer<PackedStaticVertexData_0 > _S66, StructuredBuffer<PrevVertexData_0 > _S67, ByteAddressBuffer _S68, StructuredBuffer<CurveDesc_0 > _S69, StructuredBuffer<StaticCurveVertexData_0 > _S70, StructuredBuffer<DynamicCurveVertexData_0 > _S71, ByteAddressBuffer _S72, StructuredBuffer<AABB_0 > _S73, StructuredBuffer<CustomPrimitiveDesc_0 > _S74, StructuredBuffer<MaterialDataBlob_0 > _S75, SamplerState  _S76[int(256)], Texture2D<float4 >  _S77[int(49)], ByteAddressBuffer  _S78[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S79, StructuredBuffer<NetworkParamStorageFP32_0 > _S80, StructuredBuffer<int > _S81, StructuredBuffer<LightData_0 > _S82, StructuredBuffer<PackedEmissiveTriangle_0 > _S83, StructuredBuffer<uint > _S84, StructuredBuffer<uint > _S85, StructuredBuffer<EmissiveFlux_0 > _S86, StructuredBuffer<MeshLightData_0 > _S87, StructuredBuffer<uint > _S88, Texture2D<float4 > _S89, SamplerState _S90, Texture2D<float4 > _S91, SamplerState _S92, StructuredBuffer<GridVolume_0 > _S93, StructuredBuffer<uint >  _S94[int(1)], Texture3D<float2 >  _S95[int(1)], Texture3D<uint4 >  _S96[int(1)], Texture3D<float >  _S97[int(1)], GeometryInstanceID_0 _S98)
{

#line 217
    GeometryInstanceData_0 _S99 = _S64[_S98.index_0];

#line 217
    return _S99;
}


#line 217
uint3 Scene_getLocalIndices_0(RaytracingAccelerationStructure _S100, StructuredBuffer<_S1 > _S101, StructuredBuffer<_S1 > _S102, StructuredBuffer<_S1 > _S103, StructuredBuffer<_S1 > _S104, StructuredBuffer<GeometryInstanceData_0 > _S105, StructuredBuffer<MeshDesc_0 > _S106, StructuredBuffer<PackedStaticVertexData_0 > _S107, StructuredBuffer<PrevVertexData_0 > _S108, ByteAddressBuffer _S109, StructuredBuffer<CurveDesc_0 > _S110, StructuredBuffer<StaticCurveVertexData_0 > _S111, StructuredBuffer<DynamicCurveVertexData_0 > _S112, ByteAddressBuffer _S113, StructuredBuffer<AABB_0 > _S114, StructuredBuffer<CustomPrimitiveDesc_0 > _S115, StructuredBuffer<MaterialDataBlob_0 > _S116, SamplerState  _S117[int(256)], Texture2D<float4 >  _S118[int(49)], ByteAddressBuffer  _S119[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S120, StructuredBuffer<NetworkParamStorageFP32_0 > _S121, StructuredBuffer<int > _S122, StructuredBuffer<LightData_0 > _S123, StructuredBuffer<PackedEmissiveTriangle_0 > _S124, StructuredBuffer<uint > _S125, StructuredBuffer<uint > _S126, StructuredBuffer<EmissiveFlux_0 > _S127, StructuredBuffer<MeshLightData_0 > _S128, StructuredBuffer<uint > _S129, Texture2D<float4 > _S130, SamplerState _S131, Texture2D<float4 > _S132, SamplerState _S133, StructuredBuffer<GridVolume_0 > _S134, StructuredBuffer<uint >  _S135[int(1)], Texture3D<float2 >  _S136[int(1)], Texture3D<uint4 >  _S137[int(1)], Texture3D<float >  _S138[int(1)], uint _S139, uint _S140, bool _S141)
{

#line 303
    uint3 _S142 = _S109.Load3(int(_S139 * 4U + _S140 * 12U));

#line 309
    return _S142;
}


#line 309
uint3 Scene_getIndices_0(RaytracingAccelerationStructure _S143, StructuredBuffer<_S1 > _S144, StructuredBuffer<_S1 > _S145, StructuredBuffer<_S1 > _S146, StructuredBuffer<_S1 > _S147, StructuredBuffer<GeometryInstanceData_0 > _S148, StructuredBuffer<MeshDesc_0 > _S149, StructuredBuffer<PackedStaticVertexData_0 > _S150, StructuredBuffer<PrevVertexData_0 > _S151, ByteAddressBuffer _S152, StructuredBuffer<CurveDesc_0 > _S153, StructuredBuffer<StaticCurveVertexData_0 > _S154, StructuredBuffer<DynamicCurveVertexData_0 > _S155, ByteAddressBuffer _S156, StructuredBuffer<AABB_0 > _S157, StructuredBuffer<CustomPrimitiveDesc_0 > _S158, StructuredBuffer<MaterialDataBlob_0 > _S159, SamplerState  _S160[int(256)], Texture2D<float4 >  _S161[int(49)], ByteAddressBuffer  _S162[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S163, StructuredBuffer<NetworkParamStorageFP32_0 > _S164, StructuredBuffer<int > _S165, StructuredBuffer<LightData_0 > _S166, StructuredBuffer<PackedEmissiveTriangle_0 > _S167, StructuredBuffer<uint > _S168, StructuredBuffer<uint > _S169, StructuredBuffer<EmissiveFlux_0 > _S170, StructuredBuffer<MeshLightData_0 > _S171, StructuredBuffer<uint > _S172, Texture2D<float4 > _S173, SamplerState _S174, Texture2D<float4 > _S175, SamplerState _S176, StructuredBuffer<GridVolume_0 > _S177, StructuredBuffer<uint >  _S178[int(1)], Texture3D<float2 >  _S179[int(1)], Texture3D<uint4 >  _S180[int(1)], Texture3D<float >  _S181[int(1)], GeometryInstanceID_0 _S182, uint _S183)
{

#line 309
    GeometryInstanceData_0 _S184 = Scene_getGeometryInstance_0(_S143, _S144, _S145, _S146, _S147, _S148, _S149, _S150, _S151, _S152, _S153, _S154, _S155, _S156, _S157, _S158, _S159, _S160, _S161, _S162, _S163, _S164, _S165, _S166, _S167, _S168, _S169, _S170, _S171, _S172, _S173, _S174, _S175, _S176, _S177, _S178, _S179, _S180, _S181, _S182);

#line 335
    return Scene_getLocalIndices_0(_S143, _S144, _S145, _S146, _S147, _S148, _S149, _S150, _S151, _S152, _S153, _S154, _S155, _S156, _S157, _S158, _S159, _S160, _S161, _S162, _S163, _S164, _S165, _S166, _S167, _S168, _S169, _S170, _S171, _S172, _S173, _S174, _S175, _S176, _S177, _S178, _S179, _S180, _S181, _S184.ibOffset_0, _S183, bool(_S184.flags_0 & 1U)) + _S184.vbOffset_0;
}


#line 344
StaticVertexData_0 Scene_getVertex_0(RaytracingAccelerationStructure _S185, StructuredBuffer<_S1 > _S186, StructuredBuffer<_S1 > _S187, StructuredBuffer<_S1 > _S188, StructuredBuffer<_S1 > _S189, StructuredBuffer<GeometryInstanceData_0 > _S190, StructuredBuffer<MeshDesc_0 > _S191, StructuredBuffer<PackedStaticVertexData_0 > _S192, StructuredBuffer<PrevVertexData_0 > _S193, ByteAddressBuffer _S194, StructuredBuffer<CurveDesc_0 > _S195, StructuredBuffer<StaticCurveVertexData_0 > _S196, StructuredBuffer<DynamicCurveVertexData_0 > _S197, ByteAddressBuffer _S198, StructuredBuffer<AABB_0 > _S199, StructuredBuffer<CustomPrimitiveDesc_0 > _S200, StructuredBuffer<MaterialDataBlob_0 > _S201, SamplerState  _S202[int(256)], Texture2D<float4 >  _S203[int(49)], ByteAddressBuffer  _S204[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S205, StructuredBuffer<NetworkParamStorageFP32_0 > _S206, StructuredBuffer<int > _S207, StructuredBuffer<LightData_0 > _S208, StructuredBuffer<PackedEmissiveTriangle_0 > _S209, StructuredBuffer<uint > _S210, StructuredBuffer<uint > _S211, StructuredBuffer<EmissiveFlux_0 > _S212, StructuredBuffer<MeshLightData_0 > _S213, StructuredBuffer<uint > _S214, Texture2D<float4 > _S215, SamplerState _S216, Texture2D<float4 > _S217, SamplerState _S218, StructuredBuffer<GridVolume_0 > _S219, StructuredBuffer<uint >  _S220[int(1)], Texture3D<float2 >  _S221[int(1)], Texture3D<uint4 >  _S222[int(1)], Texture3D<float >  _S223[int(1)], uint _S224)
{

#line 344
    PackedStaticVertexData_0 _S225 = _S192[_S224];

#line 344
    return PackedStaticVertexData_unpack_0(_S225);
}


#line 158
matrix<float,int(4),int(4)>  Scene_loadWorldMatrix_0(RaytracingAccelerationStructure _S226, StructuredBuffer<_S1 > _S227, StructuredBuffer<_S1 > _S228, StructuredBuffer<_S1 > _S229, StructuredBuffer<_S1 > _S230, StructuredBuffer<GeometryInstanceData_0 > _S231, StructuredBuffer<MeshDesc_0 > _S232, StructuredBuffer<PackedStaticVertexData_0 > _S233, StructuredBuffer<PrevVertexData_0 > _S234, ByteAddressBuffer _S235, StructuredBuffer<CurveDesc_0 > _S236, StructuredBuffer<StaticCurveVertexData_0 > _S237, StructuredBuffer<DynamicCurveVertexData_0 > _S238, ByteAddressBuffer _S239, StructuredBuffer<AABB_0 > _S240, StructuredBuffer<CustomPrimitiveDesc_0 > _S241, StructuredBuffer<MaterialDataBlob_0 > _S242, SamplerState  _S243[int(256)], Texture2D<float4 >  _S244[int(49)], ByteAddressBuffer  _S245[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S246, StructuredBuffer<NetworkParamStorageFP32_0 > _S247, StructuredBuffer<int > _S248, StructuredBuffer<LightData_0 > _S249, StructuredBuffer<PackedEmissiveTriangle_0 > _S250, StructuredBuffer<uint > _S251, StructuredBuffer<uint > _S252, StructuredBuffer<EmissiveFlux_0 > _S253, StructuredBuffer<MeshLightData_0 > _S254, StructuredBuffer<uint > _S255, Texture2D<float4 > _S256, SamplerState _S257, Texture2D<float4 > _S258, SamplerState _S259, StructuredBuffer<GridVolume_0 > _S260, StructuredBuffer<uint >  _S261[int(1)], Texture3D<float2 >  _S262[int(1)], Texture3D<uint4 >  _S263[int(1)], Texture3D<float >  _S264[int(1)], uint _S265)
{

#line 158
    _S1 _S266 = _S227[_S265];

#line 158
    return _S266._S2;
}


#line 158
matrix<float,int(4),int(4)>  Scene_getWorldMatrix_0(RaytracingAccelerationStructure _S267, StructuredBuffer<_S1 > _S268, StructuredBuffer<_S1 > _S269, StructuredBuffer<_S1 > _S270, StructuredBuffer<_S1 > _S271, StructuredBuffer<GeometryInstanceData_0 > _S272, StructuredBuffer<MeshDesc_0 > _S273, StructuredBuffer<PackedStaticVertexData_0 > _S274, StructuredBuffer<PrevVertexData_0 > _S275, ByteAddressBuffer _S276, StructuredBuffer<CurveDesc_0 > _S277, StructuredBuffer<StaticCurveVertexData_0 > _S278, StructuredBuffer<DynamicCurveVertexData_0 > _S279, ByteAddressBuffer _S280, StructuredBuffer<AABB_0 > _S281, StructuredBuffer<CustomPrimitiveDesc_0 > _S282, StructuredBuffer<MaterialDataBlob_0 > _S283, SamplerState  _S284[int(256)], Texture2D<float4 >  _S285[int(49)], ByteAddressBuffer  _S286[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S287, StructuredBuffer<NetworkParamStorageFP32_0 > _S288, StructuredBuffer<int > _S289, StructuredBuffer<LightData_0 > _S290, StructuredBuffer<PackedEmissiveTriangle_0 > _S291, StructuredBuffer<uint > _S292, StructuredBuffer<uint > _S293, StructuredBuffer<EmissiveFlux_0 > _S294, StructuredBuffer<MeshLightData_0 > _S295, StructuredBuffer<uint > _S296, Texture2D<float4 > _S297, SamplerState _S298, Texture2D<float4 > _S299, SamplerState _S300, StructuredBuffer<GridVolume_0 > _S301, StructuredBuffer<uint >  _S302[int(1)], Texture3D<float2 >  _S303[int(1)], Texture3D<uint4 >  _S304[int(1)], Texture3D<float >  _S305[int(1)], GeometryInstanceID_0 _S306)
{

#line 178
    GeometryInstanceData_0 _S307 = _S272[_S306.index_0];
    return Scene_loadWorldMatrix_0(_S267, _S268, _S269, _S270, _S271, _S272, _S273, _S274, _S275, _S276, _S277, _S278, _S279, _S280, _S281, _S282, _S283, _S284, _S285, _S286, _S287, _S288, _S289, _S290, _S291, _S292, _S293, _S294, _S295, _S296, _S297, _S298, _S299, _S300, _S301, _S302, _S303, _S304, _S305, _S307.globalMatrixID_0);
}


#line 179
matrix<float,int(3),int(3)>  Scene_loadInverseTransposeWorldMatrix_0(RaytracingAccelerationStructure _S308, StructuredBuffer<_S1 > _S309, StructuredBuffer<_S1 > _S310, StructuredBuffer<_S1 > _S311, StructuredBuffer<_S1 > _S312, StructuredBuffer<GeometryInstanceData_0 > _S313, StructuredBuffer<MeshDesc_0 > _S314, StructuredBuffer<PackedStaticVertexData_0 > _S315, StructuredBuffer<PrevVertexData_0 > _S316, ByteAddressBuffer _S317, StructuredBuffer<CurveDesc_0 > _S318, StructuredBuffer<StaticCurveVertexData_0 > _S319, StructuredBuffer<DynamicCurveVertexData_0 > _S320, ByteAddressBuffer _S321, StructuredBuffer<AABB_0 > _S322, StructuredBuffer<CustomPrimitiveDesc_0 > _S323, StructuredBuffer<MaterialDataBlob_0 > _S324, SamplerState  _S325[int(256)], Texture2D<float4 >  _S326[int(49)], ByteAddressBuffer  _S327[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S328, StructuredBuffer<NetworkParamStorageFP32_0 > _S329, StructuredBuffer<int > _S330, StructuredBuffer<LightData_0 > _S331, StructuredBuffer<PackedEmissiveTriangle_0 > _S332, StructuredBuffer<uint > _S333, StructuredBuffer<uint > _S334, StructuredBuffer<EmissiveFlux_0 > _S335, StructuredBuffer<MeshLightData_0 > _S336, StructuredBuffer<uint > _S337, Texture2D<float4 > _S338, SamplerState _S339, Texture2D<float4 > _S340, SamplerState _S341, StructuredBuffer<GridVolume_0 > _S342, StructuredBuffer<uint >  _S343[int(1)], Texture3D<float2 >  _S344[int(1)], Texture3D<uint4 >  _S345[int(1)], Texture3D<float >  _S346[int(1)], uint _S347)
{

#line 168
    _S1 _S348 = _S310[_S347];

#line 168
    return (matrix<float,int(3),int(3)> )_S348._S2;
}


#line 168
matrix<float,int(3),int(3)>  Scene_getInverseTransposeWorldMatrix_0(RaytracingAccelerationStructure _S349, StructuredBuffer<_S1 > _S350, StructuredBuffer<_S1 > _S351, StructuredBuffer<_S1 > _S352, StructuredBuffer<_S1 > _S353, StructuredBuffer<GeometryInstanceData_0 > _S354, StructuredBuffer<MeshDesc_0 > _S355, StructuredBuffer<PackedStaticVertexData_0 > _S356, StructuredBuffer<PrevVertexData_0 > _S357, ByteAddressBuffer _S358, StructuredBuffer<CurveDesc_0 > _S359, StructuredBuffer<StaticCurveVertexData_0 > _S360, StructuredBuffer<DynamicCurveVertexData_0 > _S361, ByteAddressBuffer _S362, StructuredBuffer<AABB_0 > _S363, StructuredBuffer<CustomPrimitiveDesc_0 > _S364, StructuredBuffer<MaterialDataBlob_0 > _S365, SamplerState  _S366[int(256)], Texture2D<float4 >  _S367[int(49)], ByteAddressBuffer  _S368[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S369, StructuredBuffer<NetworkParamStorageFP32_0 > _S370, StructuredBuffer<int > _S371, StructuredBuffer<LightData_0 > _S372, StructuredBuffer<PackedEmissiveTriangle_0 > _S373, StructuredBuffer<uint > _S374, StructuredBuffer<uint > _S375, StructuredBuffer<EmissiveFlux_0 > _S376, StructuredBuffer<MeshLightData_0 > _S377, StructuredBuffer<uint > _S378, Texture2D<float4 > _S379, SamplerState _S380, Texture2D<float4 > _S381, SamplerState _S382, StructuredBuffer<GridVolume_0 > _S383, StructuredBuffer<uint >  _S384[int(1)], Texture3D<float2 >  _S385[int(1)], Texture3D<uint4 >  _S386[int(1)], Texture3D<float >  _S387[int(1)], GeometryInstanceID_0 _S388)
{

#line 190
    GeometryInstanceData_0 _S389 = _S354[_S388.index_0];
    return Scene_loadInverseTransposeWorldMatrix_0(_S349, _S350, _S351, _S352, _S353, _S354, _S355, _S356, _S357, _S358, _S359, _S360, _S361, _S362, _S363, _S364, _S365, _S366, _S367, _S368, _S369, _S370, _S371, _S372, _S373, _S374, _S375, _S376, _S377, _S378, _S379, _S380, _S381, _S382, _S383, _S384, _S385, _S386, _S387, _S389.globalMatrixID_0);
}


#line 191
bool Scene_isObjectFrontFaceCW_0(RaytracingAccelerationStructure _S390, StructuredBuffer<_S1 > _S391, StructuredBuffer<_S1 > _S392, StructuredBuffer<_S1 > _S393, StructuredBuffer<_S1 > _S394, StructuredBuffer<GeometryInstanceData_0 > _S395, StructuredBuffer<MeshDesc_0 > _S396, StructuredBuffer<PackedStaticVertexData_0 > _S397, StructuredBuffer<PrevVertexData_0 > _S398, ByteAddressBuffer _S399, StructuredBuffer<CurveDesc_0 > _S400, StructuredBuffer<StaticCurveVertexData_0 > _S401, StructuredBuffer<DynamicCurveVertexData_0 > _S402, ByteAddressBuffer _S403, StructuredBuffer<AABB_0 > _S404, StructuredBuffer<CustomPrimitiveDesc_0 > _S405, StructuredBuffer<MaterialDataBlob_0 > _S406, SamplerState  _S407[int(256)], Texture2D<float4 >  _S408[int(49)], ByteAddressBuffer  _S409[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S410, StructuredBuffer<NetworkParamStorageFP32_0 > _S411, StructuredBuffer<int > _S412, StructuredBuffer<LightData_0 > _S413, StructuredBuffer<PackedEmissiveTriangle_0 > _S414, StructuredBuffer<uint > _S415, StructuredBuffer<uint > _S416, StructuredBuffer<EmissiveFlux_0 > _S417, StructuredBuffer<MeshLightData_0 > _S418, StructuredBuffer<uint > _S419, Texture2D<float4 > _S420, SamplerState _S421, Texture2D<float4 > _S422, SamplerState _S423, StructuredBuffer<GridVolume_0 > _S424, StructuredBuffer<uint >  _S425[int(1)], Texture3D<float2 >  _S426[int(1)], Texture3D<uint4 >  _S427[int(1)], Texture3D<float >  _S428[int(1)], GeometryInstanceID_0 _S429)
{

#line 207
    GeometryInstanceData_0 _S430 = _S395[_S429.index_0];

#line 207
    return (_S430.flags_0 & 8U) != 0U;
}


#line 446
float3 Scene_getFaceNormalInObjectSpace_0(RaytracingAccelerationStructure _S431, StructuredBuffer<_S1 > _S432, StructuredBuffer<_S1 > _S433, StructuredBuffer<_S1 > _S434, StructuredBuffer<_S1 > _S435, StructuredBuffer<GeometryInstanceData_0 > _S436, StructuredBuffer<MeshDesc_0 > _S437, StructuredBuffer<PackedStaticVertexData_0 > _S438, StructuredBuffer<PrevVertexData_0 > _S439, ByteAddressBuffer _S440, StructuredBuffer<CurveDesc_0 > _S441, StructuredBuffer<StaticCurveVertexData_0 > _S442, StructuredBuffer<DynamicCurveVertexData_0 > _S443, ByteAddressBuffer _S444, StructuredBuffer<AABB_0 > _S445, StructuredBuffer<CustomPrimitiveDesc_0 > _S446, StructuredBuffer<MaterialDataBlob_0 > _S447, SamplerState  _S448[int(256)], Texture2D<float4 >  _S449[int(49)], ByteAddressBuffer  _S450[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S451, StructuredBuffer<NetworkParamStorageFP32_0 > _S452, StructuredBuffer<int > _S453, StructuredBuffer<LightData_0 > _S454, StructuredBuffer<PackedEmissiveTriangle_0 > _S455, StructuredBuffer<uint > _S456, StructuredBuffer<uint > _S457, StructuredBuffer<EmissiveFlux_0 > _S458, StructuredBuffer<MeshLightData_0 > _S459, StructuredBuffer<uint > _S460, Texture2D<float4 > _S461, SamplerState _S462, Texture2D<float4 > _S463, SamplerState _S464, StructuredBuffer<GridVolume_0 > _S465, StructuredBuffer<uint >  _S466[int(1)], Texture3D<float2 >  _S467[int(1)], Texture3D<uint4 >  _S468[int(1)], Texture3D<float >  _S469[int(1)], StaticVertexData_0  _S470[int(3)], bool _S471)
{

#line 357
    float3 N_1 = normalize(cross(_S470[int(1)].position_4 - _S470[int(0)].position_4, _S470[int(2)].position_4 - _S470[int(0)].position_4));

#line 357
    float3 _S472;
    if(_S471)
    {

#line 358
        _S472 = - N_1;

#line 358
    }
    else
    {

#line 358
        _S472 = N_1;

#line 358
    }

#line 358
    return _S472;
}


#line 358
VertexData_0 Scene_computeVertexData_0(RaytracingAccelerationStructure _S473, StructuredBuffer<_S1 > _S474, StructuredBuffer<_S1 > _S475, StructuredBuffer<_S1 > _S476, StructuredBuffer<_S1 > _S477, StructuredBuffer<GeometryInstanceData_0 > _S478, StructuredBuffer<MeshDesc_0 > _S479, StructuredBuffer<PackedStaticVertexData_0 > _S480, StructuredBuffer<PrevVertexData_0 > _S481, ByteAddressBuffer _S482, StructuredBuffer<CurveDesc_0 > _S483, StructuredBuffer<StaticCurveVertexData_0 > _S484, StructuredBuffer<DynamicCurveVertexData_0 > _S485, ByteAddressBuffer _S486, StructuredBuffer<AABB_0 > _S487, StructuredBuffer<CustomPrimitiveDesc_0 > _S488, StructuredBuffer<MaterialDataBlob_0 > _S489, SamplerState  _S490[int(256)], Texture2D<float4 >  _S491[int(49)], ByteAddressBuffer  _S492[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S493, StructuredBuffer<NetworkParamStorageFP32_0 > _S494, StructuredBuffer<int > _S495, StructuredBuffer<LightData_0 > _S496, StructuredBuffer<PackedEmissiveTriangle_0 > _S497, StructuredBuffer<uint > _S498, StructuredBuffer<uint > _S499, StructuredBuffer<EmissiveFlux_0 > _S500, StructuredBuffer<MeshLightData_0 > _S501, StructuredBuffer<uint > _S502, Texture2D<float4 > _S503, SamplerState _S504, Texture2D<float4 > _S505, SamplerState _S506, StructuredBuffer<GridVolume_0 > _S507, StructuredBuffer<uint >  _S508[int(1)], Texture3D<float2 >  _S509[int(1)], Texture3D<uint4 >  _S510[int(1)], Texture3D<float >  _S511[int(1)], StaticVertexData_0  _S512[int(3)], matrix<float,int(4),int(4)>  _S513, matrix<float,int(3),int(3)>  _S514, bool _S515, float3 _S516)
{

#line 446
    float3 _S517 = float3(0.0, 0.0, 0.0);

#line 446
    float4 _S518 = float4(0.0, 0.0, 0.0, 0.0);

#line 446
    float2 _S519 = float2(0.0, 0.0);

#line 446
    VertexData_0 v_3;

#line 446
    v_3.posW_4 = _S517;

#line 446
    v_3.normalW_1 = _S517;

#line 446
    v_3.tangentW_0 = _S518;

#line 446
    v_3.texC_0 = _S519;

#line 446
    v_3.faceNormalW_0 = _S517;

#line 446
    v_3.curveRadius_1 = 0.0;

#line 446
    v_3.coneTexLODValue_0 = 0.0;



    v_3.posW_4 = _S512[int(0)].position_4 * _S516[int(0)] + _S512[int(1)].position_4 * _S516[int(1)] + _S512[int(2)].position_4 * _S516[int(2)];



    v_3.normalW_1 = _S512[int(0)].normal_1 * _S516[int(0)] + _S512[int(1)].normal_1 * _S516[int(1)] + _S512[int(2)].normal_1 * _S516[int(2)];



    float4 _S520 = _S512[int(0)].tangent_1 * _S516[int(0)] + _S512[int(1)].tangent_1 * _S516[int(1)] + _S512[int(2)].tangent_1 * _S516[int(2)];

#line 458
    v_3.tangentW_0 = _S520;
    v_3.tangentW_0[int(3)] = float(sign(_S520.w));



    v_3.texC_0 = _S512[int(0)].texCrd_2 * _S516[int(0)] + _S512[int(1)].texCrd_2 * _S516[int(1)] + _S512[int(2)].texCrd_2 * _S516[int(2)];



    v_3.curveRadius_1 = _S512[int(0)].curveRadius_0 * _S516[int(0)] + _S512[int(1)].curveRadius_0 * _S516[int(1)] + _S512[int(2)].curveRadius_0 * _S516[int(2)];

    v_3.faceNormalW_0 = Scene_getFaceNormalInObjectSpace_0(_S473, _S474, _S475, _S476, _S477, _S478, _S479, _S480, _S481, _S482, _S483, _S484, _S485, _S486, _S487, _S488, _S489, _S490, _S491, _S492, _S493, _S494, _S495, _S496, _S497, _S498, _S499, _S500, _S501, _S502, _S503, _S504, _S505, _S506, _S507, _S508, _S509, _S510, _S511, _S512, _S515);

    v_3.posW_4 = mul(_S513, float4(v_3.posW_4, 1.0)).xyz;
    v_3.normalW_1 = mul(_S514, v_3.normalW_1);
    v_3.faceNormalW_0 = mul(_S514, v_3.faceNormalW_0);
    matrix<float,int(3),int(3)>  _S521 = (matrix<float,int(3),int(3)> )_S513;

#line 474
    v_3.tangentW_0.xyz = mul(_S521, v_3.tangentW_0.xyz);
    v_3.curveRadius_1 = length(mul(_S521, float3(v_3.curveRadius_1, 0.0, 0.0)));

    v_3.normalW_1 = normalize(v_3.normalW_1);
    v_3.faceNormalW_0 = normalize(v_3.faceNormalW_0);
    v_3.tangentW_0.xyz = normalize(v_3.tangentW_0.xyz);
    return v_3;
}


#line 480
VertexData_0 Scene_getVertexData_0(RaytracingAccelerationStructure _S522, StructuredBuffer<_S1 > _S523, StructuredBuffer<_S1 > _S524, StructuredBuffer<_S1 > _S525, StructuredBuffer<_S1 > _S526, StructuredBuffer<GeometryInstanceData_0 > _S527, StructuredBuffer<MeshDesc_0 > _S528, StructuredBuffer<PackedStaticVertexData_0 > _S529, StructuredBuffer<PrevVertexData_0 > _S530, ByteAddressBuffer _S531, StructuredBuffer<CurveDesc_0 > _S532, StructuredBuffer<StaticCurveVertexData_0 > _S533, StructuredBuffer<DynamicCurveVertexData_0 > _S534, ByteAddressBuffer _S535, StructuredBuffer<AABB_0 > _S536, StructuredBuffer<CustomPrimitiveDesc_0 > _S537, StructuredBuffer<MaterialDataBlob_0 > _S538, SamplerState  _S539[int(256)], Texture2D<float4 >  _S540[int(49)], ByteAddressBuffer  _S541[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S542, StructuredBuffer<NetworkParamStorageFP32_0 > _S543, StructuredBuffer<int > _S544, StructuredBuffer<LightData_0 > _S545, StructuredBuffer<PackedEmissiveTriangle_0 > _S546, StructuredBuffer<uint > _S547, StructuredBuffer<uint > _S548, StructuredBuffer<EmissiveFlux_0 > _S549, StructuredBuffer<MeshLightData_0 > _S550, StructuredBuffer<uint > _S551, Texture2D<float4 > _S552, SamplerState _S553, Texture2D<float4 > _S554, SamplerState _S555, StructuredBuffer<GridVolume_0 > _S556, StructuredBuffer<uint >  _S557[int(1)], Texture3D<float2 >  _S558[int(1)], Texture3D<uint4 >  _S559[int(1)], Texture3D<float >  _S560[int(1)], GeometryInstanceID_0 _S561, uint _S562, float3 _S563, out StaticVertexData_0  _S564[int(3)])
{

#line 480
    uint3 _S565 = Scene_getIndices_0(_S522, _S523, _S524, _S525, _S526, _S527, _S528, _S529, _S530, _S531, _S532, _S533, _S534, _S535, _S536, _S537, _S538, _S539, _S540, _S541, _S542, _S543, _S544, _S545, _S546, _S547, _S548, _S549, _S550, _S551, _S552, _S553, _S554, _S555, _S556, _S557, _S558, _S559, _S560, _S561, _S562);

#line 480
    StaticVertexData_0 _S566 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S565[int(0)]);

#line 480
    StaticVertexData_0 _S567 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S565[int(1)]);

#line 480
    StaticVertexData_0 _S568 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S565[int(2)]);

#line 493
    StaticVertexData_0  _S569[int(3)] = { _S566, _S567, _S568 };

#line 493
    _S564[int(0)] = _S566;

#line 493
    _S564[int(1)] = _S567;

#line 493
    _S564[int(2)] = _S568;

#line 498
    return Scene_computeVertexData_0(_S522, _S523, _S524, _S525, _S526, _S527, _S528, _S529, _S530, _S531, _S532, _S533, _S534, _S535, _S536, _S537, _S538, _S539, _S540, _S541, _S542, _S543, _S544, _S545, _S546, _S547, _S548, _S549, _S550, _S551, _S552, _S553, _S554, _S555, _S556, _S557, _S558, _S559, _S560, _S569, Scene_getWorldMatrix_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S561), Scene_getInverseTransposeWorldMatrix_0(_S522, _S523, _S524, _S525, _S526, _S527, _S528, _S529, _S530, _S531, _S532, _S533, _S534, _S535, _S536, _S537, _S538, _S539, _S540, _S541, _S542, _S543, _S544, _S545, _S546, _S547, _S548, _S549, _S550, _S551, _S552, _S553, _S554, _S555, _S556, _S557, _S558, _S559, _S560, _S561), Scene_isObjectFrontFaceCW_0(_S522, _S523, _S524, _S525, _S526, _S527, _S528, _S529, _S530, _S531, _S532, _S533, _S534, _S535, _S536, _S537, _S538, _S539, _S540, _S541, _S542, _S543, _S544, _S545, _S546, _S547, _S548, _S549, _S550, _S551, _S552, _S553, _S554, _S555, _S556, _S557, _S558, _S559, _S560, _S561), _S563);
}


#line 498
VertexData_0 Scene_getVertexData_1(RaytracingAccelerationStructure _S570, StructuredBuffer<_S1 > _S571, StructuredBuffer<_S1 > _S572, StructuredBuffer<_S1 > _S573, StructuredBuffer<_S1 > _S574, StructuredBuffer<GeometryInstanceData_0 > _S575, StructuredBuffer<MeshDesc_0 > _S576, StructuredBuffer<PackedStaticVertexData_0 > _S577, StructuredBuffer<PrevVertexData_0 > _S578, ByteAddressBuffer _S579, StructuredBuffer<CurveDesc_0 > _S580, StructuredBuffer<StaticCurveVertexData_0 > _S581, StructuredBuffer<DynamicCurveVertexData_0 > _S582, ByteAddressBuffer _S583, StructuredBuffer<AABB_0 > _S584, StructuredBuffer<CustomPrimitiveDesc_0 > _S585, StructuredBuffer<MaterialDataBlob_0 > _S586, SamplerState  _S587[int(256)], Texture2D<float4 >  _S588[int(49)], ByteAddressBuffer  _S589[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S590, StructuredBuffer<NetworkParamStorageFP32_0 > _S591, StructuredBuffer<int > _S592, StructuredBuffer<LightData_0 > _S593, StructuredBuffer<PackedEmissiveTriangle_0 > _S594, StructuredBuffer<uint > _S595, StructuredBuffer<uint > _S596, StructuredBuffer<EmissiveFlux_0 > _S597, StructuredBuffer<MeshLightData_0 > _S598, StructuredBuffer<uint > _S599, Texture2D<float4 > _S600, SamplerState _S601, Texture2D<float4 > _S602, SamplerState _S603, StructuredBuffer<GridVolume_0 > _S604, StructuredBuffer<uint >  _S605[int(1)], Texture3D<float2 >  _S606[int(1)], Texture3D<uint4 >  _S607[int(1)], Texture3D<float >  _S608[int(1)], GeometryInstanceID_0 _S609, uint _S610, float3 _S611)
{

#line 509
    StaticVertexData_0  vertices_0[int(3)];
    return Scene_getVertexData_0(_S570, _S571, _S572, _S573, _S574, _S575, _S576, _S577, _S578, _S579, _S580, _S581, _S582, _S583, _S584, _S585, _S586, _S587, _S588, _S589, _S590, _S591, _S592, _S593, _S594, _S595, _S596, _S597, _S598, _S599, _S600, _S601, _S602, _S603, _S604, _S605, _S606, _S607, _S608, _S609, _S610, _S611, vertices_0);
}


#line 510
VertexData_0 Scene_getVertexData_2(RaytracingAccelerationStructure _S612, StructuredBuffer<_S1 > _S613, StructuredBuffer<_S1 > _S614, StructuredBuffer<_S1 > _S615, StructuredBuffer<_S1 > _S616, StructuredBuffer<GeometryInstanceData_0 > _S617, StructuredBuffer<MeshDesc_0 > _S618, StructuredBuffer<PackedStaticVertexData_0 > _S619, StructuredBuffer<PrevVertexData_0 > _S620, ByteAddressBuffer _S621, StructuredBuffer<CurveDesc_0 > _S622, StructuredBuffer<StaticCurveVertexData_0 > _S623, StructuredBuffer<DynamicCurveVertexData_0 > _S624, ByteAddressBuffer _S625, StructuredBuffer<AABB_0 > _S626, StructuredBuffer<CustomPrimitiveDesc_0 > _S627, StructuredBuffer<MaterialDataBlob_0 > _S628, SamplerState  _S629[int(256)], Texture2D<float4 >  _S630[int(49)], ByteAddressBuffer  _S631[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S632, StructuredBuffer<NetworkParamStorageFP32_0 > _S633, StructuredBuffer<int > _S634, StructuredBuffer<LightData_0 > _S635, StructuredBuffer<PackedEmissiveTriangle_0 > _S636, StructuredBuffer<uint > _S637, StructuredBuffer<uint > _S638, StructuredBuffer<EmissiveFlux_0 > _S639, StructuredBuffer<MeshLightData_0 > _S640, StructuredBuffer<uint > _S641, Texture2D<float4 > _S642, SamplerState _S643, Texture2D<float4 > _S644, SamplerState _S645, StructuredBuffer<GridVolume_0 > _S646, StructuredBuffer<uint >  _S647[int(1)], Texture3D<float2 >  _S648[int(1)], Texture3D<uint4 >  _S649[int(1)], Texture3D<float >  _S650[int(1)], TriangleHit_0 _S651)
{

#line 519
    return Scene_getVertexData_1(_S612, _S613, _S614, _S615, _S616, _S617, _S618, _S619, _S620, _S621, _S622, _S623, _S624, _S625, _S626, _S627, _S628, _S629, _S630, _S631, _S632, _S633, _S634, _S635, _S636, _S637, _S638, _S639, _S640, _S641, _S642, _S643, _S644, _S645, _S646, _S647, _S648, _S649, _S650, _S651._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _S651._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, GeometryHit_getBarycentricWeights_0(_S651._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit));
}


#line 519
uint Scene_getMaterialID_0(RaytracingAccelerationStructure _S652, StructuredBuffer<_S1 > _S653, StructuredBuffer<_S1 > _S654, StructuredBuffer<_S1 > _S655, StructuredBuffer<_S1 > _S656, StructuredBuffer<GeometryInstanceData_0 > _S657, StructuredBuffer<MeshDesc_0 > _S658, StructuredBuffer<PackedStaticVertexData_0 > _S659, StructuredBuffer<PrevVertexData_0 > _S660, ByteAddressBuffer _S661, StructuredBuffer<CurveDesc_0 > _S662, StructuredBuffer<StaticCurveVertexData_0 > _S663, StructuredBuffer<DynamicCurveVertexData_0 > _S664, ByteAddressBuffer _S665, StructuredBuffer<AABB_0 > _S666, StructuredBuffer<CustomPrimitiveDesc_0 > _S667, StructuredBuffer<MaterialDataBlob_0 > _S668, SamplerState  _S669[int(256)], Texture2D<float4 >  _S670[int(49)], ByteAddressBuffer  _S671[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S672, StructuredBuffer<NetworkParamStorageFP32_0 > _S673, StructuredBuffer<int > _S674, StructuredBuffer<LightData_0 > _S675, StructuredBuffer<PackedEmissiveTriangle_0 > _S676, StructuredBuffer<uint > _S677, StructuredBuffer<uint > _S678, StructuredBuffer<EmissiveFlux_0 > _S679, StructuredBuffer<MeshLightData_0 > _S680, StructuredBuffer<uint > _S681, Texture2D<float4 > _S682, SamplerState _S683, Texture2D<float4 > _S684, SamplerState _S685, StructuredBuffer<GridVolume_0 > _S686, StructuredBuffer<uint >  _S687[int(1)], Texture3D<float2 >  _S688[int(1)], Texture3D<uint4 >  _S689[int(1)], Texture3D<float >  _S690[int(1)], GeometryInstanceID_0 _S691)
{

#line 233
    GeometryInstanceData_0 _S692 = _S657[_S691.index_0];

#line 233
    return _S692.materialID_0;
}


#line 99 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
struct Tuple_0
{
    uint2 value0_0;
    uint2 value1_0;
    AnyValue128 value2_0;
};


#line 99
int MaterialSystem_getMaterialType_0(StructuredBuffer<MaterialDataBlob_0 > _S693, SamplerState  _S694[int(256)], Texture2D<float4 >  _S695[int(49)], ByteAddressBuffer  _S696[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S697, StructuredBuffer<NetworkParamStorageFP32_0 > _S698, StructuredBuffer<int > _S699, uint _S700)
{

#line 99
    MaterialDataBlob_0 _S701 = _S693[_S700];

#line 99
    return MaterialHeader_getMaterialType_0(_S701.header_0);
}


#line 99
Tuple_0 getMaterial_0(StructuredBuffer<MaterialDataBlob_0 > _S702, SamplerState  _S703[int(256)], Texture2D<float4 >  _S704[int(49)], ByteAddressBuffer  _S705[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S706, StructuredBuffer<NetworkParamStorageFP32_0 > _S707, StructuredBuffer<int > _S708, uint _S709)
{

#line 53 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
    MaterialDataBlob_0 _S710 = _S702[_S709];

#line 53
    Tuple_0 _S711 = { uint2(0U, 0U), uint2(uint(MaterialSystem_getMaterialType_0(_S702, _S703, _S704, _S705, _S706, _S707, _S708, _S709)), 0U), packAnyValue128_0(_S710) };

#line 53
    return _S711;
}


#line 53
struct Tuple_1
{
    uint2 value0_1;
    uint2 value1_1;
    AnyValue16 value2_1;
};


#line 85 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IMaterial.slang"
struct MaterialBase_0
{
    MaterialHeader_0 header_1;
};


#line 42 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/TextureHandle.slang"
struct TextureHandle_0
{
    uint packedData_1;
};


#line 48 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/BasicMaterialData.slang"
struct BasicMaterialData_0
{
    uint flags_4;
    float emissiveFactor_0;
    vector<half,4> baseColor_0;
    vector<half,4> specular_0;
    float3 emissive_0;
    half specularTransmission_0;
    vector<half,3> transmission_0;
    half diffuseTransmission_0;
    vector<half,3> volumeScattering_0;
    half IoR_1;
    vector<half,3> volumeAbsorption_0;
    half volumeAnisotropy_0;
    float displacementScale_0;
    float displacementOffset_0;
    TextureHandle_0 texBaseColor_0;
    TextureHandle_0 texSpecular_0;
    TextureHandle_0 texEmissive_0;
    TextureHandle_0 texNormalMap_0;
    TextureHandle_0 texTransmission_0;
    TextureHandle_0 texDisplacementMap_0;
};


#line 34 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterial.slang"
struct PBRTDiffuseMaterial_0
{
    MaterialBase_0 _S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase;
    BasicMaterialData_0 data_5;
};


#line 102 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
PBRTDiffuseMaterial_0 unpackAnyValue128_0(AnyValue128 _S712)
{

#line 102
    PBRTDiffuseMaterial_0 _S713;

#line 102
    _S713._S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1.packedData_0[int(0)] = _S712.field0_1;

#line 102
    _S713._S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1.packedData_0[int(1)] = _S712.field1_1;

#line 102
    _S713.data_5.flags_4 = _S712.field2_1;

#line 102
    _S713.data_5.emissiveFactor_0 = asfloat(_S712.field3_1);

#line 102
    _S713.data_5.baseColor_0[int(0)] = asfloat16(uint16_t(_S712.field4_1 & 65535U));

#line 102
    _S713.data_5.baseColor_0[int(1)] = asfloat16(uint16_t(_S712.field4_1 >> 16U));

#line 102
    _S713.data_5.baseColor_0[int(2)] = asfloat16(uint16_t(_S712.field5_1 & 65535U));

#line 102
    _S713.data_5.baseColor_0[int(3)] = asfloat16(uint16_t(_S712.field5_1 >> 16U));

#line 102
    _S713.data_5.specular_0[int(0)] = asfloat16(uint16_t(_S712.field6_1 & 65535U));

#line 102
    _S713.data_5.specular_0[int(1)] = asfloat16(uint16_t(_S712.field6_1 >> 16U));

#line 102
    _S713.data_5.specular_0[int(2)] = asfloat16(uint16_t(_S712.field7_1 & 65535U));

#line 102
    _S713.data_5.specular_0[int(3)] = asfloat16(uint16_t(_S712.field7_1 >> 16U));

#line 102
    _S713.data_5.emissive_0[int(0)] = asfloat(_S712.field8_1);

#line 102
    _S713.data_5.emissive_0[int(1)] = asfloat(_S712.field9_1);

#line 102
    _S713.data_5.emissive_0[int(2)] = asfloat(_S712.field10_1);

#line 102
    _S713.data_5.specularTransmission_0 = asfloat16(uint16_t(_S712.field11_1 & 65535U));

#line 102
    _S713.data_5.transmission_0[int(0)] = asfloat16(uint16_t(_S712.field11_1 >> 16U));

#line 102
    _S713.data_5.transmission_0[int(1)] = asfloat16(uint16_t(_S712.field12_1 & 65535U));

#line 102
    _S713.data_5.transmission_0[int(2)] = asfloat16(uint16_t(_S712.field12_1 >> 16U));

#line 102
    _S713.data_5.diffuseTransmission_0 = asfloat16(uint16_t(_S712.field13_1 & 65535U));

#line 102
    _S713.data_5.volumeScattering_0[int(0)] = asfloat16(uint16_t(_S712.field13_1 >> 16U));

#line 102
    _S713.data_5.volumeScattering_0[int(1)] = asfloat16(uint16_t(_S712.field14_1 & 65535U));

#line 102
    _S713.data_5.volumeScattering_0[int(2)] = asfloat16(uint16_t(_S712.field14_1 >> 16U));

#line 102
    _S713.data_5.IoR_1 = asfloat16(uint16_t(_S712.field15_1 & 65535U));

#line 102
    _S713.data_5.volumeAbsorption_0[int(0)] = asfloat16(uint16_t(_S712.field15_1 >> 16U));

#line 102
    _S713.data_5.volumeAbsorption_0[int(1)] = asfloat16(uint16_t(_S712.field16_1 & 65535U));

#line 102
    _S713.data_5.volumeAbsorption_0[int(2)] = asfloat16(uint16_t(_S712.field16_1 >> 16U));

#line 102
    _S713.data_5.volumeAnisotropy_0 = asfloat16(uint16_t(_S712.field17_1 & 65535U));

#line 102
    _S713.data_5.displacementScale_0 = asfloat(_S712.field18_1);

#line 102
    _S713.data_5.displacementOffset_0 = asfloat(_S712.field19_1);

#line 102
    _S713.data_5.texBaseColor_0.packedData_1 = _S712.field20_1;

#line 102
    _S713.data_5.texSpecular_0.packedData_1 = _S712.field21_1;

#line 102
    _S713.data_5.texEmissive_0.packedData_1 = _S712.field22_1;

#line 102
    _S713.data_5.texNormalMap_0.packedData_1 = _S712.field23_1;

#line 102
    _S713.data_5.texTransmission_0.packedData_1 = _S712.field24_1;

#line 102
    _S713.data_5.texDisplacementMap_0.packedData_1 = _S712.field25_1;

#line 102
    return _S713;
}


#line 122 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
uint MaterialHeader_getDefaultTextureSamplerID_0(MaterialHeader_0 this_10)
{

#line 122
    return this_10.packedData_0.y >> 17U & 255U;
}


#line 277 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
TextureHandle_0 MaterialSystem_getResolvedTextureHandle_0(StructuredBuffer<MaterialDataBlob_0 > _S714, SamplerState  _S715[int(256)], Texture2D<float4 >  _S716[int(49)], ByteAddressBuffer  _S717[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S718, StructuredBuffer<NetworkParamStorageFP32_0 > _S719, StructuredBuffer<int > _S720, TextureHandle_0 _S721, inout float2 _S722)
{

#line 244
    return _S721;
}


#line 67 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/TextureHandle.slang"
int TextureHandle_getMode_0(TextureHandle_0 this_11)
{

#line 67
    return int(this_11.packedData_1 >> 29U & 3U);
}


#line 75
uint TextureHandle_getTextureID_0(TextureHandle_0 this_12)
{

#line 75
    return this_12.packedData_1 >> int(0) & 536870911U;
}


#line 75
float4 U_SR35Scene_2FxMaterial_2FxTextureSampler15ITextureSampler13sampleTexturep3p4core9Texture2DG1v4f4core12SamplerStatev2fv4f_0(uint2 _S723, AnyValue16 _S724, Texture2D<float4 > _S725, SamplerState _S726, float2 _S727)
{

#line 75
    return U_SR35Scene_2FxMaterial_2FxTextureSampler25ExplicitLodTextureSampler13sampleTexturep3p4core9Texture2DG1v4f4core12SamplerStatev2fv4f_wtwrapper_0(_S724, _S725, _S726, _S727);
}


#line 75
float4 MaterialSystem_sampleTexture_0(StructuredBuffer<MaterialDataBlob_0 > _S728, SamplerState  _S729[int(256)], Texture2D<float4 >  _S730[int(49)], ByteAddressBuffer  _S731[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S732, StructuredBuffer<NetworkParamStorageFP32_0 > _S733, StructuredBuffer<int > _S734, TextureHandle_0 _S735, SamplerState _S736, float2 _S737, float4 _S738, AnyValue16 _S739, uint2 _S740, uint2 _S741)
{

#line 320 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
    float2 _S742 = _S737;

#line 320
    TextureHandle_0 _S743 = MaterialSystem_getResolvedTextureHandle_0(_S728, _S729, _S730, _S731, _S732, _S733, _S734, _S735, _S742);


    switch(TextureHandle_getMode_0(_S743))
    {
    case int(0):
        {

#line 326
            return _S738;
        }
    case int(1):
        {

#line 328
            return U_SR35Scene_2FxMaterial_2FxTextureSampler15ITextureSampler13sampleTexturep3p4core9Texture2DG1v4f4core12SamplerStatev2fv4f_0(_S741, _S739, _S730[TextureHandle_getTextureID_0(_S743)], _S736, _S742);
        }
    default:
        {

#line 330
            return (float4)0.0;
        }
    }

#line 330
}


#line 330
float PBRTDiffuseMaterial_evalOpacity_0(PBRTDiffuseMaterial_0 _S744, StructuredBuffer<MaterialDataBlob_0 > _S745, SamplerState  _S746[int(256)], Texture2D<float4 >  _S747[int(49)], ByteAddressBuffer  _S748[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S749, StructuredBuffer<NetworkParamStorageFP32_0 > _S750, StructuredBuffer<int > _S751, VertexData_0 _S752, Tuple_1 _S753)
{

#line 108 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterial.slang"
    return MaterialSystem_sampleTexture_0(_S745, _S746, _S747, _S748, _S749, _S750, _S751, _S744.data_5.texBaseColor_0, _S746[MaterialHeader_getDefaultTextureSamplerID_0(_S744._S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1)], _S752.texC_0, float4(_S744.data_5.baseColor_0), _S753.value2_1, _S753.value0_1, _S753.value1_1).w;
}


#line 44 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterial.slang"
struct StandardMaterial_0
{
    MaterialBase_0 _S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase;
    BasicMaterialData_0 data_6;
};


#line 44
StandardMaterial_0 unpackAnyValue128_1(AnyValue128 _S754)
{

#line 44
    StandardMaterial_0 _S755;

#line 44
    _S755._S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1.packedData_0[int(0)] = _S754.field0_1;

#line 44
    _S755._S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1.packedData_0[int(1)] = _S754.field1_1;

#line 44
    _S755.data_6.flags_4 = _S754.field2_1;

#line 44
    _S755.data_6.emissiveFactor_0 = asfloat(_S754.field3_1);

#line 44
    _S755.data_6.baseColor_0[int(0)] = asfloat16(uint16_t(_S754.field4_1 & 65535U));

#line 44
    _S755.data_6.baseColor_0[int(1)] = asfloat16(uint16_t(_S754.field4_1 >> 16U));

#line 44
    _S755.data_6.baseColor_0[int(2)] = asfloat16(uint16_t(_S754.field5_1 & 65535U));

#line 44
    _S755.data_6.baseColor_0[int(3)] = asfloat16(uint16_t(_S754.field5_1 >> 16U));

#line 44
    _S755.data_6.specular_0[int(0)] = asfloat16(uint16_t(_S754.field6_1 & 65535U));

#line 44
    _S755.data_6.specular_0[int(1)] = asfloat16(uint16_t(_S754.field6_1 >> 16U));

#line 44
    _S755.data_6.specular_0[int(2)] = asfloat16(uint16_t(_S754.field7_1 & 65535U));

#line 44
    _S755.data_6.specular_0[int(3)] = asfloat16(uint16_t(_S754.field7_1 >> 16U));

#line 44
    _S755.data_6.emissive_0[int(0)] = asfloat(_S754.field8_1);

#line 44
    _S755.data_6.emissive_0[int(1)] = asfloat(_S754.field9_1);

#line 44
    _S755.data_6.emissive_0[int(2)] = asfloat(_S754.field10_1);

#line 44
    _S755.data_6.specularTransmission_0 = asfloat16(uint16_t(_S754.field11_1 & 65535U));

#line 44
    _S755.data_6.transmission_0[int(0)] = asfloat16(uint16_t(_S754.field11_1 >> 16U));

#line 44
    _S755.data_6.transmission_0[int(1)] = asfloat16(uint16_t(_S754.field12_1 & 65535U));

#line 44
    _S755.data_6.transmission_0[int(2)] = asfloat16(uint16_t(_S754.field12_1 >> 16U));

#line 44
    _S755.data_6.diffuseTransmission_0 = asfloat16(uint16_t(_S754.field13_1 & 65535U));

#line 44
    _S755.data_6.volumeScattering_0[int(0)] = asfloat16(uint16_t(_S754.field13_1 >> 16U));

#line 44
    _S755.data_6.volumeScattering_0[int(1)] = asfloat16(uint16_t(_S754.field14_1 & 65535U));

#line 44
    _S755.data_6.volumeScattering_0[int(2)] = asfloat16(uint16_t(_S754.field14_1 >> 16U));

#line 44
    _S755.data_6.IoR_1 = asfloat16(uint16_t(_S754.field15_1 & 65535U));

#line 44
    _S755.data_6.volumeAbsorption_0[int(0)] = asfloat16(uint16_t(_S754.field15_1 >> 16U));

#line 44
    _S755.data_6.volumeAbsorption_0[int(1)] = asfloat16(uint16_t(_S754.field16_1 & 65535U));

#line 44
    _S755.data_6.volumeAbsorption_0[int(2)] = asfloat16(uint16_t(_S754.field16_1 >> 16U));

#line 44
    _S755.data_6.volumeAnisotropy_0 = asfloat16(uint16_t(_S754.field17_1 & 65535U));

#line 44
    _S755.data_6.displacementScale_0 = asfloat(_S754.field18_1);

#line 44
    _S755.data_6.displacementOffset_0 = asfloat(_S754.field19_1);

#line 44
    _S755.data_6.texBaseColor_0.packedData_1 = _S754.field20_1;

#line 44
    _S755.data_6.texSpecular_0.packedData_1 = _S754.field21_1;

#line 44
    _S755.data_6.texEmissive_0.packedData_1 = _S754.field22_1;

#line 44
    _S755.data_6.texNormalMap_0.packedData_1 = _S754.field23_1;

#line 44
    _S755.data_6.texTransmission_0.packedData_1 = _S754.field24_1;

#line 44
    _S755.data_6.texDisplacementMap_0.packedData_1 = _S754.field25_1;

#line 44
    return _S755;
}


#line 44
float StandardMaterial_evalOpacity_0(StandardMaterial_0 _S756, StructuredBuffer<MaterialDataBlob_0 > _S757, SamplerState  _S758[int(256)], Texture2D<float4 >  _S759[int(49)], ByteAddressBuffer  _S760[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S761, StructuredBuffer<NetworkParamStorageFP32_0 > _S762, StructuredBuffer<int > _S763, VertexData_0 _S764, Tuple_1 _S765)
{

#line 253
    return MaterialSystem_sampleTexture_0(_S757, _S758, _S759, _S760, _S761, _S762, _S763, _S756.data_6.texBaseColor_0, _S758[MaterialHeader_getDefaultTextureSamplerID_0(_S756._S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1)], _S764.texC_0, float4(_S756.data_6.baseColor_0), _S765.value2_1, _S765.value0_1, _S765.value1_1).w;
}


#line 253
float _S766(Tuple_0 _S767, StructuredBuffer<MaterialDataBlob_0 > _S768, SamplerState  _S769[int(256)], Texture2D<float4 >  _S770[int(49)], ByteAddressBuffer  _S771[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S772, StructuredBuffer<NetworkParamStorageFP32_0 > _S773, StructuredBuffer<int > _S774, VertexData_0 _S775, Tuple_1 _S776)
{

#line 253
    switch(_S767.value1_0.x)
    {
    case 6U:
        {

#line 253
            return PBRTDiffuseMaterial_evalOpacity_0(unpackAnyValue128_0(_S767.value2_0), _S768, _S769, _S770, _S771, _S772, _S773, _S774, _S775, _S776);
        }
    default:
        {

#line 253
            return StandardMaterial_evalOpacity_0(unpackAnyValue128_1(_S767.value2_0), _S768, _S769, _S770, _S771, _S772, _S773, _S774, _S775, _S776);
        }
    }

#line 253
}


#line 253
bool alphaTest_0(StructuredBuffer<MaterialDataBlob_0 > _S777, SamplerState  _S778[int(256)], Texture2D<float4 >  _S779[int(49)], ByteAddressBuffer  _S780[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S781, StructuredBuffer<NetworkParamStorageFP32_0 > _S782, StructuredBuffer<int > _S783, VertexData_0 _S784, uint _S785, ExplicitLodTextureSampler_0 _S786)
{

#line 127 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
    MaterialDataBlob_0 _S787 = _S777[_S785];

    if(MaterialHeader_getAlphaMode_0(_S787.header_0) != int(1))
    {

#line 129
        return false;
    }

#line 129
    Tuple_1 _S788 = { uint2(0U, 0U), uint2(0U, 0U), packAnyValue16_0(_S786) };

#line 137
    return evalAlphaTest_0(_S766(getMaterial_0(_S777, _S778, _S779, _S780, _S781, _S782, _S783, _S785), _S777, _S778, _S779, _S780, _S781, _S782, _S783, _S784, _S788), float(MaterialHeader_getAlphaThreshold_0(_S787.header_0)), _S784.posW_4);
}


#line 137
bool alphaTest_1(StructuredBuffer<MaterialDataBlob_0 > _S789, SamplerState  _S790[int(256)], Texture2D<float4 >  _S791[int(49)], ByteAddressBuffer  _S792[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S793, StructuredBuffer<NetworkParamStorageFP32_0 > _S794, StructuredBuffer<int > _S795, VertexData_0 _S796, uint _S797, float _S798)
{

#line 149
    ExplicitLodTextureSampler_0 explicitLOD_0 = { _S798 };
    return alphaTest_0(_S789, _S790, _S791, _S792, _S793, _S794, _S795, _S796, _S797, explicitLOD_0);
}


#line 96 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/RaytracingInline.slang"
bool traceSceneRayImpl_0(bool useAlphaTest_0, RayQuery<513U > rayQuery_3, Ray_0 ray_0, out HitInfo_0 hit_3, out float hitT_1, uint rayFlags_0, uint instanceInclusionMask_0)
{

#line 96
    RayQuery<513U > _S799 = rayQuery_3;

    _S799.TraceRayInline(gScene_rtAccel_0, rayFlags_0, instanceInclusionMask_0, Ray_toRayDesc_0(ray_0));

#line 174
    uint4 _S800 = uint4(0U, 0U, 0U, 0U);

#line 104
    for(;;)
    {

#line 104
        bool _S801 = _S799.Proceed();

#line 104
        if(_S801)
        {
        }
        else
        {

#line 104
            break;
        }

        if(useAlphaTest_0 && _S799.CandidateType() == 0U)
        {

            TriangleHit_0 hit_4 = getCandidateTriangleHit_0(_S799);



            if(alphaTest_1(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, Scene_getVertexData_2(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, hit_4), Scene_getMaterialID_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, hit_4._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2), 0.0))
            {

#line 114
                continue;
            }
            _S799.CommitNonOpaqueTriangleHit();

#line 107
        }
        else
        {

#line 107
        }

#line 104
    }

#line 104
    hit_3.data_4 = _S800;

#line 175
    hitT_1 = 0.0;

#line 196
    if(_S799.CommittedStatus() == 1U)
    {
        hit_3 = HitInfo_x24init_1(getCommittedTriangleHit_0(_S799));
        hitT_1 = _S799.CommittedRayT();
        return true;
    }

#line 269
    return false;
}

bool traceSceneRay_0(Ray_0 ray_1, out HitInfo_0 hit_5, out float hitT_2, uint rayFlags_1, uint instanceInclusionMask_1)
{

#line 272
    RayQuery<513U > rayQuery_4;

#line 293
    bool _S802 = traceSceneRayImpl_0(false, rayQuery_4, ray_1, hit_5, hitT_2, rayFlags_1, instanceInclusionMask_1);

#line 293
    return _S802;
}


#line 398
bool SceneRayQuery_traceRay_0(Ray_0 ray_2, out HitInfo_0 hit_6, out float hitT_3, uint rayFlags_2, uint instanceInclusionMask_2)
{
    bool _S803 = traceSceneRay_0(ray_2, hit_6, hitT_3, rayFlags_2, instanceInclusionMask_2);

#line 400
    return _S803;
}


#line 21 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct DiffRay_0
{
    float3 origin_2;
    float3 direction_1;
    uint2 pixel_1;
};


#line 196 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
bool traceRayInline_0(inout DiffRay_0 rayData_0, out HitInfo_0 hitInfo_0)
{
    Ray_0 ray_3;
    ray_3.origin_1 = rayData_0.origin_2;
    ray_3.dir_0 = rayData_0.direction_1;
    ray_3.tMin_0 = 0.0;
    ray_3.tMax_0 = 340282346638528859811704183484516925440.0;


    float hitT_4 = 0.0;

#line 205
    bool _S804 = SceneRayQuery_traceRay_0(ray_3, hitInfo_0, hitT_4, 0U, 255U);



    return _S804;
}


#line 575 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
void HitInfo_unpackHeader_0(uint4 packed_3, out GeometryInstanceID_0 instanceID_4, out uint primitiveIndex_2)
{


    instanceID_4.index_0 = packed_3[int(0)] >> 13U & 7U;
    primitiveIndex_2 = packed_3[int(0)] & 8191U;

#line 587
    return;
}


#line 94
TriangleHit_0 TriangleHit_x24init_0(uint4 packed_4)
{

#line 94
    TriangleHit_0 _S805;


    HitInfo_unpackHeader_0(packed_4, _S805._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _S805._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0);



    _S805._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1[int(0)] = asfloat(packed_4[int(2)]);
    _S805._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.barycentrics_1[int(1)] = asfloat(packed_4[int(3)]);

#line 94
    return _S805;
}


#line 480
TriangleHit_0 HitInfo_getTriangleHit_0(HitInfo_0 this_13)
{
    return TriangleHit_x24init_0(this_13.data_4);
}


#line 482
struct DiffPair_s_diff_s_diff_SceneDerivativeFlags_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 primal_0;
    s_diff_s_diff_SceneDerivativeFlags_0 differential_0;
};


#line 66 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
void FalcorSceneIO_bwd_loadVertexNormalsW_0(inout DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 flags_5, GeometryInstanceID_0 instanceID_5, uint triangleID_0, float3 dn0_0, float3 dn1_0, float3 dn2_0)
{

#line 78
    return;
}


#line 19
void FalcorSceneIO_loadVertexNormalsW_0(s_diff_s_diff_SceneDerivativeFlags_0 mode_0, GeometryInstanceID_0 instanceID_6, uint triangleID_1, out float3 n0_0, out float3 n1_0, out float3 n2_0)
{

#line 19
    uint3 _S806 = Scene_getIndices_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, instanceID_6, triangleID_1);

#line 19
    StaticVertexData_0 _S807 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S806.y);

#line 19
    StaticVertexData_0 _S808 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S806.z);

#line 19
    matrix<float,int(3),int(3)>  _S809 = Scene_getInverseTransposeWorldMatrix_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, instanceID_6);

#line 31
    n0_0 = normalize(mul(_S809, Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S806.x).normal_1));
    n1_0 = normalize(mul(_S809, _S807.normal_1));
    n2_0 = normalize(mul(_S809, _S808.normal_1));
    return;
}


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct IntersectionInfo_0
{
    uint triangleID_2;
    GeometryInstanceID_0 instanceID_7;
    float3 barycentrics_2;
    float3 normalW_2;
    float3 posW_5;
    float hitT_5;
};


#line 152 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
float computeBoundaryTermMitsuba_0(IntersectionInfo_0 info_0, float3 origin_3, float3 direction_2)
{

#line 152
    uint3 _S810 = Scene_getIndices_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, info_0.instanceID_7, info_0.triangleID_2);



    uint _S811 = _S810.x;

#line 156
    bool _S812 = gIsVertexOpen_0[_S811] == 1U;
    uint _S813 = _S810.y;

#line 156
    bool _S814 = _S812 || gIsVertexOpen_0[_S813] == 1U;

    uint _S815 = _S810.z;

    if(_S814 || gIsVertexOpen_0[_S815] == 1U)
    {

#line 160
        float b0_0;

#line 190
        if(gIsVertexOpen_0[_S811] == 1U)
        {

#line 190
            b0_0 = 0.0;

#line 190
        }
        else
        {

#line 190
            b0_0 = 1.0;

#line 190
        }

#line 190
        float b1_0;
        if(gIsVertexOpen_0[_S813] == 1U)
        {

#line 191
            b1_0 = 0.0;

#line 191
        }
        else
        {

#line 191
            b1_0 = 1.0;

#line 191
        }

#line 191
        float b2_0;
        if(gIsVertexOpen_0[_S815] == 1U)
        {

#line 192
            b2_0 = 0.0;

#line 192
        }
        else
        {

#line 192
            b2_0 = 1.0;

#line 192
        }


        return info_0.barycentrics_2.x * b0_0 + info_0.barycentrics_2.y * b1_0 + info_0.barycentrics_2.z * b2_0;
    }
    else
    {
        float dotND_0 = dot(info_0.normalW_2, direction_2);
        return dotND_0 * dotND_0;
    }

#line 200
}


#line 105 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct s_diff_PathData_0
{
    float3 radiance_0;
    float3 thp_0;
};


#line 105
s_diff_PathData_0 PathData_x24_syn_dzero_0()
{

#line 105
    s_diff_PathData_0 result_12;

#line 1182 "core.meta.slang"
    float3 _S816 = (float3)0.0;

#line 1182
    result_12.radiance_0 = _S816;

#line 1182
    result_12.thp_0 = _S816;

#line 1182
    return result_12;
}


#line 1182
s_diff_PathData_0 PathData_x24_syn_dadd_0(s_diff_PathData_0 SLANG_anonymous_0_6, s_diff_PathData_0 SLANG_anonymous_1_6)
{

#line 1182
    s_diff_PathData_0 result_13;

#line 1182
    result_13.radiance_0 = SLANG_anonymous_0_6.radiance_0 + SLANG_anonymous_1_6.radiance_0;

#line 1182
    result_13.thp_0 = SLANG_anonymous_0_6.thp_0 + SLANG_anonymous_1_6.thp_0;

#line 1182
    return result_13;
}


#line 1 "token paste"
void _d_exp_0(inout DiffPair_float_0 dpx_5, float dOut_6)
{

#line 861 "diff.meta.slang"
    float _S817 = exp(dpx_5.primal_0) * dOut_6;

#line 861
    dpx_5.primal_0 = dpx_5.primal_0;

#line 861
    dpx_5.differential_0 = _S817;

#line 835
    return;
}


#line 835
float s_bwd_exp_0(float _S818)
{

#line 835
    return exp(_S818);
}


#line 835
void s_bwd_exp_1(inout DiffPair_float_0 _S819, float _S820)
{

#line 835
    _d_exp_0(_S819, _S820);

#line 835
    return;
}


#line 324 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
float3 sampleVonMisesFisher_0(float3 dir_1, float kappa_0, float2 xy_0)
{
    float3 u_0 = cross(dir_1, float3(0.0, 1.0, 0.0));

#line 326
    float3 u_1;

    if(length(u_0) < 0.00100000004749745131)
    {

#line 328
        u_1 = cross(dir_1, float3(1.0, 0.0, 0.0));

#line 328
    }
    else
    {

#line 328
        u_1 = u_0;

#line 328
    }

#line 336
    float sy_0 = max(1.0 - xy_0.y, 0.00000099999999747524);

    float phi_0 = 6.28318548202514648438 * xy_0.x;
    float cosTheta_0 = 1.0 + log(exp(-2.0 * kappa_0) * (1.0 - sy_0) + sy_0) / kappa_0;
    float sinTheta_0 = sqrt(1.0 - cosTheta_0 * cosTheta_0);


    return normalize(cos(phi_0) * sinTheta_0 * normalize(u_1) + sin(phi_0) * sinTheta_0 * normalize(cross(dir_1, u_1)) + cosTheta_0 * dir_1);
}


#line 364
float3 _reflect_0(float3 dir_2, float3 normal_2)
{
    return reflect(dir_2, normal_2);
}


#line 141 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
void FalcorSceneIO_bwd_loadVertexPositionsW_0(inout DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 flags_6, GeometryInstanceID_0 instanceID_8, uint triangleID_3, float3 dv0_0, float3 dv1_0, float3 dv2_0, uint2 pixel_2)
{

#line 150
    if(flags_6.differential_0.gradientMode_0 == int(1))
    {



        if(instanceID_8.index_0 == 5U)
        {

            float3 d_1 = float3(dv0_0.y + dv1_0.y + dv2_0.y, 0.0, 0.0);
            float4 _S821 = gOutputDColor_0[pixel_2];

#line 159
            gOutputDColor_0[pixel_2] = _S821 + float4(d_1, 0.0);

#line 155
        }
        else
        {

#line 155
        }

#line 150
    }
    else
    {

#line 150
    }

#line 162
    return;
}


#line 86
void FalcorSceneIO_loadVertexPositionsW_0(s_diff_s_diff_SceneDerivativeFlags_0 flags_7, GeometryInstanceID_0 instanceID_9, uint triangleID_4, out float3 v0_0, out float3 v1_0, out float3 v2_0, uint2 pixel_3)
{

#line 86
    uint3 _S822 = Scene_getIndices_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, instanceID_9, triangleID_4);

#line 86
    StaticVertexData_0 _S823 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S822.y);

#line 86
    StaticVertexData_0 _S824 = Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S822.z);

#line 86
    matrix<float,int(4),int(4)>  _S825 = Scene_getWorldMatrix_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, instanceID_9);

#line 99
    v0_0 = mul(_S825, float4(Scene_getVertex_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, _S822.x).position_4, 1.0)).xyz;
    v1_0 = mul(_S825, float4(_S823.position_4, 1.0)).xyz;
    v2_0 = mul(_S825, float4(_S824.position_4, 1.0)).xyz;
    return;
}


#line 102
float s_bwd_determinant_0(matrix<float,int(2),int(2)>  _S826)
{

#line 102
    return determinant(_S826);
}


#line 102
float s_bwd_determinant_1(matrix<float,int(3),int(3)>  _S827)
{

#line 102
    return determinant(_S827);
}


#line 102
struct DiffPair_float2x2_0
{
    matrix<float,int(2),int(2)>  primal_0;
    matrix<float,int(2),int(2)>  differential_0;
};


#line 1462 "diff.meta.slang"
void s_bwd_determinant_impl_0(inout DiffPair_float2x2_0 dpm_0, float _s_dOut_0)
{

#line 1462
    float _S828 = - _s_dOut_0;

#line 1462
    float _S829 = dpm_0.primal_0[int(0)][int(1)] * _S828;

#line 1462
    float _S830 = dpm_0.primal_0[int(1)][int(0)] * _S828;

#line 1462
    float _S831 = dpm_0.primal_0[int(0)][int(0)] * _s_dOut_0;

#line 1462
    float _S832 = dpm_0.primal_0[int(1)][int(1)] * _s_dOut_0;

#line 1182 "core.meta.slang"
    float2 _S833 = (float2)0.0;

#line 1182
    float2 _S834 = _S833;

#line 1182
    _S834[int(0)] = _S829;

#line 1182
    _S834[int(1)] = _S831;

#line 1182
    float2 _S835 = _S833;

#line 1182
    _S835[int(1)] = _S830;

#line 1182
    _S835[int(0)] = _S832;

#line 1182
    matrix<float,int(2),int(2)>  _S836 = matrix<float,int(2),int(2)> (0.0, 0.0, 0.0, 0.0);

#line 1182
    _S836[int(1)] = _S834;

#line 1182
    _S836[int(0)] = _S835;

#line 1182
    dpm_0.primal_0 = dpm_0.primal_0;

#line 1182
    dpm_0.differential_0 = _S836;

#line 1182
    return;
}


#line 1182
void s_bwd_determinant_impl_1(inout DiffPair_float2x2_0 _S837, float _S838)
{

#line 1182
    s_bwd_determinant_impl_0(_S837, _S838);

#line 1182
    return;
}


#line 1182
void s_bwd_determinant_2(inout DiffPair_float2x2_0 _S839, float _S840)
{

#line 1464 "diff.meta.slang"
    s_bwd_determinant_impl_1(_S839, _S840);

#line 1464
    return;
}


#line 1464
struct DiffPair_float3x3_0
{
    matrix<float,int(3),int(3)>  primal_0;
    matrix<float,int(3),int(3)>  differential_0;
};


#line 506 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
void s_bwd_determinant_impl_2(inout DiffPair_float3x3_0 dpm_1, float _s_dOut_1)
{

#line 506
    float _S841 = dpm_1.primal_0[int(2)][int(0)] * _s_dOut_1;

#line 506
    float _S842 = (dpm_1.primal_0[int(0)][int(1)] * dpm_1.primal_0[int(1)][int(2)] - dpm_1.primal_0[int(1)][int(1)] * dpm_1.primal_0[int(0)][int(2)]) * _s_dOut_1;

#line 506
    float _S843 = - _S841;

#line 506
    float _S844 = dpm_1.primal_0[int(0)][int(2)] * _S843;

#line 506
    float _S845 = - _s_dOut_1;

#line 506
    float _S846 = dpm_1.primal_0[int(1)][int(0)] * _S845;

#line 506
    float _S847 = (dpm_1.primal_0[int(0)][int(1)] * dpm_1.primal_0[int(2)][int(2)] - dpm_1.primal_0[int(2)][int(1)] * dpm_1.primal_0[int(0)][int(2)]) * _S845;

#line 506
    float _S848 = - _S846;

#line 483 "core.meta.slang"
    float _S849 = dpm_1.primal_0[int(1)][int(1)] * _S843 + dpm_1.primal_0[int(2)][int(1)] * _S848;

#line 483
    float _S850 = dpm_1.primal_0[int(1)][int(2)] * _S841 + dpm_1.primal_0[int(2)][int(2)] * _S846;

#line 483
    float _S851 = dpm_1.primal_0[int(0)][int(0)] * _s_dOut_1;

#line 483
    float _S852 = (dpm_1.primal_0[int(1)][int(1)] * dpm_1.primal_0[int(2)][int(2)] - dpm_1.primal_0[int(2)][int(1)] * dpm_1.primal_0[int(1)][int(2)]) * _s_dOut_1;

#line 483
    float _S853 = - _S851;

#line 483
    float _S854 = dpm_1.primal_0[int(0)][int(1)] * _S841 + dpm_1.primal_0[int(2)][int(1)] * _S853;

#line 483
    float _S855 = dpm_1.primal_0[int(0)][int(2)] * _S848 + dpm_1.primal_0[int(1)][int(2)] * _S853;

#line 483
    float _S856 = dpm_1.primal_0[int(2)][int(2)] * _S851;

#line 483
    float _S857 = dpm_1.primal_0[int(0)][int(1)] * _S846 + dpm_1.primal_0[int(1)][int(1)] * _S851;

#line 1182
    float3 _S858 = (float3)0.0;

#line 1182
    float3 _S859 = _S858;

#line 1182
    _S859[int(0)] = _S842;

#line 1182
    _S859[int(1)] = _S855;

#line 1182
    _S859[int(2)] = _S857;

#line 483
    float _S860 = _S844 + _S856;

#line 483
    float3 _S861 = _S858;

#line 483
    _S861[int(0)] = _S847;

#line 483
    _S861[int(2)] = _S854;

#line 483
    _S861[int(1)] = _S860;

#line 483
    float3 _S862 = _S858;

#line 483
    _S862[int(2)] = _S849;

#line 483
    _S862[int(1)] = _S850;

#line 483
    _S862[int(0)] = _S852;

#line 483
    matrix<float,int(3),int(3)>  _S863 = matrix<float,int(3),int(3)> (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

#line 483
    _S863[int(2)] = _S859;

#line 483
    _S863[int(1)] = _S861;

#line 483
    _S863[int(0)] = _S862;

#line 483
    dpm_1.primal_0 = dpm_1.primal_0;

#line 483
    dpm_1.differential_0 = _S863;

#line 483
    return;
}


#line 483
void s_bwd_determinant_impl_3(inout DiffPair_float3x3_0 _S864, float _S865)
{

#line 483
    s_bwd_determinant_impl_2(_S864, _S865);

#line 483
    return;
}


#line 483
void s_bwd_determinant_3(inout DiffPair_float3x3_0 _S866, float _S867)
{

#line 1464 "diff.meta.slang"
    s_bwd_determinant_impl_3(_S866, _S867);

#line 1464
    return;
}


#line 66 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/TextureSampler.slang"
ExplicitLodTextureSampler_0 ExplicitLodTextureSampler_x24init_0(float lod_1)
{

#line 66
    ExplicitLodTextureSampler_0 _S868;

    _S868.lod_0 = lod_1;

#line 66
    return _S868;
}


#line 472 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/HitInfo.slang"
uint HitInfo_getType_0(HitInfo_0 this_14)
{
    return this_14.data_4[int(0)] >> 29U;
}


#line 480 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/MathHelpers.slang"
float3 perp_stark_0(float3 u_2)
{

    float3 a_4 = abs(u_2);
    float _S869 = a_4.x;

#line 484
    float _S870 = a_4.y;

#line 484
    int _S871;

#line 484
    if(_S869 - _S870 < 0.0)
    {

#line 484
        _S871 = int(1);

#line 484
    }
    else
    {

#line 484
        _S871 = int(0);

#line 484
    }

#line 484
    uint uyx_0 = uint(_S871);
    float _S872 = a_4.z;

#line 485
    if(_S869 - _S872 < 0.0)
    {

#line 485
        _S871 = int(1);

#line 485
    }
    else
    {

#line 485
        _S871 = int(0);

#line 485
    }

#line 485
    uint uzx_0 = uint(_S871);
    if(_S870 - _S872 < 0.0)
    {

#line 486
        _S871 = int(1);

#line 486
    }
    else
    {

#line 486
        _S871 = int(0);

#line 486
    }
    uint xm_0 = uyx_0 & uzx_0;
    uint ym_0 = (1U ^ xm_0) & uint(_S871);


    return normalize(cross(u_2, float3(float(xm_0), float(ym_0), float(1U ^ (xm_0 | ym_0)))));
}


#line 34 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/ShadingFrame.slang"
struct ShadingFrame_0
{
    float3 T_1;
    float3 B_1;
    float3 N_2;
};


#line 129
bool ShadingFrame_orthonormalizeSafe_0(inout ShadingFrame_0 this_15, float4 tangentW_1)
{

#line 139
    float3 _S873 = tangentW_1.xyz;

#line 139
    float NdotT_0 = dot(_S873, this_15.N_2);


    float _S874 = tangentW_1.w;

#line 142
    bool valid_0 = abs(_S874) == 1.0 && dot(_S873, _S873) > 0.0 && abs(NdotT_0) < 0.99989998340606689453;

    if(valid_0)
    {
        float3 _S875 = normalize(_S873 - this_15.N_2 * NdotT_0);

#line 146
        this_15.T_1 = _S875;
        this_15.B_1 = cross(this_15.N_2, _S875) * _S874;

#line 144
    }
    else
    {

#line 151
        float3 _S876 = perp_stark_0(this_15.N_2);

#line 151
        this_15.T_1 = _S876;
        this_15.B_1 = cross(this_15.N_2, _S876);

#line 144
    }

#line 155
    return valid_0;
}


#line 76
ShadingFrame_0 ShadingFrame_createSafe_0(float3 normalW_3, float4 tangentW_2, out bool valid_1)
{
    ShadingFrame_0 sf_0;
    sf_0.N_2 = normalize(normalW_3);
    bool _S877 = ShadingFrame_orthonormalizeSafe_0(sf_0, tangentW_2);

#line 80
    valid_1 = _S877;
    return sf_0;
}


#line 66 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
uint LightCollection_getActiveTriangleCount_0(LightCollection_0 this_16, StructuredBuffer<PackedEmissiveTriangle_0 > this_triangleData_0, StructuredBuffer<uint > this_activeTriangles_0, StructuredBuffer<uint > this_triToActiveMapping_0, StructuredBuffer<EmissiveFlux_0 > this_fluxData_0, StructuredBuffer<MeshLightData_0 > this_meshData_0, StructuredBuffer<uint > this_perMeshInstanceOffset_0)
{

#line 66
    return this_16.activeTriangleCount_0;
}


#line 94 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollectionShared.slang"
float2 PackedEmissiveTriangle_decodeTexCoord_0(PackedEmissiveTriangle_0 this_17, uint p_1)
{


    return float2(f16tof32(p_1 & 65535U), f16tof32(p_1 >> int(16)));
}


#line 41
struct EmissiveTriangle_0
{
    float3  posW_6[int(3)];
    float2  texCoords_0[int(3)];
    float3 normal_3;
    float area_1;
    uint materialID_5;
    uint lightIdx_1;
};


#line 116
EmissiveTriangle_0 PackedEmissiveTriangle_unpack_0(PackedEmissiveTriangle_0 this_18)
{
    EmissiveTriangle_0 tri_0;
    tri_0.posW_6[int(0)] = this_18.posAndTexCoords_0[int(0)].xyz;
    tri_0.posW_6[int(1)] = this_18.posAndTexCoords_0[int(1)].xyz;
    tri_0.posW_6[int(2)] = this_18.posAndTexCoords_0[int(2)].xyz;
    tri_0.texCoords_0[int(0)] = PackedEmissiveTriangle_decodeTexCoord_0(this_18, asuint(this_18.posAndTexCoords_0[int(0)].w));
    tri_0.texCoords_0[int(1)] = PackedEmissiveTriangle_decodeTexCoord_0(this_18, asuint(this_18.posAndTexCoords_0[int(1)].w));
    tri_0.texCoords_0[int(2)] = PackedEmissiveTriangle_decodeTexCoord_0(this_18, asuint(this_18.posAndTexCoords_0[int(2)].w));
    tri_0.normal_3 = decodeNormal2x16_0(this_18.normal_0);
    tri_0.area_1 = asfloat(this_18.area_0);
    tri_0.materialID_5 = this_18.materialID_3;
    tri_0.lightIdx_1 = this_18.lightIdx_0;
    return tri_0;
}


#line 77 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollection.slang"
EmissiveTriangle_0 LightCollection_getTriangle_0(LightCollection_0 this_19, StructuredBuffer<PackedEmissiveTriangle_0 > this_triangleData_1, StructuredBuffer<uint > this_activeTriangles_1, StructuredBuffer<uint > this_triToActiveMapping_1, StructuredBuffer<EmissiveFlux_0 > this_fluxData_1, StructuredBuffer<MeshLightData_0 > this_meshData_1, StructuredBuffer<uint > this_perMeshInstanceOffset_1, uint triIdx_0)
{
    PackedEmissiveTriangle_0 _S878 = this_triangleData_1[triIdx_0];

#line 79
    return PackedEmissiveTriangle_unpack_0(_S878);
}


#line 389 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/MathHelpers.slang"
float3 sample_triangle_0(float2 u_3)
{
    float su_0 = sqrt(u_3.x);
    float _S879 = 1.0 - su_0;

#line 392
    float _S880 = u_3.y * su_0;
    return float3(1.0 - _S879 - _S880, _S879, _S880);
}


#line 54 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightCollectionShared.slang"
float3 EmissiveTriangle_getPosition_0(EmissiveTriangle_0 this_20, float3 barycentrics_3)
{
    return this_20.posW_6[int(0)] * barycentrics_3[int(0)] + this_20.posW_6[int(1)] * barycentrics_3[int(1)] + this_20.posW_6[int(2)] * barycentrics_3[int(2)];
}


#line 65
float2 EmissiveTriangle_getTexCoord_0(EmissiveTriangle_0 this_21, float3 barycentrics_4)
{
    return this_21.texCoords_0[int(0)] * barycentrics_4[int(0)] + this_21.texCoords_0[int(1)] * barycentrics_4[int(1)] + this_21.texCoords_0[int(2)] * barycentrics_4[int(2)];
}


#line 154 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
bool MaterialHeader_isBasicMaterial_0(MaterialHeader_0 this_22)
{

#line 154
    return bool(this_22.packedData_0.x & 2147483648U);
}


#line 154
BasicMaterialData_0 unpackAnyValue120_0(AnyValue120 _S881)
{

#line 154
    BasicMaterialData_0 _S882;

#line 154
    _S882.flags_4 = _S881.field0_0;

#line 154
    _S882.emissiveFactor_0 = asfloat(_S881.field1_0);

#line 154
    _S882.baseColor_0[int(0)] = asfloat16(uint16_t(_S881.field2_0 & 65535U));

#line 154
    _S882.baseColor_0[int(1)] = asfloat16(uint16_t(_S881.field2_0 >> 16U));

#line 154
    _S882.baseColor_0[int(2)] = asfloat16(uint16_t(_S881.field3_0 & 65535U));

#line 154
    _S882.baseColor_0[int(3)] = asfloat16(uint16_t(_S881.field3_0 >> 16U));

#line 154
    _S882.specular_0[int(0)] = asfloat16(uint16_t(_S881.field4_0 & 65535U));

#line 154
    _S882.specular_0[int(1)] = asfloat16(uint16_t(_S881.field4_0 >> 16U));

#line 154
    _S882.specular_0[int(2)] = asfloat16(uint16_t(_S881.field5_0 & 65535U));

#line 154
    _S882.specular_0[int(3)] = asfloat16(uint16_t(_S881.field5_0 >> 16U));

#line 154
    _S882.emissive_0[int(0)] = asfloat(_S881.field6_0);

#line 154
    _S882.emissive_0[int(1)] = asfloat(_S881.field7_0);

#line 154
    _S882.emissive_0[int(2)] = asfloat(_S881.field8_0);

#line 154
    _S882.specularTransmission_0 = asfloat16(uint16_t(_S881.field9_0 & 65535U));

#line 154
    _S882.transmission_0[int(0)] = asfloat16(uint16_t(_S881.field9_0 >> 16U));

#line 154
    _S882.transmission_0[int(1)] = asfloat16(uint16_t(_S881.field10_0 & 65535U));

#line 154
    _S882.transmission_0[int(2)] = asfloat16(uint16_t(_S881.field10_0 >> 16U));

#line 154
    _S882.diffuseTransmission_0 = asfloat16(uint16_t(_S881.field11_0 & 65535U));

#line 154
    _S882.volumeScattering_0[int(0)] = asfloat16(uint16_t(_S881.field11_0 >> 16U));

#line 154
    _S882.volumeScattering_0[int(1)] = asfloat16(uint16_t(_S881.field12_0 & 65535U));

#line 154
    _S882.volumeScattering_0[int(2)] = asfloat16(uint16_t(_S881.field12_0 >> 16U));

#line 154
    _S882.IoR_1 = asfloat16(uint16_t(_S881.field13_0 & 65535U));

#line 154
    _S882.volumeAbsorption_0[int(0)] = asfloat16(uint16_t(_S881.field13_0 >> 16U));

#line 154
    _S882.volumeAbsorption_0[int(1)] = asfloat16(uint16_t(_S881.field14_0 & 65535U));

#line 154
    _S882.volumeAbsorption_0[int(2)] = asfloat16(uint16_t(_S881.field14_0 >> 16U));

#line 154
    _S882.volumeAnisotropy_0 = asfloat16(uint16_t(_S881.field15_0 & 65535U));

#line 154
    _S882.displacementScale_0 = asfloat(_S881.field16_0);

#line 154
    _S882.displacementOffset_0 = asfloat(_S881.field17_0);

#line 154
    _S882.texBaseColor_0.packedData_1 = _S881.field18_0;

#line 154
    _S882.texSpecular_0.packedData_1 = _S881.field19_0;

#line 154
    _S882.texEmissive_0.packedData_1 = _S881.field20_0;

#line 154
    _S882.texNormalMap_0.packedData_1 = _S881.field21_0;

#line 154
    _S882.texTransmission_0.packedData_1 = _S881.field22_0;

#line 154
    _S882.texDisplacementMap_0.packedData_1 = _S881.field23_0;

#line 154
    return _S882;
}


#line 61 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"

bool kUseLightProfile_0_init()
{

#line 61
    return false;
}
static bool kUseLightProfile_0 = kUseLightProfile_0_init();


#line 162 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
bool MaterialHeader_isLightProfileEnabled_0(MaterialHeader_0 this_23)
{

#line 162
    return bool(this_23.packedData_0.y & 33554432U);
}


#line 39 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Lights/LightProfile.slang"
float LightProfile_eval_0(LightProfile_0 this_24, Texture2D<float4 > this_texture_0, SamplerState this_sampler_0, float cosTheta_1)
{



    float4 _S883 = this_texture_0.SampleLevel(this_sampler_0, float2(acos(saturate(cosTheta_1)) / 3.14159274101257324219, 0.0), 0.0);

#line 44
    return _S883.x;
}


#line 36 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Lights/EmissiveLightSamplerInterface.slang"
struct TriangleLightSample_0
{
    uint triangleIndex_0;
    float3 posW_7;
    float3 normalW_4;
    float3 dir_3;
    float distance_0;
    float3 Le_0;
    float pdf_0;
    float2 uv_2;
};


#line 54 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Lights/EmissiveLightSamplerHelpers.slang"
bool MaterialSystem_isBasicMaterial_0(StructuredBuffer<MaterialDataBlob_0 > _S884, SamplerState  _S885[int(256)], Texture2D<float4 >  _S886[int(49)], ByteAddressBuffer  _S887[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S888, StructuredBuffer<NetworkParamStorageFP32_0 > _S889, StructuredBuffer<int > _S890, uint _S891)
{

#line 122 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialSystem.slang"
    MaterialDataBlob_0 _S892 = _S884[_S891];

#line 122
    return MaterialHeader_isBasicMaterial_0(_S892.header_0);
}


#line 122
BasicMaterialData_0 MaterialSystem_getBasicMaterialData_0(StructuredBuffer<MaterialDataBlob_0 > _S893, SamplerState  _S894[int(256)], Texture2D<float4 >  _S895[int(49)], ByteAddressBuffer  _S896[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S897, StructuredBuffer<NetworkParamStorageFP32_0 > _S898, StructuredBuffer<int > _S899, uint _S900)
{

#line 131
    MaterialDataBlob_0 _S901 = _S893[_S900];

#line 131
    return unpackAnyValue120_0(packAnyValue120_0(_S901.payload_0));
}


#line 131
MaterialHeader_0 MaterialSystem_getMaterialHeader_0(StructuredBuffer<MaterialDataBlob_0 > _S902, SamplerState  _S903[int(256)], Texture2D<float4 >  _S904[int(49)], ByteAddressBuffer  _S905[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S906, StructuredBuffer<NetworkParamStorageFP32_0 > _S907, StructuredBuffer<int > _S908, uint _S909)
{

#line 106
    MaterialDataBlob_0 _S910 = _S902[_S909];

#line 106
    return _S910.header_0;
}


#line 106
float4 MaterialSystem_sampleTexture_1(StructuredBuffer<MaterialDataBlob_0 > _S911, SamplerState  _S912[int(256)], Texture2D<float4 >  _S913[int(49)], ByteAddressBuffer  _S914[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S915, StructuredBuffer<NetworkParamStorageFP32_0 > _S916, StructuredBuffer<int > _S917, TextureHandle_0 _S918, SamplerState _S919, float2 _S920, float4 _S921, ExplicitLodTextureSampler_0 _S922)
{

#line 320
    float2 _S923 = _S920;

#line 320
    TextureHandle_0 _S924 = MaterialSystem_getResolvedTextureHandle_0(_S911, _S912, _S913, _S914, _S915, _S916, _S917, _S918, _S923);


    switch(TextureHandle_getMode_0(_S924))
    {
    case int(0):
        {

#line 326
            return _S921;
        }
    case int(1):
        {

#line 328
            return ExplicitLodTextureSampler_sampleTexture_0(_S922, _S913[TextureHandle_getTextureID_0(_S924)], _S919, _S923);
        }
    default:
        {

#line 330
            return (float4)0.0;
        }
    }

#line 330
}


#line 330
float3 MaterialSystem_evalEmissive_0(StructuredBuffer<MaterialDataBlob_0 > _S925, SamplerState  _S926[int(256)], Texture2D<float4 >  _S927[int(49)], ByteAddressBuffer  _S928[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S929, StructuredBuffer<NetworkParamStorageFP32_0 > _S930, StructuredBuffer<int > _S931, uint _S932, float2 _S933)
{

#line 211
    if(MaterialSystem_isBasicMaterial_0(_S925, _S926, _S927, _S928, _S929, _S930, _S931, _S932))
    {

#line 211
        BasicMaterialData_0 _S934 = MaterialSystem_getBasicMaterialData_0(_S925, _S926, _S927, _S928, _S929, _S930, _S931, _S932);



        ExplicitLodTextureSampler_0 lod_2 = { 0.0 };
        return MaterialSystem_sampleTexture_1(_S925, _S926, _S927, _S928, _S929, _S930, _S931, _S934.texEmissive_0, _S926[MaterialHeader_getDefaultTextureSamplerID_0(MaterialSystem_getMaterialHeader_0(_S925, _S926, _S927, _S928, _S929, _S930, _S931, _S932))], _S933, float4(_S934.emissive_0, 1.0), lod_2).xyz * _S934.emissiveFactor_0;
    }
    return (float3)0.0;
}


#line 54 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Lights/EmissiveLightSamplerHelpers.slang"
bool sampleTriangle_0(float3 posW_8, uint triangleIndex_1, float2 u_4, out TriangleLightSample_0 ls_0)
{
    float3 _S935 = float3(0.0, 0.0, 0.0);

#line 56
    float2 _S936 = float2(0.0, 0.0);

#line 56
    ls_0.triangleIndex_0 = 0U;

#line 56
    ls_0.posW_7 = _S935;

#line 56
    ls_0.normalW_4 = _S935;

#line 56
    ls_0.dir_3 = _S935;

#line 56
    ls_0.distance_0 = 0.0;

#line 56
    ls_0.Le_0 = _S935;

#line 56
    ls_0.pdf_0 = 0.0;

#line 56
    ls_0.uv_2 = _S936;
    ls_0.triangleIndex_0 = triangleIndex_1;

#line 57
    EmissiveTriangle_0 _S937 = LightCollection_getTriangle_0(gScene_0.lightCollection_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, triangleIndex_1);



    float3 barycentrics_5 = sample_triangle_0(u_4);
    float3 _S938 = EmissiveTriangle_getPosition_0(_S937, barycentrics_5);

#line 62
    ls_0.posW_7 = _S938;


    float3 toLight_0 = _S938 - posW_8;
    float distSqr_0 = max(0.0, dot(toLight_0, toLight_0));
    float _S939 = sqrt(distSqr_0);

#line 67
    ls_0.distance_0 = _S939;
    ls_0.dir_3 = toLight_0 / _S939;


    ls_0.normalW_4 = _S937.normal_3;


    float cosTheta_2 = dot(_S937.normal_3, - ls_0.dir_3);
    if(cosTheta_2 <= 0.0)
    {

#line 75
        return false;
    }


    ls_0.Le_0 = MaterialSystem_evalEmissive_0(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, _S937.materialID_5, EmissiveTriangle_getTexCoord_0(_S937, barycentrics_5));


    if(kUseLightProfile_0)
    {
        if(MaterialHeader_isLightProfileEnabled_0(MaterialSystem_getMaterialHeader_0(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, _S937.materialID_5)))
        {
            ls_0.Le_0 = ls_0.Le_0 * LightProfile_eval_0(gScene_0.lightProfile_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, dot(ls_0.normalW_4, - ls_0.dir_3));

#line 84
        }
        else
        {

#line 84
        }

#line 82
    }
    else
    {

#line 82
    }

#line 94
    ls_0.pdf_0 = distSqr_0 / max(0.0, cosTheta_2 * _S937.area_1);


    ls_0.uv_2 = u_4;



    return true;
}


#line 55 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Lights/EmissiveUniformSampler.slang"
bool EmissiveUniformSampler_sampleLight_0(EmissiveUniformSampler_0 this_25, float3 posW_9, float3 normalW_5, bool upperHemisphere_0, inout UniformSampleGenerator_0 sg_2, out TriangleLightSample_0 ls_1)
{
    if(LightCollection_getActiveTriangleCount_0(gScene_0.lightCollection_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0) == 0U)
    {

#line 57
        return false;
    }

    float uLight_0 = sampleNext1D_0(sg_2);

#line 60
    uint _S940 = LightCollection_getActiveTriangleCount_0(gScene_0.lightCollection_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0);

    float _S941 = float(_S940);
    uint triangleIndex_2 = gScene_lightCollection_activeTriangles_0[min(uint(uLight_0 * _S941), _S940 - 1U)];
    float triangleSelectionPdf_0 = 1.0 / _S941;


    float2 u_5 = sampleNext2D_0(sg_2);
    bool _S942 = sampleTriangle_0(posW_9, triangleIndex_2, u_5, ls_1);

#line 68
    if(!_S942)
    {

#line 68
        return false;
    }

    ls_1.pdf_0 = ls_1.pdf_0 * triangleSelectionPdf_0;
    return true;
}


#line 48 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Geometry/GeometryHelpers.slang"
float3 computeRayOrigin_0(float3 pos_0, float3 normal_4)
{

#line 71
    int3 iOff_0 = int3(normal_4 * 768.0);

#line 76
    return abs(pos_0) < 0.0625 ? pos_0 + normal_4 * 0.0000457763671875 : asfloat(asint(pos_0) + (pos_0 < 0.0 ? - iOff_0 : iOff_0));
}


#line 375 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
void dsq_bwd_computeRayOrigin_0(inout DiffPair_float3_0 pos_1, inout DiffPair_float3_0 normal_5, float3 dOut_7)
{

#line 375
    pos_1.primal_0 = pos_1.primal_0;

#line 375
    pos_1.differential_0 = dOut_7;


    float3 _S943 = (float3)0.0;

#line 378
    normal_5.primal_0 = normal_5.primal_0;

#line 378
    normal_5.differential_0 = _S943;
    return;
}


#line 358
float3 dsq_computeRayOrigin_0(float3 pos_2, float3 normal_6)
{

#line 365
    int3 iOff_1 = int3(normal_6 * 768.0);

#line 370
    return abs(pos_2) < 0.0625 ? pos_2 + normal_6 * 0.0000457763671875 : asfloat(asint(pos_2) + (pos_2 < 0.0 ? - iOff_1 : iOff_1));
}


#line 122 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct LightSample_0
{
    float3 Li_0;
    float pdf_1;
    float3 origin_4;
    float distance_1;
    float3 dir_4;
    float3 lightPos_0;
    float3 lightNormal_0;
};


#line 271
bool generateEmissiveSample_0(IntersectionInfo_0 isectInfo_0, bool upperHemisphere_1, inout UniformSampleGenerator_0 sg_3, out LightSample_0 ls_2)
{

#line 277
    float3 _S944 = float3(0.0, 0.0, 0.0);

#line 277
    ls_2.Li_0 = _S944;

#line 277
    ls_2.pdf_1 = 0.0;

#line 277
    ls_2.origin_4 = _S944;

#line 277
    ls_2.distance_1 = 0.0;

#line 277
    ls_2.dir_4 = _S944;

#line 277
    ls_2.lightPos_0 = _S944;

#line 277
    ls_2.lightNormal_0 = _S944;


    TriangleLightSample_0 tls_0;
    bool _S945 = EmissiveUniformSampler_sampleLight_0(gData_0.emissiveSampler_0, isectInfo_0.posW_5, isectInfo_0.normalW_2, upperHemisphere_1, sg_3, tls_0);

#line 281
    if(!_S945)
    {

#line 281
        return false;
    }

#line 281
    float3 _S946;



    if(tls_0.pdf_0 > 0.0)
    {

#line 285
        _S946 = tls_0.Le_0 / tls_0.pdf_0;

#line 285
    }
    else
    {

#line 285
        _S946 = (float3)0.0;

#line 285
    }

#line 285
    ls_2.Li_0 = _S946;
    ls_2.pdf_1 = tls_0.pdf_0;

    float3 lightPos_1 = computeRayOrigin_0(tls_0.posW_7, tls_0.normalW_4);
    float3 _S947 = dsq_computeRayOrigin_0(isectInfo_0.posW_5, isectInfo_0.normalW_2);

#line 289
    ls_2.origin_4 = _S947;
    float3 toLight_1 = lightPos_1 - _S947;
    ls_2.distance_1 = length(toLight_1);
    ls_2.dir_4 = normalize(toLight_1);

    ls_2.lightPos_0 = tls_0.posW_7;
    ls_2.lightNormal_0 = tls_0.normalW_4;

    return any(ls_2.Li_0 > 0.0);
}


#line 44 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/Ray.slang"
Ray_0 Ray_x24init_0(float3 origin_5, float3 dir_5, float tMin_1, float tMax_1)
{

#line 44
    Ray_0 _S948;

    _S948.origin_1 = origin_5;
    _S948.dir_0 = dir_5;
    _S948.tMin_0 = tMin_1;
    _S948.tMax_0 = tMax_1;

#line 44
    return _S948;
}


#line 133 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
Ray_0 LightSample_getVisibilityRay_0(LightSample_0 this_26)
{

#line 133
    return Ray_x24init_0(this_26.origin_4, this_26.dir_4, 0.0, this_26.distance_1);
}


#line 297 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/RaytracingInline.slang"
bool traceSceneVisibilityRayImpl_0(bool useAlphaTest_1, RayQuery<517U > rayQuery_5, Ray_0 ray_4, uint rayFlags_3, uint instanceInclusionMask_3)
{

#line 297
    RayQuery<517U > _S949 = rayQuery_5;

    _S949.TraceRayInline(gScene_rtAccel_0, rayFlags_3, instanceInclusionMask_3, Ray_toRayDesc_0(ray_4));

    for(;;)
    {

#line 301
        bool _S950 = _S949.Proceed();

#line 301
        if(_S950)
        {
        }
        else
        {

#line 301
            break;
        }

        if(useAlphaTest_1 && _S949.CandidateType() == 0U)
        {

            TriangleHit_0 hit_7 = getCandidateTriangleHit_1(_S949);



            if(alphaTest_1(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, Scene_getVertexData_2(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, hit_7), Scene_getMaterialID_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, hit_7._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2), 0.0))
            {

#line 311
                continue;
            }
            _S949.CommitNonOpaqueTriangleHit();

#line 304
        }
        else
        {

#line 304
        }

#line 301
    }

#line 366
    return _S949.CommittedStatus() == 0U;
}

bool traceSceneVisibilityRay_0(Ray_0 ray_5, uint rayFlags_4, uint instanceInclusionMask_4)
{

#line 369
    RayQuery<517U > rayQuery_6;

#line 390
    return traceSceneVisibilityRayImpl_0(false, rayQuery_6, ray_5, rayFlags_4, instanceInclusionMask_4);
}


#line 403
bool SceneRayQuery_traceVisibilityRay_0(Ray_0 ray_6, uint rayFlags_5, uint instanceInclusionMask_5)
{
    return traceSceneVisibilityRay_0(ray_6, rayFlags_5, instanceInclusionMask_5);
}


#line 181 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
bool DifferentiableSceneQuery_traceVisibilityRay_0(DifferentiableSceneQuery_0 this_27, Ray_0 ray_7)
{

#line 191
    return SceneRayQuery_traceVisibilityRay_0(ray_7, 0U, 255U);
}


#line 78 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IMaterialInstance.slang"
struct BSDFProperties_0
{
    float3 emission_0;
    float roughness_0;
    float3 guideNormal_0;
    uint flags_8;
    float3 diffuseReflectionAlbedo_0;
    float3 diffuseTransmissionAlbedo_0;
    float3 specularReflectionAlbedo_0;
    float3 specularTransmissionAlbedo_0;
    float3 specularReflectance_0;
};


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/ShadingData.slang"
struct ShadingData_0
{
    float3 posW_10;
    float3 V_1;
    float2 uv_3;
    ShadingFrame_0 frame_1;
    float3 faceN_0;
    float4 tangentW_3;
    bool frontFacing_0;
    float curveRadius_2;
    float normalCurvature_0;
    MaterialHeader_0 mtl_0;
    uint materialID_6;
    float opacity_0;
    float IoR_2;
    uint geometryGradOffset_0;
    uint materialGradOffset_0;
    uint threadID_0;
};


#line 33 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterialInstance.slang"
struct PBRTDiffuseBSDF_0
{
    float3 albedo_1;
};


#line 69
struct PBRTDiffuseMaterialInstance_0
{
    ShadingFrame_0 sf_1;
    PBRTDiffuseBSDF_0 bsdf_0;
};


#line 69
PBRTDiffuseMaterialInstance_0 unpackAnyValue128_2(AnyValue128 _S951)
{

#line 69
    PBRTDiffuseMaterialInstance_0 _S952;

#line 69
    _S952.sf_1.T_1[int(0)] = asfloat(_S951.field0_1);

#line 69
    _S952.sf_1.T_1[int(1)] = asfloat(_S951.field1_1);

#line 69
    _S952.sf_1.T_1[int(2)] = asfloat(_S951.field2_1);

#line 69
    _S952.sf_1.B_1[int(0)] = asfloat(_S951.field3_1);

#line 69
    _S952.sf_1.B_1[int(1)] = asfloat(_S951.field4_1);

#line 69
    _S952.sf_1.B_1[int(2)] = asfloat(_S951.field5_1);

#line 69
    _S952.sf_1.N_2[int(0)] = asfloat(_S951.field6_1);

#line 69
    _S952.sf_1.N_2[int(1)] = asfloat(_S951.field7_1);

#line 69
    _S952.sf_1.N_2[int(2)] = asfloat(_S951.field8_1);

#line 69
    _S952.bsdf_0.albedo_1[int(0)] = asfloat(_S951.field9_1);

#line 69
    _S952.bsdf_0.albedo_1[int(1)] = asfloat(_S951.field10_1);

#line 69
    _S952.bsdf_0.albedo_1[int(2)] = asfloat(_S951.field11_1);

#line 69
    return _S952;
}


#line 121
BSDFProperties_0 PBRTDiffuseMaterialInstance_getProperties_0(PBRTDiffuseMaterialInstance_0 this_28, ShadingData_0 sd_0)
{
    float3 _S953 = float3(0.0, 0.0, 0.0);

#line 123
    BSDFProperties_0 p_2;

#line 123
    p_2.emission_0 = _S953;

#line 123
    p_2.roughness_0 = 0.0;

#line 123
    p_2.guideNormal_0 = _S953;

#line 123
    p_2.flags_8 = 0U;

#line 123
    p_2.diffuseReflectionAlbedo_0 = _S953;

#line 123
    p_2.diffuseTransmissionAlbedo_0 = _S953;

#line 123
    p_2.specularReflectionAlbedo_0 = _S953;

#line 123
    p_2.specularTransmissionAlbedo_0 = _S953;

#line 123
    p_2.specularReflectance_0 = _S953;

    p_2.guideNormal_0 = this_28.sf_1.N_2;
    p_2.roughness_0 = 1.0;
    p_2.diffuseReflectionAlbedo_0 = this_28.bsdf_0.albedo_1;

    return p_2;
}


#line 57 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
struct StandardBSDFData_0
{
    float3 diffuse_0;
    float3 specular_1;
    float roughness_1;
    float metallic_0;
    float eta_0;
    float3 transmission_1;
    float diffuseTransmission_1;
    float specularTransmission_1;
};


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterialInstance.slang"
struct StandardMaterialInstance_0
{
    ShadingFrame_0 sf_2;
    StandardBSDFData_0 data_7;
    float3 emission_1;
};


#line 68
StandardMaterialInstance_0 unpackAnyValue128_3(AnyValue128 _S954)
{

#line 68
    StandardMaterialInstance_0 _S955;

#line 68
    _S955.sf_2.T_1[int(0)] = asfloat(_S954.field0_1);

#line 68
    _S955.sf_2.T_1[int(1)] = asfloat(_S954.field1_1);

#line 68
    _S955.sf_2.T_1[int(2)] = asfloat(_S954.field2_1);

#line 68
    _S955.sf_2.B_1[int(0)] = asfloat(_S954.field3_1);

#line 68
    _S955.sf_2.B_1[int(1)] = asfloat(_S954.field4_1);

#line 68
    _S955.sf_2.B_1[int(2)] = asfloat(_S954.field5_1);

#line 68
    _S955.sf_2.N_2[int(0)] = asfloat(_S954.field6_1);

#line 68
    _S955.sf_2.N_2[int(1)] = asfloat(_S954.field7_1);

#line 68
    _S955.sf_2.N_2[int(2)] = asfloat(_S954.field8_1);

#line 68
    _S955.data_7.diffuse_0[int(0)] = asfloat(_S954.field9_1);

#line 68
    _S955.data_7.diffuse_0[int(1)] = asfloat(_S954.field10_1);

#line 68
    _S955.data_7.diffuse_0[int(2)] = asfloat(_S954.field11_1);

#line 68
    _S955.data_7.specular_1[int(0)] = asfloat(_S954.field12_1);

#line 68
    _S955.data_7.specular_1[int(1)] = asfloat(_S954.field13_1);

#line 68
    _S955.data_7.specular_1[int(2)] = asfloat(_S954.field14_1);

#line 68
    _S955.data_7.roughness_1 = asfloat(_S954.field15_1);

#line 68
    _S955.data_7.metallic_0 = asfloat(_S954.field16_1);

#line 68
    _S955.data_7.eta_0 = asfloat(_S954.field17_1);

#line 68
    _S955.data_7.transmission_1[int(0)] = asfloat(_S954.field18_1);

#line 68
    _S955.data_7.transmission_1[int(1)] = asfloat(_S954.field19_1);

#line 68
    _S955.data_7.transmission_1[int(2)] = asfloat(_S954.field20_1);

#line 68
    _S955.data_7.diffuseTransmission_1 = asfloat(_S954.field21_1);

#line 68
    _S955.data_7.specularTransmission_1 = asfloat(_S954.field22_1);

#line 68
    _S955.emission_1[int(0)] = asfloat(_S954.field23_1);

#line 68
    _S955.emission_1[int(1)] = asfloat(_S954.field24_1);

#line 68
    _S955.emission_1[int(2)] = asfloat(_S954.field25_1);

#line 68
    return _S955;
}


#line 128
BSDFProperties_0 StandardMaterialInstance_getProperties_0(StandardMaterialInstance_0 this_29, ShadingData_0 sd_1)
{
    float3 _S956 = float3(0.0, 0.0, 0.0);

#line 130
    BSDFProperties_0 p_3;

#line 130
    p_3.emission_0 = _S956;

#line 130
    p_3.roughness_0 = 0.0;

#line 130
    p_3.guideNormal_0 = _S956;

#line 130
    p_3.flags_8 = 0U;

#line 130
    p_3.diffuseReflectionAlbedo_0 = _S956;

#line 130
    p_3.diffuseTransmissionAlbedo_0 = _S956;

#line 130
    p_3.specularReflectionAlbedo_0 = _S956;

#line 130
    p_3.specularTransmissionAlbedo_0 = _S956;

#line 130
    p_3.specularReflectance_0 = _S956;

    p_3.guideNormal_0 = this_29.sf_2.N_2;
    p_3.emission_0 = this_29.emission_1;

#line 133
    float _S957 = this_29.data_7.roughness_1;

#line 133
    float _S958;

#line 138
    if(_S957 * _S957 < 0.00639999983832240105)
    {

#line 138
        _S958 = 0.0;

#line 138
    }
    else
    {

#line 138
        _S958 = this_29.data_7.roughness_1;

#line 138
    }

#line 138
    p_3.roughness_0 = _S958;



    float _S959 = 1.0 - this_29.data_7.specularTransmission_1;

#line 142
    p_3.diffuseReflectionAlbedo_0 = (1.0 - this_29.data_7.diffuseTransmission_1) * _S959 * this_29.data_7.diffuse_0;
    p_3.diffuseTransmissionAlbedo_0 = this_29.data_7.diffuseTransmission_1 * _S959 * this_29.data_7.transmission_1;
    p_3.specularReflectionAlbedo_0 = _S959 * this_29.data_7.specular_1;
    p_3.specularTransmissionAlbedo_0 = this_29.data_7.specularTransmission_1 * this_29.data_7.specular_1;


    p_3.specularReflectance_0 = this_29.data_7.specular_1;

    if(this_29.data_7.diffuseTransmission_1 > 0.0 || this_29.data_7.specularTransmission_1 > 0.0)
    {

#line 150
        p_3.flags_8 = p_3.flags_8 | 1U;

#line 150
    }
    else
    {

#line 150
    }

    return p_3;
}


#line 152
BSDFProperties_0 _S960(Tuple_0 _S961, ShadingData_0 _S962)
{

#line 152
    switch(_S961.value1_0.x)
    {
    case 0U:
        {

#line 152
            return PBRTDiffuseMaterialInstance_getProperties_0(unpackAnyValue128_2(_S961.value2_0), _S962);
        }
    default:
        {

#line 152
            return StandardMaterialInstance_getProperties_0(unpackAnyValue128_3(_S961.value2_0), _S962);
        }
    }

#line 152
}


#line 59 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IMaterialInstance.slang"
struct BSDFSample_0
{
    float3 wo_0;
    float pdf_2;
    float3 weight_0;
    uint lobeType_0;
};


#line 98 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/ShadingFrame.slang"
float3 ShadingFrame_toLocal_0(ShadingFrame_0 this_30, float3 v_4)
{

#line 98
    return float3(dot(v_4, this_30.T_1), dot(v_4, this_30.B_1), dot(v_4, this_30.N_2));
}


#line 321 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/MathHelpers.slang"
float2 sample_disk_concentric_0(float2 u_6)
{
    float2 _S963 = 2.0 * u_6 - 1.0;
    float _S964 = _S963.x;

#line 324
    float _S965 = _S963.y;

#line 324
    if(_S964 == 0.0 && _S965 == 0.0)
    {

#line 325
        return _S963;
    }

#line 325
    float r_0;

#line 325
    float phi_1;

    if(abs(_S964) > abs(_S965))
    {

        float _S966 = _S965 / _S964 * 0.78539818525314331055;

#line 330
        r_0 = _S964;

#line 330
        phi_1 = _S966;

#line 330
    }
    else
    {


        float _S967 = 1.57079637050628662109 - _S964 / _S965 * 0.78539818525314331055;

#line 335
        r_0 = _S965;

#line 335
        phi_1 = _S967;

#line 335
    }

    return r_0 * float2(cos(phi_1), sin(phi_1));
}


#line 346
float3 sample_cosine_hemisphere_concentric_0(float2 u_7, out float pdf_3)
{
    float2 d_2 = sample_disk_concentric_0(u_7);
    float z_2 = sqrt(max(0.0, 1.0 - dot(d_2, d_2)));
    pdf_3 = z_2 * 0.31830987334251403809;
    return float3(d_2, z_2);
}


#line 42 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterialInstance.slang"
bool PBRTDiffuseBSDF_sample_0(PBRTDiffuseBSDF_0 this_31, float3 wiLocal_0, out float3 wo_1, out float pdf_4, out float3 weight_1, out uint lobeType_1, inout UniformSampleGenerator_0 sg_4)
{
    float2 _S968 = sampleNext2D_0(sg_4);

#line 44
    float3 _S969 = sample_cosine_hemisphere_concentric_0(_S968, pdf_4);

#line 44
    wo_1 = _S969;
    weight_1 = this_31.albedo_1;
    lobeType_1 = 1U;

    return true;
}


#line 90 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/ShadingFrame.slang"
float3 ShadingFrame_fromLocal_0(ShadingFrame_0 this_32, float3 v_5)
{

#line 90
    return this_32.T_1 * v_5.x + this_32.B_1 * v_5.y + this_32.N_2 * v_5.z;
}


#line 171 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
bool isValidHemisphereReflection_0(ShadingData_0 sd_2, ShadingFrame_0 sf_3, float3 wiLocal_1, float3 woLocal_0, float3 wo_2)
{

    if(min(wiLocal_1.z, woLocal_0.z) < 0.00000099999999747524)
    {

#line 174
        return false;
    }



    if(sd_2.frontFacing_0 != dot(wo_2, sd_2.faceN_0) >= 0.0)
    {

#line 179
        return false;
    }



    if(sd_2.frontFacing_0 != dot(sf_3.N_2, sd_2.faceN_0) >= 0.0)
    {

#line 184
        return false;
    }

    return true;
}


#line 97 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterialInstance.slang"
bool PBRTDiffuseMaterialInstance_sample_0(PBRTDiffuseMaterialInstance_0 this_33, ShadingData_0 sd_3, inout UniformSampleGenerator_0 sg_5, out BSDFSample_0 result_14, bool useImportanceSampling_0)
{
    float3 wiLocal_2 = ShadingFrame_toLocal_0(this_33.sf_1, sd_3.V_1);
    float3 woLocal_1 = float3(0.0, 0.0, 0.0);

    bool valid_2 = PBRTDiffuseBSDF_sample_0(this_33.bsdf_0, wiLocal_2, woLocal_1, result_14.pdf_2, result_14.weight_0, result_14.lobeType_0, sg_5);
    float3 _S970 = ShadingFrame_fromLocal_0(this_33.sf_1, woLocal_1);

#line 103
    result_14.wo_0 = _S970;

    if(!isValidHemisphereReflection_0(sd_3, this_33.sf_1, wiLocal_2, woLocal_1, _S970) || result_14.pdf_2 == 0.0)
    {

#line 105
        return false;
    }
    return valid_2;
}


#line 194 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
uint StandardBSDF_getLobeTypes_0(StandardBSDFData_0 data_8)
{

    float _S971 = data_8.roughness_1;
    bool isDelta_0 = _S971 * _S971 < 0.00639999983832240105;

#line 198
    uint lobeTypes_0;

#line 205
    if(isDelta_0)
    {

#line 205
        lobeTypes_0 = 4U;

#line 205
    }
    else
    {

#line 205
        lobeTypes_0 = 2U;

#line 205
    }
    if(any(data_8.diffuse_0 > 0.0) && data_8.specularTransmission_1 < 1.0)
    {
        if(data_8.diffuseTransmission_1 < 1.0)
        {

#line 208
            lobeTypes_0 = lobeTypes_0 | 1U;

#line 208
        }
        else
        {

#line 208
        }

        if(data_8.diffuseTransmission_1 > 0.0)
        {

#line 210
            lobeTypes_0 = lobeTypes_0 | 16U;

#line 210
        }
        else
        {

#line 210
        }

#line 210
    }
    else
    {

#line 210
    }


    if(data_8.specularTransmission_1 > 0.0)
    {

#line 213
        uint _S972;
        if(isDelta_0)
        {

#line 214
            _S972 = 64U;

#line 214
        }
        else
        {

#line 214
            _S972 = 32U;

#line 214
        }

#line 214
        lobeTypes_0 = lobeTypes_0 | _S972;

#line 214
    }
    else
    {

#line 214
    }

    return lobeTypes_0;
}


#line 155 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterialInstance.slang"
uint StandardMaterialInstance_getLobeTypes_0(StandardMaterialInstance_0 this_34, ShadingData_0 sd_4)
{
    return StandardBSDF_getLobeTypes_0(this_34.data_7);
}


#line 39 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/FrostbiteDiffuseBRDF.slang"
struct FrostbiteDiffuseBRDF_0
{
    float3 albedo_2;
    float roughness_2;
};


#line 36 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/LambertDiffuseBTDF.slang"
struct LambertDiffuseBTDF_0
{
    float3 albedo_3;
};


#line 49 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
struct SpecularMicrofacetBRDF_0
{
    float3 albedo_4;
    float alpha_2;
    uint activeLobes_0;
};


#line 196
struct SpecularMicrofacetBSDF_0
{
    float3 transmissionAlbedo_0;
    float alpha_3;
    float eta_1;
    uint activeLobes_1;
};


#line 89 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
struct StandardBSDF_0
{
    FrostbiteDiffuseBRDF_0 diffuseReflection_0;
    LambertDiffuseBTDF_0 diffuseTransmission_2;
    SpecularMicrofacetBRDF_0 specularReflection_0;
    SpecularMicrofacetBSDF_0 specularTransmission_2;
    float diffTrans_0;
    float specTrans_0;
    float pDiffuseReflection_0;
    float pDiffuseTransmission_0;
    float pSpecularReflection_0;
    float pSpecularTransmission_0;
};


#line 138 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
bool MaterialHeader_isThinSurface_0(MaterialHeader_0 this_35)
{

#line 138
    return bool(this_35.packedData_0.x & 536870912U);
}


#line 114
uint MaterialHeader_getActiveLobes_0(MaterialHeader_0 this_36)
{

#line 114
    return this_36.packedData_0.x >> 20U & 255U;
}


#line 44 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Color/ColorHelpers.slang"
float luminance_0(float3 rgb_0)
{
    return dot(rgb_0, float3(0.21259999275207519531, 0.71520000696182250977, 0.07220000028610229492));
}


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/Fresnel.slang"
float3 evalFresnelSchlick_0(float3 f0_0, float3 f90_0, float cosTheta_3)
{
    return f0_0 + (f90_0 - f0_0) * pow(max(1.0 - cosTheta_3, 0.0), 5.0);
}


#line 118 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
StandardBSDF_0 StandardBSDF_x24init_0(float3 wi_0, MaterialHeader_0 mtl_1, StandardBSDFData_0 data_9)
{

#line 118
    StandardBSDF_0 _S973;

#line 118
    float3 transmissionAlbedo_1;

#line 125
    if(MaterialHeader_isThinSurface_0(mtl_1))
    {

#line 125
        transmissionAlbedo_1 = data_9.transmission_1;

#line 125
    }
    else
    {

#line 125
        transmissionAlbedo_1 = sqrt(data_9.transmission_1);

#line 125
    }


    _S973.diffuseReflection_0.albedo_2 = data_9.diffuse_0;

    _S973.diffuseReflection_0.roughness_2 = data_9.roughness_1;

    _S973.diffuseTransmission_2.albedo_3 = transmissionAlbedo_1;


    float alpha_4 = data_9.roughness_1 * data_9.roughness_1;

#line 135
    float alpha_5;


    if(alpha_4 < 0.00639999983832240105)
    {

#line 138
        alpha_5 = 0.0;

#line 138
    }
    else
    {

#line 138
        alpha_5 = alpha_4;

#line 138
    }

#line 143
    uint activeLobes_2 = MaterialHeader_getActiveLobes_0(mtl_1);

    _S973.specularReflection_0.albedo_4 = data_9.specular_1;
    _S973.specularReflection_0.alpha_2 = alpha_5;
    _S973.specularReflection_0.activeLobes_0 = activeLobes_2;

    _S973.specularTransmission_2.transmissionAlbedo_0 = transmissionAlbedo_1;


    if(data_9.eta_0 == 1.0)
    {

#line 152
        alpha_5 = 0.0;

#line 152
    }
    else
    {

#line 152
    }

#line 152
    _S973.specularTransmission_2.alpha_3 = alpha_5;
    _S973.specularTransmission_2.eta_1 = data_9.eta_0;
    _S973.specularTransmission_2.activeLobes_1 = activeLobes_2;


    _S973.diffTrans_0 = data_9.diffuseTransmission_1;
    _S973.specTrans_0 = data_9.specularTransmission_1;


    float _S974 = 1.0 - data_9.specularTransmission_1;

#line 161
    float metallicBRDF_0 = data_9.metallic_0 * _S974;
    float dielectricBSDF_0 = (1.0 - data_9.metallic_0) * _S974;


    float diffuseWeight_0 = luminance_0(data_9.diffuse_0);
    float specularWeight_0 = luminance_0(evalFresnelSchlick_0(data_9.specular_1, (float3)1.0, wi_0.z));

    if(bool(activeLobes_2 & 1U))
    {

#line 168
        alpha_5 = diffuseWeight_0 * dielectricBSDF_0 * (1.0 - _S973.diffTrans_0);

#line 168
    }
    else
    {

#line 168
        alpha_5 = 0.0;

#line 168
    }

#line 168
    _S973.pDiffuseReflection_0 = alpha_5;
    if(bool(activeLobes_2 & 16U))
    {

#line 169
        alpha_5 = diffuseWeight_0 * dielectricBSDF_0 * _S973.diffTrans_0;

#line 169
    }
    else
    {

#line 169
        alpha_5 = 0.0;

#line 169
    }

#line 169
    _S973.pDiffuseTransmission_0 = alpha_5;

    if(bool(activeLobes_2 & 6U))
    {

#line 171
        alpha_5 = specularWeight_0 * (metallicBRDF_0 + dielectricBSDF_0);

#line 171
    }
    else
    {

#line 171
        alpha_5 = 0.0;

#line 171
    }

#line 170
    _S973.pSpecularReflection_0 = alpha_5;

#line 175
    if(bool(activeLobes_2 & 102U))
    {

#line 175
        alpha_5 = data_9.specularTransmission_1;

#line 175
    }
    else
    {

#line 175
        alpha_5 = 0.0;

#line 175
    }

#line 173
    _S973.pSpecularTransmission_0 = alpha_5;

#line 178
    float _S975 = _S973.pDiffuseReflection_0 + _S973.pDiffuseTransmission_0 + _S973.pSpecularReflection_0 + alpha_5;
    if(_S975 > 0.0)
    {
        float normFactor_0 = 1.0 / _S975;
        _S973.pDiffuseReflection_0 = _S973.pDiffuseReflection_0 * normFactor_0;
        _S973.pDiffuseTransmission_0 = _S973.pDiffuseTransmission_0 * normFactor_0;
        _S973.pSpecularReflection_0 = _S973.pSpecularReflection_0 * normFactor_0;
        _S973.pSpecularTransmission_0 = _S973.pSpecularTransmission_0 * normFactor_0;

#line 179
    }
    else
    {

#line 179
    }

#line 118
    return _S973;
}


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/Fresnel.slang"
float evalFresnelSchlick_1(float f0_1, float f90_1, float cosTheta_4)
{
    return f0_1 + (f90_1 - f0_1) * pow(max(1.0 - cosTheta_4, 0.0), 5.0);
}


#line 80 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/FrostbiteDiffuseBRDF.slang"
float3 FrostbiteDiffuseBRDF_evalWeight_0(FrostbiteDiffuseBRDF_0 this_37, float3 wi_1, float3 wo_3)
{

    float woDotH_0 = dot(wo_3, normalize(wi_1 + wo_3));


    float fd90_0 = lerp(0.0, 0.5, this_37.roughness_2) + 2.0 * woDotH_0 * woDotH_0 * this_37.roughness_2;



    return this_37.albedo_2 * evalFresnelSchlick_1(1.0, fd90_0, wi_1.z) * evalFresnelSchlick_1(1.0, fd90_0, wo_3.z) * lerp(1.0, 0.66225165128707885742, this_37.roughness_2);
}


#line 45
float3 FrostbiteDiffuseBRDF_eval_0(FrostbiteDiffuseBRDF_0 this_38, float3 wi_2, float3 wo_4, inout UniformSampleGenerator_0 sg_6)
{
    float _S976 = wo_4.z;

#line 47
    if(min(wi_2.z, _S976) < 0.00000099999999747524)
    {

#line 48
        return (float3)0.0;
    }
    return FrostbiteDiffuseBRDF_evalWeight_0(this_38, wi_2, wo_4) * 0.31830987334251403809 * _S976;
}


#line 41 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/LambertDiffuseBTDF.slang"
float3 LambertDiffuseBTDF_eval_0(LambertDiffuseBTDF_0 this_39, float3 wi_3, float3 wo_5, inout UniformSampleGenerator_0 sg_7)
{
    float _S977 = wo_5.z;

#line 43
    if(min(wi_3.z, - _S977) < 0.00000099999999747524)
    {

#line 44
        return (float3)0.0;
    }
    return 0.31830987334251403809 * this_39.albedo_3 * - _S977;
}


#line 55 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
bool SpecularMicrofacetBRDF_hasLobe_0(SpecularMicrofacetBRDF_0 this_40, int lobeType_2)
{

#line 55
    return (this_40.activeLobes_0 & uint(lobeType_2)) != 0U;
}


#line 46 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IsotropicGGX.slang"
float evalNdfGGX_0(float alpha_6, float cosTheta_5)
{
    float a2_0 = alpha_6 * alpha_6;
    float d_3 = (cosTheta_5 * a2_0 - cosTheta_5) * cosTheta_5 + 1.0;
    return a2_0 / (d_3 * d_3 * 3.14159274101257324219);
}


#line 167
float evalLambdaGGX_0(float alphaSqr_0, float cosTheta_6)
{
    if(cosTheta_6 <= 0.0)
    {

#line 169
        return 0.0;
    }

#line 170
    float cosThetaSqr_0 = cosTheta_6 * cosTheta_6;

    return 0.5 * (-1.0 + sqrt(1.0 + alphaSqr_0 * (max(1.0 - cosThetaSqr_0, 0.0) / cosThetaSqr_0)));
}


#line 204
float evalMaskingSmithGGXCorrelated_0(float alpha_7, float cosThetaI_0, float cosThetaO_0)
{
    float alphaSqr_1 = alpha_7 * alpha_7;


    return 1.0 / (1.0 + evalLambdaGGX_0(alphaSqr_1, cosThetaI_0) + evalLambdaGGX_0(alphaSqr_1, cosThetaO_0));
}


#line 58 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
float3 SpecularMicrofacetBRDF_eval_0(SpecularMicrofacetBRDF_0 this_41, float3 wi_4, float3 wo_6, inout UniformSampleGenerator_0 sg_8)
{
    float _S978 = wi_4.z;

#line 60
    float _S979 = wo_6.z;

#line 60
    if(min(_S978, _S979) < 0.00000099999999747524)
    {

#line 61
        return (float3)0.0;
    }


    if(this_41.alpha_2 == 0.0)
    {

#line 66
        return (float3)0.0;
    }

    if(!SpecularMicrofacetBRDF_hasLobe_0(this_41, int(2)))
    {

#line 70
        return (float3)0.0;
    }
    float3 h_0 = normalize(wi_4 + wo_6);

#line 82
    return evalFresnelSchlick_0(this_41.albedo_4, (float3)1.0, dot(wi_4, h_0)) * evalNdfGGX_0(this_41.alpha_2, h_0.z) * evalMaskingSmithGGXCorrelated_0(this_41.alpha_2, _S978, _S979) * 0.25 / _S978;
}


#line 203
bool SpecularMicrofacetBSDF_hasLobe_0(SpecularMicrofacetBSDF_0 this_42, int lobeType_3)
{

#line 203
    return (this_42.activeLobes_1 & uint(lobeType_3)) != 0U;
}


#line 67 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/Fresnel.slang"
float evalFresnelDielectric_0(float eta_2, float cosThetaI_1, out float cosThetaT_0)
{

#line 67
    float _S980;

#line 67
    float _S981;

    if(cosThetaI_1 < 0.0)
    {

        float _S982 = - cosThetaI_1;

#line 72
        _S980 = 1.0 / eta_2;

#line 72
        _S981 = _S982;

#line 72
    }
    else
    {

#line 72
        _S980 = eta_2;

#line 72
        _S981 = cosThetaI_1;

#line 72
    }


    float sinThetaTSq_0 = _S980 * _S980 * (1.0 - _S981 * _S981);

    if(sinThetaTSq_0 > 1.0)
    {
        cosThetaT_0 = 0.0;
        return 1.0;
    }

    float _S983 = sqrt(1.0 - sinThetaTSq_0);

#line 83
    cosThetaT_0 = _S983;



    float _S984 = _S980 * _S981;

#line 87
    float Rs_0 = (_S984 - _S983) / (_S984 + _S983);
    float _S985 = _S980 * _S983;

#line 88
    float Rp_0 = (_S985 - _S981) / (_S985 + _S981);

    return 0.5 * (Rs_0 * Rs_0 + Rp_0 * Rp_0);
}


#line 101
float evalFresnelDielectric_1(float eta_3, float cosThetaI_2)
{
    float cosThetaT_1;
    return evalFresnelDielectric_0(eta_3, cosThetaI_2, cosThetaT_1);
}


#line 206 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
float3 SpecularMicrofacetBSDF_eval_0(SpecularMicrofacetBSDF_0 this_43, float3 wi_5, float3 wo_7, inout UniformSampleGenerator_0 sg_9)
{
    float _S986 = wi_5.z;

#line 208
    float _S987 = wo_7.z;

#line 208
    float _S988 = abs(_S987);

#line 208
    if(min(_S986, _S988) < 0.00000099999999747524)
    {

#line 209
        return (float3)0.0;
    }


    if(this_43.alpha_3 == 0.0)
    {

#line 214
        return (float3)0.0;
    }



    bool isReflection_0 = _S987 > 0.0;
    if(isReflection_0 && !SpecularMicrofacetBSDF_hasLobe_0(this_43, int(2)) || !isReflection_0 && !SpecularMicrofacetBSDF_hasLobe_0(this_43, int(32)))
    {

#line 221
        return (float3)0.0;
    }

#line 221
    float _S989;


    if(isReflection_0)
    {

#line 224
        _S989 = 1.0;

#line 224
    }
    else
    {

#line 224
        _S989 = this_43.eta_1;

#line 224
    }

#line 224
    float3 h_1 = normalize(wo_7 + wi_5 * _S989);
    float3 h_2 = h_1 * float(sign(h_1.z));

    float wiDotH_0 = dot(wi_5, h_2);
    float woDotH_1 = dot(wo_7, h_2);

    float D_0 = evalNdfGGX_0(this_43.alpha_3, h_2.z);



    float G_0 = evalMaskingSmithGGXCorrelated_0(this_43.alpha_3, _S986, _S988);

    float F_0 = evalFresnelDielectric_1(this_43.eta_1, wiDotH_0);

    if(isReflection_0)
    {
        return (float3)(F_0 * D_0 * G_0 * 0.25 / _S986);
    }
    else
    {
        float sqrtDenom_0 = woDotH_1 + this_43.eta_1 * wiDotH_0;

        return this_43.transmissionAlbedo_0 * (1.0 - F_0) * D_0 * G_0 * abs(this_43.eta_1 * this_43.eta_1 * wiDotH_0 * woDotH_1 / (_S986 * sqrtDenom_0 * sqrtDenom_0));
    }

#line 246
}


#line 220 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
float3 StandardBSDF_eval_0(StandardBSDF_0 this_44, float3 wi_6, float3 wo_8, inout UniformSampleGenerator_0 sg_10)
{
    float3 result_15 = (float3)0.0;

#line 222
    float3 result_16;
    if(this_44.pDiffuseReflection_0 > 0.0)
    {

#line 224
        float _S990 = (1.0 - this_44.specTrans_0) * (1.0 - this_44.diffTrans_0);

#line 224
        float3 _S991 = FrostbiteDiffuseBRDF_eval_0(this_44.diffuseReflection_0, wi_6, wo_8, sg_10);

#line 224
        result_16 = _S990 * _S991;

#line 224
    }
    else
    {

#line 224
        result_16 = result_15;

#line 224
    }
    if(this_44.pDiffuseTransmission_0 > 0.0)
    {

#line 226
        float _S992 = (1.0 - this_44.specTrans_0) * this_44.diffTrans_0;

#line 226
        float3 _S993 = LambertDiffuseBTDF_eval_0(this_44.diffuseTransmission_2, wi_6, wo_8, sg_10);

#line 226
        result_16 = result_16 + _S992 * _S993;

#line 226
    }
    else
    {

#line 226
    }
    if(this_44.pSpecularReflection_0 > 0.0)
    {

#line 228
        float _S994 = 1.0 - this_44.specTrans_0;

#line 228
        float3 _S995 = SpecularMicrofacetBRDF_eval_0(this_44.specularReflection_0, wi_6, wo_8, sg_10);

#line 228
        result_16 = result_16 + _S994 * _S995;

#line 228
    }
    else
    {

#line 228
    }
    if(this_44.pSpecularTransmission_0 > 0.0)
    {

#line 230
        float3 _S996 = SpecularMicrofacetBSDF_eval_0(this_44.specularTransmission_2, wi_6, wo_8, sg_10);

#line 230
        result_16 = result_16 + this_44.specTrans_0 * _S996;

#line 230
    }
    else
    {

#line 230
    }
    return result_16;
}


#line 174 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterialInstance.slang"
bool StandardMaterialInstance_sampleReference_0(StandardMaterialInstance_0 this_45, ShadingData_0 sd_5, float3 wi_7, out float3 wo_9, out float pdf_5, out float3 weight_2, out uint lobeType_4, inout UniformSampleGenerator_0 sg_11)
{
    bool isTransmissive_0 = (StandardMaterialInstance_getLobeTypes_0(this_45, sd_5) & 240U) != 0U;

    float2 _S997 = sampleNext2D_0(sg_11);

#line 178
    float3 _S998 = sample_cosine_hemisphere_concentric_0(_S997, pdf_5);

#line 178
    wo_9 = _S998;


    weight_2 = (float3)0.0;
    lobeType_4 = 0U;

    if(isTransmissive_0)
    {
        float _S999 = sampleNext1D_0(sg_11);

#line 186
        if(_S999 < 0.5)
        {
            wo_9[int(2)] = - wo_9.z;

#line 186
        }
        else
        {

#line 186
        }



        float _S1000 = pdf_5 * 0.5;

#line 190
        pdf_5 = _S1000;
        if(min(abs(wi_7.z), abs(wo_9.z)) < 0.00000099999999747524 || _S1000 == 0.0)
        {

#line 191
            return false;
        }

#line 184
    }
    else
    {

#line 195
        if(min(wi_7.z, wo_9.z) < 0.00000099999999747524 || pdf_5 == 0.0)
        {

#line 195
            return false;
        }

#line 184
    }

#line 200
    float3 _S1001 = StandardBSDF_eval_0(StandardBSDF_x24init_0(wi_7, sd_5.mtl_0, this_45.data_7), wi_7, wo_9, sg_11);

#line 200
    weight_2 = _S1001 / pdf_5;

#line 200
    int _S1002;
    if(wo_9.z > 0.0)
    {

#line 201
        _S1002 = int(1);

#line 201
    }
    else
    {

#line 201
        _S1002 = int(16);

#line 201
    }

#line 201
    lobeType_4 = uint(_S1002);

    return true;
}


#line 53 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/FrostbiteDiffuseBRDF.slang"
bool FrostbiteDiffuseBRDF_sample_0(FrostbiteDiffuseBRDF_0 this_46, float3 wi_8, out float3 wo_10, out float pdf_6, out float3 weight_3, out uint lobeType_5, inout UniformSampleGenerator_0 sg_12)
{
    float2 _S1003 = sampleNext2D_0(sg_12);

#line 55
    float3 _S1004 = sample_cosine_hemisphere_concentric_0(_S1003, pdf_6);

#line 55
    wo_10 = _S1004;
    lobeType_5 = 1U;

    if(min(wi_8.z, wo_10.z) < 0.00000099999999747524)
    {
        weight_3 = float3(0.0, 0.0, 0.0);
        return false;
    }

    weight_3 = FrostbiteDiffuseBRDF_evalWeight_0(this_46, wi_8, wo_10);
    return true;
}


#line 152 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IsotropicGGX.slang"
float evalG1GGX_0(float alphaSqr_2, float cosTheta_7)
{
    if(cosTheta_7 <= 0.0)
    {

#line 154
        return 0.0;
    }

#line 155
    float cosThetaSqr_1 = cosTheta_7 * cosTheta_7;

    return 2.0 / (1.0 + sqrt(1.0 + alphaSqr_2 * (max(1.0 - cosThetaSqr_1, 0.0) / cosThetaSqr_1)));
}


#line 96
float evalPdfGGX_VNDF_0(float alpha_8, float3 wi_9, float3 h_3)
{
    float _S1005 = wi_9.z;

    return evalG1GGX_0(alpha_8 * alpha_8, _S1005) * evalNdfGGX_0(alpha_8, h_3.z) * max(0.0, dot(wi_9, h_3)) / _S1005;
}


#line 154 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
float SpecularMicrofacetBRDF_evalPdf_0(SpecularMicrofacetBRDF_0 this_47, float3 wi_10, float3 wo_11)
{
    if(min(wi_10.z, wo_11.z) < 0.00000099999999747524)
    {

#line 157
        return 0.0;
    }


    if(this_47.alpha_2 == 0.0)
    {

#line 162
        return 0.0;
    }

    if(!SpecularMicrofacetBRDF_hasLobe_0(this_47, int(2)))
    {

#line 166
        return 0.0;
    }
    float3 h_4 = normalize(wi_10 + wo_11);

#line 175
    return evalPdfGGX_VNDF_0(this_47.alpha_2, wi_10, h_4) / (4.0 * dot(wi_10, h_4));
}


#line 382
float SpecularMicrofacetBSDF_evalPdf_0(SpecularMicrofacetBSDF_0 this_48, float3 wi_11, float3 wo_12)
{
    float _S1006 = wo_12.z;

#line 384
    if(min(wi_11.z, abs(_S1006)) < 0.00000099999999747524)
    {

#line 385
        return 0.0;
    }


    if(this_48.alpha_3 == 0.0)
    {

#line 390
        return 0.0;
    }

    bool isReflection_1 = _S1006 > 0.0;
    bool hasReflection_0 = SpecularMicrofacetBSDF_hasLobe_0(this_48, int(2));
    bool hasTransmission_0 = SpecularMicrofacetBSDF_hasLobe_0(this_48, int(32));
    if(isReflection_1 && !hasReflection_0 || !isReflection_1 && !hasTransmission_0)
    {

#line 397
        return 0.0;
    }

#line 397
    float pdf_7;


    if(isReflection_1)
    {

#line 400
        pdf_7 = 1.0;

#line 400
    }
    else
    {

#line 400
        pdf_7 = this_48.eta_1;

#line 400
    }

#line 400
    float3 h_5 = normalize(wo_12 + wi_11 * pdf_7);
    float3 h_6 = h_5 * float(sign(h_5.z));

    float wiDotH_1 = dot(wi_11, h_6);
    float woDotH_2 = dot(wo_12, h_6);

    float F_1 = evalFresnelDielectric_1(this_48.eta_1, wiDotH_1);


    float pdf_8 = evalPdfGGX_VNDF_0(this_48.alpha_3, wi_11, h_6);



    if(isReflection_1)
    {

#line 413
        pdf_7 = pdf_8 / (4.0 * woDotH_2);

#line 413
    }
    else
    {



        if(woDotH_2 > 0.0)
        {

#line 420
            return 0.0;
        }

#line 421
        float sqrtDenom_1 = woDotH_2 + this_48.eta_1 * wiDotH_1;
        float denom_0 = sqrtDenom_1 * sqrtDenom_1;
        if(denom_0 > 0.0)
        {

#line 423
            pdf_7 = pdf_8 * abs(woDotH_2) / denom_0;

#line 423
        }
        else
        {

#line 423
            pdf_7 = 340282346638528859811704183484516925440.0;

#line 423
        }

#line 423
    }


    if(hasReflection_0 && hasTransmission_0)
    {

#line 426
        float _S1007;

        if(isReflection_1)
        {

#line 428
            _S1007 = F_1;

#line 428
        }
        else
        {

#line 428
            _S1007 = 1.0 - F_1;

#line 428
        }

#line 428
        pdf_7 = pdf_7 * _S1007;

#line 428
    }
    else
    {

#line 428
    }


    return pdf_7;
}


#line 49 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/LambertDiffuseBTDF.slang"
bool LambertDiffuseBTDF_sample_0(LambertDiffuseBTDF_0 this_49, float3 wi_12, out float3 wo_13, out float pdf_9, out float3 weight_4, out uint lobeType_6, inout UniformSampleGenerator_0 sg_13)
{
    float2 _S1008 = sampleNext2D_0(sg_13);

#line 51
    float3 _S1009 = sample_cosine_hemisphere_concentric_0(_S1008, pdf_9);

#line 51
    wo_13 = _S1009;
    wo_13[int(2)] = - _S1009.z;
    lobeType_6 = 16U;

    if(min(wi_12.z, - wo_13.z) < 0.00000099999999747524)
    {
        weight_4 = float3(0.0, 0.0, 0.0);
        return false;
    }

    weight_4 = this_49.albedo_3;
    return true;
}


#line 113 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IsotropicGGX.slang"
float3 sampleGGX_VNDF_0(float alpha_9, float3 wi_13, float2 u_8, out float pdf_10)
{



    float3 Vh_0 = normalize(float3(alpha_9 * wi_13.x, alpha_9 * wi_13.y, wi_13.z));


    float _S1010 = Vh_0.z;

#line 121
    float3 T1_0;

#line 121
    if(_S1010 < 0.99989998340606689453)
    {

#line 121
        T1_0 = normalize(cross(float3(0.0, 0.0, 1.0), Vh_0));

#line 121
    }
    else
    {

#line 121
        T1_0 = float3(1.0, 0.0, 0.0);

#line 121
    }



    float r_1 = sqrt(u_8.x);
    float phi_2 = 6.28318548202514648438 * u_8.y;
    float t1_0 = r_1 * cos(phi_2);

    float s_2 = 0.5 * (1.0 + _S1010);
    float _S1011 = 1.0 - t1_0 * t1_0;

#line 130
    float t2_0 = (1.0 - s_2) * sqrt(_S1011) + s_2 * (r_1 * sin(phi_2));


    float3 Nh_0 = t1_0 * T1_0 + t2_0 * cross(Vh_0, T1_0) + sqrt(max(0.0, _S1011 - t2_0 * t2_0)) * Vh_0;


    float3 h_7 = normalize(float3(alpha_9 * Nh_0.x, alpha_9 * Nh_0.y, max(0.0, Nh_0.z)));

    pdf_10 = evalPdfGGX_VNDF_0(alpha_9, wi_13, h_7);
    return h_7;
}


#line 85 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
bool SpecularMicrofacetBRDF_sample_0(SpecularMicrofacetBRDF_0 this_50, float3 wi_14, out float3 wo_14, out float pdf_11, out float3 weight_5, out uint lobeType_7, inout UniformSampleGenerator_0 sg_14)
{

    float3 _S1012 = float3(0.0, 0.0, 0.0);

#line 88
    wo_14 = _S1012;
    weight_5 = _S1012;
    pdf_11 = 0.0;
    lobeType_7 = 2U;

    float _S1013 = wi_14.z;

#line 93
    if(_S1013 < 0.00000099999999747524)
    {

#line 94
        return false;
    }


    if(this_50.alpha_2 == 0.0)
    {
        if(!SpecularMicrofacetBRDF_hasLobe_0(this_50, int(4)))
        {

#line 101
            return false;
        }
        wo_14 = float3(- wi_14.x, - wi_14.y, _S1013);
        pdf_11 = 0.0;
        weight_5 = evalFresnelSchlick_0(this_50.albedo_4, (float3)1.0, _S1013);
        lobeType_7 = 4U;
        return true;
    }


    if(!SpecularMicrofacetBRDF_hasLobe_0(this_50, int(2)))
    {

#line 112
        return false;
    }


    float2 _S1014 = sampleNext2D_0(sg_14);

#line 116
    float3 h_8 = sampleGGX_VNDF_0(this_50.alpha_2, wi_14, _S1014, pdf_11);

#line 122
    float wiDotH_2 = dot(wi_14, h_8);
    float3 _S1015 = 2.0 * wiDotH_2 * h_8 - wi_14;

#line 123
    wo_14 = _S1015;
    if(_S1015.z < 0.00000099999999747524)
    {

#line 125
        return false;
    }

#line 140
    float GOverG1wo_0 = evalMaskingSmithGGXCorrelated_0(this_50.alpha_2, _S1013, wo_14.z) * (1.0 + evalLambdaGGX_0(this_50.alpha_2 * this_50.alpha_2, _S1013));

    float3 F_2 = evalFresnelSchlick_0(this_50.albedo_4, (float3)1.0, wiDotH_2);

    pdf_11 = pdf_11 / (4.0 * wiDotH_2);

    weight_5 = F_2 * GOverG1wo_0;



    lobeType_7 = 2U;
    return true;
}


#line 68 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/FrostbiteDiffuseBRDF.slang"
float FrostbiteDiffuseBRDF_evalPdf_0(FrostbiteDiffuseBRDF_0 this_51, float3 wi_15, float3 wo_15)
{
    float _S1016 = wo_15.z;

#line 70
    if(min(wi_15.z, _S1016) < 0.00000099999999747524)
    {

#line 71
        return 0.0;
    }
    return 0.31830987334251403809 * _S1016;
}


#line 250 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/SpecularMicrofacet.slang"
bool SpecularMicrofacetBSDF_sample_0(SpecularMicrofacetBSDF_0 this_52, float3 wi_16, out float3 wo_16, out float pdf_12, out float3 weight_6, out uint lobeType_8, inout UniformSampleGenerator_0 sg_15)
{

    float3 _S1017 = float3(0.0, 0.0, 0.0);

#line 253
    wo_16 = _S1017;
    weight_6 = _S1017;
    pdf_12 = 0.0;
    lobeType_8 = 2U;

    float _S1018 = wi_16.z;

#line 258
    if(_S1018 < 0.00000099999999747524)
    {

#line 259
        return false;
    }

    float lobeSample_0 = sampleNext1D_0(sg_15);

#line 262
    bool isReflection_2;

#line 262
    float3 _S1019;

#line 262
    uint _S1020;

#line 262
    float _S1021;



    if(this_52.alpha_3 == 0.0)
    {
        bool hasReflection_1 = SpecularMicrofacetBSDF_hasLobe_0(this_52, int(4));
        bool hasTransmission_1 = SpecularMicrofacetBSDF_hasLobe_0(this_52, int(64));
        if(!(hasReflection_1 || hasTransmission_1))
        {

#line 271
            return false;
        }
        float cosThetaT_2;
        float F_3 = evalFresnelDielectric_0(this_52.eta_1, _S1018, cosThetaT_2);


        bool _S1022 = hasReflection_1 && hasTransmission_1;

#line 277
        if(_S1022)
        {

#line 277
            isReflection_2 = lobeSample_0 < F_3;

#line 277
        }
        else
        {

            if(hasTransmission_1 && F_3 == 1.0)
            {
                return false;
            }

#line 283
            isReflection_2 = hasReflection_1;

#line 283
        }


        pdf_12 = 0.0;
        if(isReflection_2)
        {

#line 287
            _S1019 = (float3)1.0;

#line 287
        }
        else
        {

#line 287
            _S1019 = this_52.transmissionAlbedo_0;

#line 287
        }

#line 287
        weight_6 = _S1019;
        if(!_S1022)
        {

#line 289
            if(isReflection_2)
            {

#line 289
                _S1021 = F_3;

#line 289
            }
            else
            {

#line 289
                _S1021 = 1.0 - F_3;

#line 289
            }

#line 289
            weight_6 = weight_6 * (float3)_S1021;

#line 288
        }
        else
        {

#line 288
        }

        if(isReflection_2)
        {

#line 290
            _S1019 = float3(- wi_16.x, - wi_16.y, _S1018);

#line 290
        }
        else
        {

#line 290
            _S1019 = float3(- wi_16.x * this_52.eta_1, - wi_16.y * this_52.eta_1, - cosThetaT_2);

#line 290
        }

#line 290
        wo_16 = _S1019;
        if(isReflection_2)
        {

#line 291
            _S1020 = 4U;

#line 291
        }
        else
        {

#line 291
            _S1020 = 64U;

#line 291
        }

#line 291
        lobeType_8 = _S1020;

        if(abs(wo_16.z) < 0.00000099999999747524 || wo_16.z > 0.0 != isReflection_2)
        {

#line 294
            return false;
        }
        return true;
    }


    bool hasReflection_2 = SpecularMicrofacetBSDF_hasLobe_0(this_52, int(2));
    bool hasTransmission_2 = SpecularMicrofacetBSDF_hasLobe_0(this_52, int(32));
    if(!(hasReflection_2 || hasTransmission_2))
    {

#line 303
        return false;
    }


    float2 _S1023 = sampleNext2D_0(sg_15);

#line 307
    float3 h_9 = sampleGGX_VNDF_0(this_52.alpha_3, wi_16, _S1023, pdf_12);

#line 313
    float wiDotH_3 = dot(wi_16, h_9);

    float cosThetaT_3;
    float F_4 = evalFresnelDielectric_0(this_52.eta_1, wiDotH_3, cosThetaT_3);


    bool _S1024 = hasReflection_2 && hasTransmission_2;

#line 319
    if(_S1024)
    {

#line 319
        isReflection_2 = lobeSample_0 < F_4;

#line 319
    }
    else
    {

        if(hasTransmission_2 && F_4 == 1.0)
        {
            return false;
        }

#line 325
        isReflection_2 = hasReflection_2;

#line 325
    }


    if(isReflection_2)
    {

#line 328
        _S1019 = 2.0 * wiDotH_3 * h_9 - wi_16;

#line 328
    }
    else
    {

#line 328
        _S1019 = (this_52.eta_1 * wiDotH_3 - cosThetaT_3) * h_9 - this_52.eta_1 * wi_16;

#line 328
    }

#line 328
    wo_16 = _S1019;

    float _S1025 = _S1019.z;

#line 330
    if(abs(_S1025) < 0.00000099999999747524 || _S1025 > 0.0 != isReflection_2)
    {

#line 331
        return false;
    }
    float woDotH_3 = dot(wo_16, h_9);

    if(isReflection_2)
    {

#line 335
        _S1020 = 2U;

#line 335
    }
    else
    {

#line 335
        _S1020 = 32U;

#line 335
    }

#line 335
    lobeType_8 = _S1020;

#line 353
    weight_6 = (float3)(evalMaskingSmithGGXCorrelated_0(this_52.alpha_3, _S1018, abs(wo_16.z)) * (1.0 + evalLambdaGGX_0(this_52.alpha_3 * this_52.alpha_3, _S1018)));

#line 358
    if(isReflection_2)
    {
        pdf_12 = pdf_12 / (4.0 * woDotH_3);

#line 358
    }
    else
    {



        float sqrtDenom_2 = woDotH_3 + this_52.eta_1 * wiDotH_3;
        float denom_1 = sqrtDenom_2 * sqrtDenom_2;
        if(denom_1 > 0.0)
        {

#line 366
            _S1021 = pdf_12 * abs(woDotH_3) / denom_1;

#line 366
        }
        else
        {

#line 366
            _S1021 = 340282346638528859811704183484516925440.0;

#line 366
        }

#line 366
        pdf_12 = _S1021;
        weight_6 = weight_6 * (this_52.transmissionAlbedo_0 * this_52.eta_1 * this_52.eta_1);

#line 358
    }

#line 370
    if(_S1024)
    {
        if(isReflection_2)
        {

#line 372
            _S1021 = F_4;

#line 372
        }
        else
        {

#line 372
            _S1021 = 1.0 - F_4;

#line 372
        }

#line 372
        pdf_12 = pdf_12 * _S1021;

#line 370
    }
    else
    {



        if(isReflection_2)
        {

#line 376
            _S1021 = F_4;

#line 376
        }
        else
        {

#line 376
            _S1021 = 1.0 - F_4;

#line 376
        }

#line 376
        weight_6 = weight_6 * _S1021;

#line 370
    }

#line 379
    return true;
}


#line 65 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/LambertDiffuseBTDF.slang"
float LambertDiffuseBTDF_evalPdf_0(LambertDiffuseBTDF_0 this_53, float3 wi_17, float3 wo_17)
{
    float _S1026 = wo_17.z;

#line 67
    if(min(wi_17.z, - _S1026) < 0.00000099999999747524)
    {

#line 68
        return 0.0;
    }
    return 0.31830987334251403809 * - _S1026;
}


#line 234 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/BSDFs/StandardBSDF.slang"
bool StandardBSDF_sample_0(StandardBSDF_0 this_54, float3 wi_18, out float3 wo_18, out float pdf_13, out float3 weight_7, out uint lobeType_9, inout UniformSampleGenerator_0 sg_16)
{

    float3 _S1027 = float3(0.0, 0.0, 0.0);

#line 237
    wo_18 = _S1027;
    weight_7 = _S1027;
    pdf_13 = 0.0;
    lobeType_9 = 1U;


    float uSelect_0 = sampleNext1D_0(sg_16);

#line 243
    bool valid_3;



    if(uSelect_0 < this_54.pDiffuseReflection_0)
    {
        bool _S1028 = FrostbiteDiffuseBRDF_sample_0(this_54.diffuseReflection_0, wi_18, wo_18, pdf_13, weight_7, lobeType_9, sg_16);

        weight_7 = weight_7 / this_54.pDiffuseReflection_0 * ((1.0 - this_54.specTrans_0) * (1.0 - this_54.diffTrans_0));
        pdf_13 = pdf_13 * this_54.pDiffuseReflection_0;

        if(this_54.pSpecularReflection_0 > 0.0)
        {

#line 255
            pdf_13 = pdf_13 + this_54.pSpecularReflection_0 * SpecularMicrofacetBRDF_evalPdf_0(this_54.specularReflection_0, wi_18, wo_18);

#line 254
        }
        else
        {

#line 254
        }

        if(this_54.pSpecularTransmission_0 > 0.0)
        {

#line 257
            pdf_13 = pdf_13 + this_54.pSpecularTransmission_0 * SpecularMicrofacetBSDF_evalPdf_0(this_54.specularTransmission_2, wi_18, wo_18);

#line 256
        }
        else
        {

#line 256
        }

#line 256
        valid_3 = _S1028;

#line 256
    }
    else
    {
        float _S1029 = this_54.pDiffuseReflection_0 + this_54.pDiffuseTransmission_0;

#line 259
        if(uSelect_0 < _S1029)
        {
            bool _S1030 = LambertDiffuseBTDF_sample_0(this_54.diffuseTransmission_2, wi_18, wo_18, pdf_13, weight_7, lobeType_9, sg_16);

            weight_7 = weight_7 / this_54.pDiffuseTransmission_0 * ((1.0 - this_54.specTrans_0) * this_54.diffTrans_0);
            pdf_13 = pdf_13 * this_54.pDiffuseTransmission_0;


            if(this_54.pSpecularTransmission_0 > 0.0)
            {

#line 268
                pdf_13 = pdf_13 + this_54.pSpecularTransmission_0 * SpecularMicrofacetBSDF_evalPdf_0(this_54.specularTransmission_2, wi_18, wo_18);

#line 267
            }
            else
            {

#line 267
            }

#line 267
            valid_3 = _S1030;

#line 267
        }
        else
        {
            if(uSelect_0 < _S1029 + this_54.pSpecularReflection_0)
            {
                bool _S1031 = SpecularMicrofacetBRDF_sample_0(this_54.specularReflection_0, wi_18, wo_18, pdf_13, weight_7, lobeType_9, sg_16);

                weight_7 = weight_7 / this_54.pSpecularReflection_0 * (1.0 - this_54.specTrans_0);
                pdf_13 = pdf_13 * this_54.pSpecularReflection_0;
                if(this_54.pDiffuseReflection_0 > 0.0)
                {

#line 277
                    pdf_13 = pdf_13 + this_54.pDiffuseReflection_0 * FrostbiteDiffuseBRDF_evalPdf_0(this_54.diffuseReflection_0, wi_18, wo_18);

#line 276
                }
                else
                {

#line 276
                }


                if(this_54.pSpecularTransmission_0 > 0.0)
                {

#line 280
                    pdf_13 = pdf_13 + this_54.pSpecularTransmission_0 * SpecularMicrofacetBSDF_evalPdf_0(this_54.specularTransmission_2, wi_18, wo_18);

#line 279
                }
                else
                {

#line 279
                }

#line 279
                valid_3 = _S1031;

#line 279
            }
            else
            {
                if(this_54.pSpecularTransmission_0 > 0.0)
                {
                    bool _S1032 = SpecularMicrofacetBSDF_sample_0(this_54.specularTransmission_2, wi_18, wo_18, pdf_13, weight_7, lobeType_9, sg_16);

                    weight_7 = weight_7 / this_54.pSpecularTransmission_0 * this_54.specTrans_0;
                    pdf_13 = pdf_13 * this_54.pSpecularTransmission_0;
                    if(this_54.pDiffuseReflection_0 > 0.0)
                    {

#line 289
                        pdf_13 = pdf_13 + this_54.pDiffuseReflection_0 * FrostbiteDiffuseBRDF_evalPdf_0(this_54.diffuseReflection_0, wi_18, wo_18);

#line 288
                    }
                    else
                    {

#line 288
                    }

                    if(this_54.pDiffuseTransmission_0 > 0.0)
                    {

#line 291
                        pdf_13 = pdf_13 + this_54.pDiffuseTransmission_0 * LambertDiffuseBTDF_evalPdf_0(this_54.diffuseTransmission_2, wi_18, wo_18);

#line 290
                    }
                    else
                    {

#line 290
                    }

                    if(this_54.pSpecularReflection_0 > 0.0)
                    {

#line 293
                        pdf_13 = pdf_13 + this_54.pSpecularReflection_0 * SpecularMicrofacetBRDF_evalPdf_0(this_54.specularReflection_0, wi_18, wo_18);

#line 292
                    }
                    else
                    {

#line 292
                    }

#line 292
                    valid_3 = _S1032;

#line 292
                }
                else
                {

#line 292
                    valid_3 = false;

#line 292
                }

#line 292
            }

#line 292
        }

#line 292
    }



    return valid_3;
}


#line 230 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
bool isValidHemisphereReflectionOrTransmission_0(ShadingData_0 sd_6, ShadingFrame_0 sf_4, float3 wiLocal_3, float3 woLocal_2, float3 wo_19, bool fullSphere_0)
{
    float _S1033 = wiLocal_3.z;

#line 232
    float _S1034 = woLocal_2.z;

#line 232
    bool isTransmission_0 = _S1033 * _S1034 < 0.0;

#line 232
    float cosThetaI_3;


    if(fullSphere_0)
    {

#line 235
        cosThetaI_3 = abs(_S1033);

#line 235
    }
    else
    {

#line 235
        cosThetaI_3 = _S1033;

#line 235
    }
    if(min(cosThetaI_3, abs(_S1034)) < 0.00000099999999747524)
    {

#line 236
        return false;
    }


    bool woTop_0 = dot(wo_19, sd_6.faceN_0) >= 0.0;

    if(isTransmission_0)
    {
        if(sd_6.frontFacing_0 == woTop_0)
        {

#line 244
            return false;
        }

#line 242
    }
    else
    {



        if(sd_6.frontFacing_0 != woTop_0)
        {

#line 248
            return false;
        }

#line 242
    }

#line 252
    if(!fullSphere_0)
    {


        if(sd_6.frontFacing_0 != dot(sf_4.N_2, sd_6.faceN_0) >= 0.0)
        {

#line 256
            return false;
        }

#line 252
    }
    else
    {

#line 252
    }

#line 260
    return true;
}


#line 87 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterialInstance.slang"
bool StandardMaterialInstance_sample_0(StandardMaterialInstance_0 this_55, ShadingData_0 sd_7, inout UniformSampleGenerator_0 sg_17, out BSDFSample_0 result_17, bool useImportanceSampling_1)
{
    float3 wiLocal_4 = ShadingFrame_toLocal_0(this_55.sf_2, sd_7.V_1);
    float3 woLocal_3 = float3(0.0, 0.0, 0.0);

    if(!useImportanceSampling_1)
    {
        bool _S1035 = StandardMaterialInstance_sampleReference_0(this_55, sd_7, wiLocal_4, woLocal_3, result_17.pdf_2, result_17.weight_0, result_17.lobeType_0, sg_17);

#line 94
        if(!_S1035)
        {

#line 95
            return false;
        }

#line 92
    }
    else
    {

#line 100
        bool _S1036 = StandardBSDF_sample_0(StandardBSDF_x24init_0(wiLocal_4, sd_7.mtl_0, this_55.data_7), wiLocal_4, woLocal_3, result_17.pdf_2, result_17.weight_0, result_17.lobeType_0, sg_17);

#line 100
        if(!_S1036)
        {

#line 101
            return false;
        }

#line 92
    }

#line 103
    float3 _S1037 = ShadingFrame_fromLocal_0(this_55.sf_2, woLocal_3);

#line 103
    result_17.wo_0 = _S1037;

    if(!isValidHemisphereReflectionOrTransmission_0(sd_7, this_55.sf_2, wiLocal_4, woLocal_3, _S1037, false))
    {

#line 105
        return false;
    }
    return true;
}


#line 107
bool _S1038(Tuple_0 _S1039, ShadingData_0 _S1040, inout UniformSampleGenerator_0 _S1041, out BSDFSample_0 _S1042, bool _S1043)
{

#line 107
    switch(_S1039.value1_0.x)
    {
    case 0U:
        {

#line 107
            bool _S1044 = PBRTDiffuseMaterialInstance_sample_0(unpackAnyValue128_2(_S1039.value2_0), _S1040, _S1041, _S1042, _S1043);

#line 107
            return _S1044;
        }
    default:
        {

#line 107
            bool _S1045 = StandardMaterialInstance_sample_0(unpackAnyValue128_3(_S1039.value2_0), _S1040, _S1041, _S1042, _S1043);

#line 107
            return _S1045;
        }
    }

#line 107
}


#line 686 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct DiffPair_DifferentiableSceneQuery_0
{
    DifferentiableSceneQuery_0 primal_0;
    s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};


#line 686
struct s_bwd_temporaryBsdfEval_Intermediates_0
{
    BSDFProperties_0 _S1046;
};


#line 686
struct s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0
{
    float boundaryTerm_0;
};


#line 377 "diff.meta.slang"
struct s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0
{
    DiffPair_float_0  _S1047[int(18)];
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1048[int(18)];
    DiffPair_float_0  _S1049[int(18)];
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1050[int(18)];
    DiffPair_float_0  _S1051[int(18)];
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1052[int(18)];
    float3  _S1053[int(18)];
    float3  _S1054[int(18)];
    int _S1055;
    int  _S1056[int(18)];
    float3  _S1057[int(3)];
    float3  _S1058[int(3)];
    float  _S1059[int(3)];
    float  _S1060[int(3)];
    int _S1061;
    float  _S1062[int(16)];
    int  _S1063[int(18)];
};


#line 377
struct DiffPair_array_float3_0
{
    float3  primal_0[int(3)];
    float3  differential_0[int(3)];
};


#line 377
struct s_bwd_s_fwd_computeWarpedRay_Intermediates_0
{
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1064;
    DiffPair_array_float3_0 _S1065;
    UniformSampleGenerator_0 _S1066;
    bool _S1067;
};


#line 377
struct s_bwd_reparameterizeRay_Intermediates_0
{
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1068;
    DiffPair_array_float3_0 _S1069;
    UniformSampleGenerator_0 _S1070;
    s_diff_s_diff_SceneDerivativeFlags_0 _S1071;
};


#line 105 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
struct PathData_0
{
    float3 radiance_1;
    float3 thp_1;
    uint length_0;
    bool terminated_0;
};


#line 105
struct s_bwd_generateScatterRay_Intermediates_0
{
    float3 _S1072;
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1073;
    DiffRay_0 _S1074;
    s_bwd_reparameterizeRay_Intermediates_0 _S1075;
    float _S1076;
    UniformSampleGenerator_0 _S1077;
    BSDFSample_0 _S1078;
    DiffRay_0 _S1079;
    PathData_0 _S1080;
    bool _S1081;
};


#line 105
struct s_bwd_computeNEE_Intermediates_0
{
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1082;
    DiffRay_0 _S1083;
    s_bwd_reparameterizeRay_Intermediates_0 _S1084;
    float _S1085;
    UniformSampleGenerator_0 _S1086;
    PathData_0 _S1087;
    float3 _S1088;
};


#line 105
struct s_bwd_handleHit_Intermediates_0
{
    bool _S1089;
    s_bwd_generateScatterRay_Intermediates_0 _S1090;
    PathData_0 _S1091;
    DiffRay_0 _S1092;
    UniformSampleGenerator_0 _S1093;
    s_bwd_computeNEE_Intermediates_0 _S1094;
    PathData_0 _S1095;
    UniformSampleGenerator_0 _S1096;
    bool _S1097;
    bool _S1098;
    LightSample_0 _S1099;
    BSDFProperties_0 _S1100;
    PathData_0 _S1101;
    DiffRay_0 _S1102;
    ShadingData_0 sd_8;
    Tuple_0 _S1103;
};


#line 377 "diff.meta.slang"
struct s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1
{
    DiffPair_float_0  _S1104[int(18)];
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1105[int(18)];
    DiffPair_float_0  _S1106[int(18)];
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1107[int(18)];
    float3  _S1108[int(18)];
    float3  _S1109[int(18)];
    int _S1110;
    int  _S1111[int(18)];
    float3  _S1112[int(2)];
    float3  _S1113[int(2)];
    float  _S1114[int(2)];
    float  _S1115[int(2)];
    int _S1116;
    float  _S1117[int(16)];
    int  _S1118[int(18)];
};


#line 377
struct DiffPair_array_float3_1
{
    float3  primal_0[int(2)];
    float3  differential_0[int(2)];
};


#line 377
struct s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0
{
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S1119;
    DiffPair_array_float3_1 _S1120;
    UniformSampleGenerator_0 _S1121;
    bool _S1122;
};


#line 377
struct DiffPair_array_float2_0
{
    float2  primal_0[int(2)];
    float2  differential_0[int(2)];
};


#line 377
struct s_bwd_reparameterizeScreenSample_Intermediates_0
{
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _S1123;
    DiffPair_array_float2_0 _S1124;
    UniformSampleGenerator_0 _S1125;
    s_diff_s_diff_SceneDerivativeFlags_0 _S1126;
};


#line 377
struct s_bwd_tracePath_Intermediates_0
{
    s_bwd_handleHit_Intermediates_0  _S1127[int(3)];
    DiffRay_0  _S1128[int(3)];
    PathData_0  _S1129[int(3)];
    UniformSampleGenerator_0  _S1130[int(3)];
    int _S1131;
    IntersectionInfo_0  _S1132[int(3)];
    bool  _S1133[int(3)];
    s_bwd_reparameterizeScreenSample_Intermediates_0 _S1134;
    float _S1135;
    UniformSampleGenerator_0 _S1136;
    PathData_0 _S1137;
    float2 _S1138;
    float _S1139;
};


#line 377
struct s_bwd_tracePaths_Intermediates_0
{
    s_bwd_tracePath_Intermediates_0 _S1140;
    UniformSampleGenerator_0 _S1141;
    float3 _S1142;
    TriangleHit_0 _S1143;
    UniformSampleGenerator_0 _S1144;
    float2 _S1145;
    bool _S1146;
};


#line 377
float3 s_bwd_primal_FalcorSceneIO_loadCameraPositionW_0(s_diff_s_diff_SceneDerivativeFlags_0 dpmode_0)
{

#line 377
    return Camera_getPosition_0(gScene_0.camera_0);
}


#line 377
float3 s_bwd_primal_DifferentiableSceneQuery_loadCameraPosition_0(DifferentiableSceneQuery_0 dpthis_0)
{

#line 377
    return s_bwd_primal_FalcorSceneIO_loadCameraPositionW_0(dpthis_0.gradientFlags_1);
}


#line 377
float2 s_bwd_primal_sampleGaussian_0(float2 dpxy_0, float dpsigma_0, float dpradius_0)
{

#line 377
    float _S1147 = 6.28318548202514648438 * dpxy_0.y;

#line 377
    return s_bwd_sqrt_0(-2.0 * s_bwd_log_0(dpxy_0.x)) * float2(s_bwd_cos_0(_S1147), s_bwd_sin_0(_S1147)) * dpsigma_0;
}


#line 377
float s_bwd_length_0(float3 _S1148)
{

#line 377
    return length(_S1148);
}


#line 377
float3 s_bwd_primal_safeNormalize_0(float3 dpv_0)
{

#line 377
    float _S1149 = s_bwd_length_0(dpv_0);

#line 377
    float3 _S1150;

#line 377
    if(_S1149 > 0.0)
    {

#line 377
        _S1150 = dpv_0 / _S1149;

#line 377
    }
    else
    {

#line 377
        _S1150 = (float3)0.0;

#line 377
    }

#line 377
    return _S1150;
}


#line 377
float3 s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(DifferentiableSceneQuery_0 dpthis_1, float2 dpposS_0, float2 dpframeDim_0)
{

#line 377
    float2 ndc_0 = float2(2.0, -2.0) * ((dpposS_0 + float2(0.5, 0.5)) / dpframeDim_0) + float2(-1.0, 1.0);

#line 377
    return s_bwd_primal_safeNormalize_0(ndc_0.x * gScene_0.camera_0.data_1.cameraU_0 + ndc_0.y * gScene_0.camera_0.data_1.cameraV_0 + gScene_0.camera_0.data_1.cameraW_0);
}


#line 377
DiffRay_0 s_bwd_primal_DiffRay_x24init_0(float3 dporigin_0, float3 dpdirection_0, uint2 pixel_4)
{

#line 29 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffRay_0 _S1151 = { dporigin_0, dpdirection_0, pixel_4 };

#line 29
    return _S1151;
}


#line 29
IntersectionInfo_0 s_bwd_primal_IntersectionInfo_x24init_0()
{

#line 29
    float3 _S1152 = (float3)0.0;

#line 29
    IntersectionInfo_0 _S1153 = { 0U, GeometryInstanceID_x24init_0(0U, 0U), _S1152, _S1152, _S1152, 0.0 };

#line 29
    return _S1153;
}


#line 94 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
void s_bwd_FalcorSceneIO_loadVertexNormalsW_0(s_diff_s_diff_SceneDerivativeFlags_0 _S1154, GeometryInstanceID_0 _S1155, uint _S1156, out float3 _S1157, out float3 _S1158, out float3 _S1159)
{

#line 94
    FalcorSceneIO_loadVertexNormalsW_0(_S1154, _S1155, _S1156, _S1157, _S1158, _S1159);

#line 94
    return;
}


#line 94
float3 s_bwd_primal_DifferentiableSceneQuery_computeShadingNormal_0(DifferentiableSceneQuery_0 dpthis_2, GeometryInstanceID_0 instanceID_10, uint primitiveIndex_3, float3 dpbarycentrics_0)
{

#line 241 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S1160 = (float3)0.0;

#line 241
    float3 _S1161 = _S1160;

#line 241
    float3 _S1162 = _S1160;

#line 241
    float3 _S1163 = _S1160;

#line 241
    s_bwd_FalcorSceneIO_loadVertexNormalsW_0(dpthis_2.gradientFlags_1, instanceID_10, primitiveIndex_3, _S1161, _S1162, _S1163);

#line 241
    return _S1161 * dpbarycentrics_0.x + _S1162 * dpbarycentrics_0.y + _S1163 * dpbarycentrics_0.z;
}


#line 470 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
PathData_0 s_bwd_primal_PathData_x24init_0()
{

#line 470
    PathData_0 _S1164 = { (float3)0.0, (float3)1.0, 0U, false };

#line 470
    return _S1164;
}


#line 368 "diff.meta.slang"
s_diff_s_diff_SceneDerivativeFlags_0 s_bwd_SceneDerivativeFlags_make_0(int _S1165)
{

#line 368
    return SceneDerivativeFlags_make_0(_S1165);
}


#line 382 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
DiffPair_float_0 s_bwd_primal_d_sqrt_0(DiffPair_float_0 dpdpx_0)
{

#line 382
    DiffPair_float_0 _S1166 = { s_bwd_sqrt_0(dpdpx_0.primal_0), 0.5 / s_bwd_sqrt_0(s_bwd_max_0(0.00000010000000116861, dpdpx_0.primal_0)) * dpdpx_0.differential_0 };

#line 382
    return _S1166;
}


#line 382
DiffPair_float_0 s_bwd_primal_s_fwd_length_impl_0(DiffPair_float3_0 dpdpx_1)
{

#line 382
    float _S1167 = dpdpx_1.primal_0[int(0)];

#line 382
    float _S1168 = dpdpx_1.differential_0[int(0)] * dpdpx_1.primal_0[int(0)];

#line 382
    float _S1169 = dpdpx_1.primal_0[int(1)];

#line 382
    float _S1170 = dpdpx_1.differential_0[int(1)] * dpdpx_1.primal_0[int(1)];

#line 382
    float _S1171 = dpdpx_1.primal_0[int(2)];

#line 382
    float _S1172 = dpdpx_1.differential_0[int(2)] * dpdpx_1.primal_0[int(2)];

#line 382
    DiffPair_float_0 _S1173 = { _S1167 * _S1167 + _S1169 * _S1169 + _S1171 * _S1171, _S1168 + _S1168 + (_S1170 + _S1170) + (_S1172 + _S1172) };

#line 382
    DiffPair_float_0 _S1174 = s_bwd_primal_d_sqrt_0(_S1173);

#line 382
    DiffPair_float_0 _S1175 = { _S1174.primal_0, _S1174.differential_0 };

#line 382
    return _S1175;
}


#line 382
DiffPair_float3_0 s_bwd_primal_s_fwd_safeNormalize_0(DiffPair_float3_0 dpdpv_0)
{

#line 382
    DiffPair_float3_0 _S1176 = { dpdpv_0.primal_0, dpdpv_0.differential_0 };

#line 382
    DiffPair_float_0 _S1177 = s_bwd_primal_s_fwd_length_impl_0(_S1176);

#line 382
    float3 _S1178;

#line 382
    float3 _S1179;

#line 382
    if(_S1177.primal_0 > 0.0)
    {

#line 382
        float3 _S1180 = (dpdpv_0.differential_0 * _S1177.primal_0 - dpdpv_0.primal_0 * _S1177.differential_0) / (_S1177.primal_0 * _S1177.primal_0);

#line 382
        _S1178 = dpdpv_0.primal_0 / _S1177.primal_0;

#line 382
        _S1179 = _S1180;

#line 382
    }
    else
    {

#line 382
        float3 _S1181 = (float3)0.0;

#line 382
        _S1178 = (float3)0.0;

#line 382
        _S1179 = _S1181;

#line 382
    }

#line 382
    DiffPair_float3_0 _S1182 = { _S1178, _S1179 };

#line 382
    return _S1182;
}


#line 382
DiffPair_float3_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_0, DiffPair_float2_0 dpdpposS_0, DiffPair_float2_0 dpdpframeDim_0)
{

#line 382
    float2 _S1183 = dpdpposS_0.primal_0 + float2(0.5, 0.5);

#line 382
    float2 _S1184 = float2(2.0, -2.0);

#line 382
    float2 _S1185 = (dpdpposS_0.differential_0 * dpdpframeDim_0.primal_0 - _S1183 * dpdpframeDim_0.differential_0) / (dpdpframeDim_0.primal_0 * dpdpframeDim_0.primal_0) * _S1184;

#line 382
    float2 ndc_1 = _S1184 * (_S1183 / dpdpframeDim_0.primal_0) + float2(-1.0, 1.0);

#line 382
    DiffPair_float3_0 _S1186 = { ndc_1.x * gScene_0.camera_0.data_1.cameraU_0 + ndc_1.y * gScene_0.camera_0.data_1.cameraV_0 + gScene_0.camera_0.data_1.cameraW_0, _S1185.x * gScene_0.camera_0.data_1.cameraU_0 + _S1185.y * gScene_0.camera_0.data_1.cameraV_0 };

#line 382
    DiffPair_float3_0 _S1187 = s_bwd_primal_s_fwd_safeNormalize_0(_S1186);

#line 382
    DiffPair_float3_0 _S1188 = { _S1187.primal_0, _S1187.differential_0 };

#line 382
    return _S1188;
}


#line 382
DiffPair_float3_0 s_bwd_primal_s_fwd_FalcorSceneIO_loadCameraPositionW_0(DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 dpdpmode_0)
{

#line 382
    DiffPair_float3_0 _S1189 = { Camera_getPosition_0(gScene_0.camera_0), (float3)0.0 };

#line 382
    return _S1189;
}


#line 382
DiffPair_float3_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadCameraPosition_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_1)
{

#line 382
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S1190 = { dpdpthis_1.primal_0.gradientFlags_1, dpdpthis_1.differential_0.gradientFlags_0 };

#line 382
    DiffPair_float3_0 _S1191 = s_bwd_primal_s_fwd_FalcorSceneIO_loadCameraPositionW_0(_S1190);

#line 382
    DiffPair_float3_0 _S1192 = { _S1191.primal_0, _S1191.differential_0 };

#line 382
    return _S1192;
}


#line 670 "diff.meta.slang"
DiffPair_float_0 s_bwd_primal_d_max_0(DiffPair_float_0 dpdpx_2, DiffPair_float_0 dpdpy_0)
{

#line 670
    float _S1193 = s_bwd_max_0(dpdpx_2.primal_0, dpdpy_0.primal_0);

#line 670
    float _S1194;

#line 670
    if(dpdpx_2.primal_0 > dpdpy_0.primal_0)
    {

#line 670
        _S1194 = dpdpx_2.differential_0;

#line 670
    }
    else
    {

#line 670
        _S1194 = dpdpy_0.differential_0;

#line 670
    }

#line 670
    DiffPair_float_0 _S1195 = { _S1193, _S1194 };

#line 670
    return _S1195;
}


#line 670
struct DiffPair_DiffRay_0
{
    DiffRay_0 primal_0;
    s_diff_s_diff_DiffRay_0 differential_0;
};


#line 670
DiffPair_DiffRay_0 s_bwd_primal_s_fwd_DiffRay_x24init_0(DiffPair_float3_0 dpdporigin_0, DiffPair_float3_0 dpdpdirection_0, uint2 pixel_5)
{

#line 29 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffRay_0 _S1196 = { dpdporigin_0.primal_0, dpdpdirection_0.primal_0, pixel_5 };

#line 29
    s_diff_s_diff_DiffRay_0 _S1197 = { dpdporigin_0.differential_0, dpdpdirection_0.differential_0 };

#line 29
    DiffPair_DiffRay_0 _S1198 = { _S1196, _S1197 };

#line 29
    return _S1198;
}


#line 29
struct DiffPair_IntersectionInfo_0
{
    IntersectionInfo_0 primal_0;
    s_diff_s_diff_IntersectionInfo_0 differential_0;
};


#line 29
struct s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0
{
    HitInfo_0 _S1199;
    bool isHit_0;
};


#line 29
DiffPair_IntersectionInfo_0 s_bwd_primal_s_fwd_IntersectionInfo_x24init_0()
{

#line 29
    float3 _S1200 = (float3)0.0;

#line 29
    float3 _S1201 = (float3)0.0;

#line 29
    IntersectionInfo_0 _S1202 = { 0U, GeometryInstanceID_x24init_0(0U, 0U), _S1200, _S1200, _S1200, 0.0 };

#line 29
    s_diff_s_diff_IntersectionInfo_0 _S1203 = { _S1201, _S1201, _S1201, 0.0 };

#line 29
    DiffPair_IntersectionInfo_0 _S1204 = { _S1202, _S1203 };

#line 29
    return _S1204;
}


#line 29
struct s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0
{
    float3 _S1205;
    TriangleHit_0 hit_8;
};


#line 19 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
void s_bwd_FalcorSceneIO_loadVertexPositionsW_0(s_diff_s_diff_SceneDerivativeFlags_0 _S1206, GeometryInstanceID_0 _S1207, uint _S1208, out float3 _S1209, out float3 _S1210, out float3 _S1211, uint2 _S1212)
{

#line 19
    FalcorSceneIO_loadVertexPositionsW_0(_S1206, _S1207, _S1208, _S1209, _S1210, _S1211, _S1212);

#line 19
    return;
}


#line 19
void s_bwd_primal_FalcorSceneIO_fwd_loadVertexPositionsW_0(DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 dpflags_0, GeometryInstanceID_0 instanceID_11, uint triangleID_5, out DiffPair_float3_0 dpv0_0, out DiffPair_float3_0 dpv1_0, out DiffPair_float3_0 dpv2_0, uint2 pixel_6)
{

#line 106
    float3 _S1213 = (float3)0.0;

#line 106
    float3 _S1214 = _S1213;

#line 106
    float3 _S1215 = _S1213;

#line 106
    float3 _S1216 = _S1213;

#line 106
    s_bwd_FalcorSceneIO_loadVertexPositionsW_0(dpflags_0.primal_0, instanceID_11, triangleID_5, _S1214, _S1215, _S1216, pixel_6);

#line 106
    float3 _S1217 = _S1214;

#line 106
    float3 _S1218 = _S1215;

#line 106
    float3 _S1219 = _S1216;

#line 106
    DiffPair_float3_0 _S1220;

#line 106
    DiffPair_float3_0 _S1221;

#line 106
    DiffPair_float3_0 _S1222;

#line 106
    if(dpflags_0.differential_0.gradientMode_0 != int(2))
    {

#line 106
        float3 _S1223 = (float3)0.0;

#line 106
        _S1220.primal_0 = _S1217;

#line 106
        _S1220.differential_0 = _S1223;

#line 106
        _S1221.primal_0 = _S1218;

#line 106
        _S1221.differential_0 = _S1223;

#line 106
        _S1222.primal_0 = _S1219;

#line 106
        _S1222.differential_0 = _S1223;

#line 106
    }
    else
    {

#line 106
        float3 posDeriv_0 = float3(0.0, 1.0, 0.0);

#line 106
        bool _S1224 = instanceID_11.index_0 == 5U;

#line 106
        float3 _S1225;

#line 106
        if(_S1224)
        {

#line 106
            _S1225 = posDeriv_0;

#line 106
        }
        else
        {

#line 106
            _S1225 = (float3)0.0;

#line 106
        }

#line 106
        float3 _S1226 = _S1225;

#line 106
        if(_S1224)
        {

#line 106
            _S1225 = posDeriv_0;

#line 106
        }
        else
        {

#line 106
            _S1225 = (float3)0.0;

#line 106
        }

#line 106
        float3 _S1227 = _S1225;

#line 106
        if(_S1224)
        {

#line 106
            _S1225 = posDeriv_0;

#line 106
        }
        else
        {

#line 106
            _S1225 = (float3)0.0;

#line 106
        }

#line 106
        _S1220.primal_0 = _S1217;

#line 106
        _S1220.differential_0 = _S1226;

#line 106
        _S1221.primal_0 = _S1218;

#line 106
        _S1221.differential_0 = _S1227;

#line 106
        _S1222.primal_0 = _S1219;

#line 106
        _S1222.differential_0 = _S1225;

#line 106
    }

#line 106
    dpv0_0 = _S1220;

#line 106
    dpv1_0 = _S1221;

#line 106
    dpv2_0 = _S1222;

#line 106
    return;
}


#line 106
DiffPair_float3_0 s_bwd_primal_d_cross_0(DiffPair_float3_0 dpa_0, DiffPair_float3_0 dpb_0)
{

#line 106
    float _S1228 = dpa_0.primal_0.y;

#line 106
    float _S1229 = dpb_0.primal_0.z;

#line 106
    float aybz_0 = _S1228 * _S1229;

#line 106
    float _S1230 = dpa_0.primal_0.z;

#line 106
    float _S1231 = dpb_0.primal_0.y;

#line 106
    float azby_0 = _S1230 * _S1231;

#line 106
    float _S1232 = dpa_0.differential_0.y;

#line 106
    float _S1233 = dpb_0.differential_0.z;

#line 106
    float _S1234 = dpa_0.differential_0.z;

#line 106
    float _S1235 = dpb_0.differential_0.y;

#line 106
    float _S1236 = dpb_0.primal_0.x;

#line 106
    float azbx_0 = _S1230 * _S1236;

#line 106
    float _S1237 = dpa_0.primal_0.x;

#line 106
    float axbz_0 = _S1237 * _S1229;

#line 106
    float _S1238 = dpb_0.differential_0.x;

#line 106
    float _S1239 = dpa_0.differential_0.x;

#line 106
    float axby_0 = _S1237 * _S1231;

#line 106
    float aybx_0 = _S1228 * _S1236;

#line 106
    DiffPair_float3_0 _S1240 = { float3(aybz_0 - azby_0, azbx_0 - axbz_0, axby_0 - aybx_0), float3((_S1229 - azby_0) * _S1232 + (_S1228 - azby_0) * _S1233 + (aybz_0 - _S1231) * _S1234 + (aybz_0 - _S1230) * _S1235, (_S1236 - axbz_0) * _S1234 + (_S1230 - axbz_0) * _S1238 + (azbx_0 - _S1229) * _S1239 + (azbx_0 - _S1237) * _S1233, (_S1231 - aybx_0) * _S1239 + (_S1237 - aybx_0) * _S1235 + (axby_0 - _S1236) * _S1232 + (axby_0 - _S1228) * _S1238) };

#line 106
    return _S1240;
}


#line 106
DiffPair_float3_0 s_bwd_primal_s_fwd_normalize_impl_0(DiffPair_float3_0 dpdpx_3)
{

#line 106
    DiffPair_float3_0 _S1241 = { dpdpx_3.primal_0, dpdpx_3.differential_0 };

#line 106
    DiffPair_float_0 _S1242 = s_bwd_primal_s_fwd_length_impl_0(_S1241);

#line 106
    float _S1243 = 1.0 / _S1242.primal_0;

#line 106
    DiffPair_float3_0 _S1244 = { dpdpx_3.primal_0 * _S1243, dpdpx_3.differential_0 * _S1243 + (0.0 - _S1242.differential_0) / (_S1242.primal_0 * _S1242.primal_0) * dpdpx_3.primal_0 };

#line 106
    return _S1244;
}


#line 106
DiffPair_float3_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_2, GeometryInstanceID_0 instanceID_12, uint triangleID_6, float3 barycentrics_6, out DiffPair_float3_0 dpdpfaceNormalW_0, uint2 pixel_7)
{

#line 254 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S1245 = { dpdpthis_2.primal_0.gradientFlags_1, dpdpthis_2.differential_0.gradientFlags_0 };

#line 254
    float3 _S1246 = (float3)0.0;

#line 254
    DiffPair_float3_0 _S1247;

#line 254
    _S1247.primal_0 = _S1246;

#line 254
    _S1247.differential_0 = _S1246;

#line 254
    DiffPair_float3_0 _S1248;

#line 254
    _S1248.primal_0 = _S1246;

#line 254
    _S1248.differential_0 = _S1246;

#line 254
    DiffPair_float3_0 _S1249;

#line 254
    _S1249.primal_0 = _S1246;

#line 254
    _S1249.differential_0 = _S1246;

#line 254
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S1245, instanceID_12, triangleID_6, _S1247, _S1248, _S1249, pixel_7);

#line 254
    float _S1250 = barycentrics_6.x;

#line 254
    float _S1251 = barycentrics_6.y;

#line 254
    float _S1252 = barycentrics_6.z;

#line 254
    DiffPair_float3_0 _S1253 = { _S1248.primal_0 - _S1247.primal_0, _S1248.differential_0 - _S1247.differential_0 };

#line 254
    DiffPair_float3_0 _S1254 = { _S1249.primal_0 - _S1247.primal_0, _S1249.differential_0 - _S1247.differential_0 };

#line 254
    DiffPair_float3_0 _S1255 = s_bwd_primal_d_cross_0(_S1253, _S1254);

#line 254
    DiffPair_float3_0 _S1256 = { _S1255.primal_0, _S1255.differential_0 };

#line 254
    DiffPair_float3_0 _S1257 = s_bwd_primal_s_fwd_normalize_impl_0(_S1256);

#line 254
    DiffPair_float3_0 _S1258 = { _S1247.primal_0 * _S1250 + _S1248.primal_0 * _S1251 + _S1249.primal_0 * _S1252, _S1247.differential_0 * _S1250 + _S1248.differential_0 * _S1251 + _S1249.differential_0 * _S1252 };

#line 254
    dpdpfaceNormalW_0.primal_0 = _S1257.primal_0;

#line 254
    dpdpfaceNormalW_0.differential_0 = _S1257.differential_0;

#line 254
    return _S1258;
}


#line 254
DiffPair_float_0 s_bwd_primal_d_dot_0(DiffPair_float3_0 dpdpx_4, DiffPair_float3_0 dpdpy_1)
{

#line 254
    DiffPair_float_0 _S1259 = { dpdpx_4.primal_0[int(0)] * dpdpy_1.primal_0[int(0)] + dpdpx_4.primal_0[int(1)] * dpdpy_1.primal_0[int(1)] + dpdpx_4.primal_0[int(2)] * dpdpy_1.primal_0[int(2)], dpdpx_4.primal_0[int(0)] * dpdpy_1.differential_0[int(0)] + dpdpy_1.primal_0[int(0)] * dpdpx_4.differential_0[int(0)] + dpdpx_4.primal_0[int(1)] * dpdpy_1.differential_0[int(1)] + dpdpy_1.primal_0[int(1)] * dpdpx_4.differential_0[int(1)] + dpdpx_4.primal_0[int(2)] * dpdpy_1.differential_0[int(2)] + dpdpy_1.primal_0[int(2)] * dpdpx_4.differential_0[int(2)] };

#line 254
    return _S1259;
}


#line 254
DiffPair_float_0 s_bwd_primal_s_fwd_computeDistanceToTriangle_0(DiffPair_float3_0 dpdpv0_0, DiffPair_float3_0 dpdpv1_0, DiffPair_float3_0 dpdpv2_0, DiffPair_float3_0 dpdporigin_1, DiffPair_float3_0 dpdpdirection_1)
{

#line 254
    DiffPair_float3_0 _S1260 = { dpdpdirection_1.primal_0, dpdpdirection_1.differential_0 };

#line 254
    DiffPair_float3_0 _S1261 = { dpdpv2_0.primal_0 - dpdpv0_0.primal_0, dpdpv2_0.differential_0 - dpdpv0_0.differential_0 };

#line 254
    DiffPair_float3_0 _S1262 = s_bwd_primal_d_cross_0(_S1260, _S1261);

#line 254
    DiffPair_float3_0 _S1263 = { dpdpv1_0.primal_0 - dpdpv0_0.primal_0, dpdpv1_0.differential_0 - dpdpv0_0.differential_0 };

#line 254
    DiffPair_float3_0 _S1264 = { _S1262.primal_0, _S1262.differential_0 };

#line 254
    DiffPair_float_0 _S1265 = s_bwd_primal_d_dot_0(_S1263, _S1264);

#line 254
    DiffPair_float3_0 _S1266 = { dpdporigin_1.primal_0 - dpdpv0_0.primal_0, dpdporigin_1.differential_0 - dpdpv0_0.differential_0 };

#line 254
    DiffPair_float3_0 _S1267 = s_bwd_primal_d_cross_0(_S1266, _S1263);

#line 254
    DiffPair_float3_0 _S1268 = { _S1267.primal_0, _S1267.differential_0 };

#line 254
    DiffPair_float_0 _S1269 = s_bwd_primal_d_dot_0(_S1261, _S1268);

#line 254
    DiffPair_float_0 _S1270 = { _S1269.primal_0 / _S1265.primal_0, (_S1269.differential_0 * _S1265.primal_0 - _S1269.primal_0 * _S1265.differential_0) / (_S1265.primal_0 * _S1265.primal_0) };

#line 254
    return _S1270;
}


#line 254
void s_bwd_primal_s_fwd_computeBarycentrics_0(DiffPair_float3_0 dpdpv0_1, DiffPair_float3_0 dpdpv1_1, DiffPair_float3_0 dpdpv2_1, DiffPair_float3_0 dpdporigin_2, DiffPair_float3_0 dpdpdirection_2, DiffPair_float_0 dpdpt_0, out DiffPair_float3_0 dpdpbarycentrics_0)
{

#line 254
    float3 p_4 = dpdporigin_2.primal_0 + dpdpdirection_2.primal_0 * dpdpt_0.primal_0;

#line 254
    float3 s_diff_p_0 = dpdporigin_2.differential_0 + (dpdpdirection_2.differential_0 * dpdpt_0.primal_0 + dpdpt_0.differential_0 * dpdpdirection_2.primal_0);

#line 254
    DiffPair_float3_0 _S1271 = { dpdpv1_1.primal_0 - p_4, dpdpv1_1.differential_0 - s_diff_p_0 };

#line 254
    DiffPair_float3_0 _S1272 = { dpdpv2_1.primal_0 - p_4, dpdpv2_1.differential_0 - s_diff_p_0 };

#line 254
    DiffPair_float3_0 _S1273 = s_bwd_primal_d_cross_0(_S1271, _S1272);

#line 254
    DiffPair_float3_0 _S1274 = { _S1273.primal_0, _S1273.differential_0 };

#line 254
    DiffPair_float_0 _S1275 = s_bwd_primal_s_fwd_length_impl_0(_S1274);

#line 254
    DiffPair_float3_0 _S1276 = { dpdpv0_1.primal_0 - p_4, dpdpv0_1.differential_0 - s_diff_p_0 };

#line 254
    DiffPair_float3_0 _S1277 = s_bwd_primal_d_cross_0(_S1272, _S1276);

#line 254
    DiffPair_float3_0 _S1278 = { _S1277.primal_0, _S1277.differential_0 };

#line 254
    DiffPair_float_0 _S1279 = s_bwd_primal_s_fwd_length_impl_0(_S1278);

#line 254
    DiffPair_float3_0 _S1280 = s_bwd_primal_d_cross_0(_S1276, _S1271);

#line 254
    DiffPair_float3_0 _S1281 = { _S1280.primal_0, _S1280.differential_0 };

#line 254
    DiffPair_float_0 _S1282 = s_bwd_primal_s_fwd_length_impl_0(_S1281);

#line 254
    float area_2 = _S1275.primal_0 + _S1279.primal_0 + _S1282.primal_0;

#line 254
    float s_diff_area_0 = _S1275.differential_0 + _S1279.differential_0 + _S1282.differential_0;

#line 254
    float _S1283 = area_2 * area_2;

#line 254
    float3 _S1284 = float3((_S1275.differential_0 * area_2 - _S1275.primal_0 * s_diff_area_0) / _S1283, (_S1279.differential_0 * area_2 - _S1279.primal_0 * s_diff_area_0) / _S1283, (_S1282.differential_0 * area_2 - _S1282.primal_0 * s_diff_area_0) / _S1283);

#line 254
    dpdpbarycentrics_0.primal_0 = float3(_S1275.primal_0 / area_2, _S1279.primal_0 / area_2, _S1282.primal_0 / area_2);

#line 254
    dpdpbarycentrics_0.differential_0 = _S1284;

#line 254
    return;
}


#line 254
DiffPair_float3_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_1(DiffPair_DifferentiableSceneQuery_0 dpdpthis_3, GeometryInstanceID_0 instanceID_13, uint triangleID_7, DiffPair_DiffRay_0 dpdpray_0, out DiffPair_float_0 dpdpt_1, out DiffPair_float3_0 dpdpbarycentrics_1, out DiffPair_float3_0 dpdpfaceNormalW_1)
{

#line 269
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S1285 = { dpdpthis_3.primal_0.gradientFlags_1, dpdpthis_3.differential_0.gradientFlags_0 };

#line 269
    float3 _S1286 = (float3)0.0;

#line 269
    DiffPair_float3_0 _S1287;

#line 269
    _S1287.primal_0 = _S1286;

#line 269
    _S1287.differential_0 = _S1286;

#line 269
    DiffPair_float3_0 _S1288;

#line 269
    _S1288.primal_0 = _S1286;

#line 269
    _S1288.differential_0 = _S1286;

#line 269
    DiffPair_float3_0 _S1289;

#line 269
    _S1289.primal_0 = _S1286;

#line 269
    _S1289.differential_0 = _S1286;

#line 269
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S1285, instanceID_13, triangleID_7, _S1287, _S1288, _S1289, dpdpray_0.primal_0.pixel_1);

#line 269
    DiffPair_float3_0 _S1290 = { _S1287.primal_0, _S1287.differential_0 };

#line 269
    DiffPair_float3_0 _S1291 = { _S1288.primal_0, _S1288.differential_0 };

#line 269
    DiffPair_float3_0 _S1292 = { _S1289.primal_0, _S1289.differential_0 };

#line 269
    DiffPair_float3_0 _S1293 = { dpdpray_0.primal_0.origin_2, dpdpray_0.differential_0.origin_0 };

#line 269
    DiffPair_float3_0 _S1294 = { dpdpray_0.primal_0.direction_1, dpdpray_0.differential_0.direction_0 };

#line 269
    DiffPair_float_0 _S1295 = s_bwd_primal_s_fwd_computeDistanceToTriangle_0(_S1290, _S1291, _S1292, _S1293, _S1294);

#line 269
    DiffPair_float_0 _S1296 = { _S1295.primal_0, _S1295.differential_0 };

#line 269
    DiffPair_float3_0 _S1297;

#line 269
    _S1297.primal_0 = _S1286;

#line 269
    _S1297.differential_0 = _S1286;

#line 269
    s_bwd_primal_s_fwd_computeBarycentrics_0(_S1290, _S1291, _S1292, _S1293, _S1294, _S1296, _S1297);

#line 269
    float _S1298 = _S1297.primal_0.x;

#line 269
    float _S1299 = _S1297.primal_0.y;

#line 269
    float _S1300 = _S1297.primal_0.z;

#line 269
    DiffPair_float3_0 _S1301 = { _S1288.primal_0 - _S1287.primal_0, _S1288.differential_0 - _S1287.differential_0 };

#line 269
    DiffPair_float3_0 _S1302 = { _S1289.primal_0 - _S1287.primal_0, _S1289.differential_0 - _S1287.differential_0 };

#line 269
    DiffPair_float3_0 _S1303 = s_bwd_primal_d_cross_0(_S1301, _S1302);

#line 269
    DiffPair_float3_0 _S1304 = { _S1303.primal_0, _S1303.differential_0 };

#line 269
    DiffPair_float3_0 _S1305 = s_bwd_primal_s_fwd_normalize_impl_0(_S1304);

#line 269
    DiffPair_float3_0 _S1306 = { _S1287.primal_0 * _S1298 + _S1288.primal_0 * _S1299 + _S1289.primal_0 * _S1300, _S1287.differential_0 * _S1298 + _S1297.differential_0.x * _S1287.primal_0 + (_S1288.differential_0 * _S1299 + _S1297.differential_0.y * _S1288.primal_0) + (_S1289.differential_0 * _S1300 + _S1297.differential_0.z * _S1289.primal_0) };

#line 269
    dpdpt_1.primal_0 = _S1295.primal_0;

#line 269
    dpdpt_1.differential_0 = _S1295.differential_0;

#line 269
    dpdpbarycentrics_1.primal_0 = _S1297.primal_0;

#line 269
    dpdpbarycentrics_1.differential_0 = _S1297.differential_0;

#line 269
    dpdpfaceNormalW_1.primal_0 = _S1305.primal_0;

#line 269
    dpdpfaceNormalW_1.differential_0 = _S1305.differential_0;

#line 269
    return _S1306;
}


#line 269
void s_bwd_primal_FalcorSceneIO_fwd_loadVertexNormalsW_0(DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 dpflags_1, GeometryInstanceID_0 instanceID_14, uint triangleID_8, out DiffPair_float3_0 dpn0_0, out DiffPair_float3_0 dpn1_0, out DiffPair_float3_0 dpn2_0)
{

#line 38 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
    float3 _S1307 = (float3)0.0;

#line 38
    float3 _S1308 = _S1307;

#line 38
    float3 _S1309 = _S1307;

#line 38
    float3 _S1310 = _S1307;

#line 38
    s_bwd_FalcorSceneIO_loadVertexNormalsW_0(dpflags_1.primal_0, instanceID_14, triangleID_8, _S1308, _S1309, _S1310);

#line 38
    float3 _S1311 = _S1308;

#line 38
    float3 _S1312 = _S1309;

#line 38
    float3 _S1313 = _S1310;

#line 38
    DiffPair_float3_0 _S1314;

#line 38
    DiffPair_float3_0 _S1315;

#line 38
    DiffPair_float3_0 _S1316;

#line 38
    if(dpflags_1.differential_0.gradientMode_0 != int(2))
    {

#line 38
        float3 _S1317 = (float3)0.0;

#line 38
        _S1314.primal_0 = _S1311;

#line 38
        _S1314.differential_0 = _S1317;

#line 38
        _S1315.primal_0 = _S1312;

#line 38
        _S1315.differential_0 = _S1317;

#line 38
        _S1316.primal_0 = _S1313;

#line 38
        _S1316.differential_0 = _S1317;

#line 38
    }
    else
    {

#line 38
        float3 _S1318 = (float3)0.0;

#line 38
        _S1314.primal_0 = _S1311;

#line 38
        _S1314.differential_0 = _S1318;

#line 38
        _S1315.primal_0 = _S1312;

#line 38
        _S1315.differential_0 = _S1318;

#line 38
        _S1316.primal_0 = _S1313;

#line 38
        _S1316.differential_0 = _S1318;

#line 38
    }

#line 38
    dpn0_0 = _S1314;

#line 38
    dpn1_0 = _S1315;

#line 38
    dpn2_0 = _S1316;

#line 38
    return;
}


#line 38
DiffPair_float3_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeShadingNormal_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_4, GeometryInstanceID_0 instanceID_15, uint primitiveIndex_4, DiffPair_float3_0 dpdpbarycentrics_2)
{

#line 241 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S1319 = { dpdpthis_4.primal_0.gradientFlags_1, dpdpthis_4.differential_0.gradientFlags_0 };

#line 241
    float3 _S1320 = (float3)0.0;

#line 241
    DiffPair_float3_0 _S1321;

#line 241
    _S1321.primal_0 = _S1320;

#line 241
    _S1321.differential_0 = _S1320;

#line 241
    DiffPair_float3_0 _S1322;

#line 241
    _S1322.primal_0 = _S1320;

#line 241
    _S1322.differential_0 = _S1320;

#line 241
    DiffPair_float3_0 _S1323;

#line 241
    _S1323.primal_0 = _S1320;

#line 241
    _S1323.differential_0 = _S1320;

#line 241
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexNormalsW_0(_S1319, instanceID_15, primitiveIndex_4, _S1321, _S1322, _S1323);

#line 241
    float _S1324 = dpdpbarycentrics_2.primal_0.x;

#line 241
    float _S1325 = dpdpbarycentrics_2.primal_0.y;

#line 241
    float _S1326 = dpdpbarycentrics_2.primal_0.z;

#line 241
    DiffPair_float3_0 _S1327 = { _S1321.primal_0 * _S1324 + _S1322.primal_0 * _S1325 + _S1323.primal_0 * _S1326, _S1321.differential_0 * _S1324 + dpdpbarycentrics_2.differential_0.x * _S1321.primal_0 + (_S1322.differential_0 * _S1325 + dpdpbarycentrics_2.differential_0.y * _S1322.primal_0) + (_S1323.differential_0 * _S1326 + dpdpbarycentrics_2.differential_0.z * _S1323.primal_0) };

#line 241
    return _S1327;
}


#line 241
DiffPair_IntersectionInfo_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_5, HitInfo_0 hitInfo_1, DiffPair_DiffRay_0 dpdpray_1, int mode_1, out s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _s_diff_ctx_0)
{

#line 198
    float3 _S1328 = (float3)0.0;

#line 198
    GeometryInstanceID_0 _S1329 = { 0U };

#line 198
    GeometryHit_0 _S1330 = { _S1329, 0U, (float2)0.0 };

#line 198
    TriangleHit_0 _S1331 = { _S1330 };

#line 198
    _s_diff_ctx_0._S1205 = _S1328;

#line 198
    _s_diff_ctx_0.hit_8 = _S1331;

#line 198
    _s_diff_ctx_0._S1205 = _S1328;

#line 198
    TriangleHit_0 hit_9 = HitInfo_getTriangleHit_0(hitInfo_1);

#line 198
    _s_diff_ctx_0.hit_8 = hit_9;

#line 198
    DiffPair_IntersectionInfo_0 _S1332 = s_bwd_primal_s_fwd_IntersectionInfo_x24init_0();

#line 198
    IntersectionInfo_0 info_1 = _S1332.primal_0;

#line 198
    info_1.triangleID_2 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
    info_1.instanceID_7 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
    s_diff_s_diff_IntersectionInfo_0 s_diff_info_0;

#line 198
    if(mode_1 == int(0))
    {

#line 198
        DiffPair_DifferentiableSceneQuery_0 _S1333 = { dpdpthis_5.primal_0, dpdpthis_5.differential_0 };

#line 198
        DiffPair_DiffRay_0 _S1334 = { dpdpray_1.primal_0, dpdpray_1.differential_0 };

#line 198
        DiffPair_float_0 _S1335;

#line 198
        _S1335.primal_0 = 0.0;

#line 198
        _S1335.differential_0 = 0.0;

#line 198
        DiffPair_float3_0 _S1336;

#line 198
        _S1336.primal_0 = _S1328;

#line 198
        _S1336.differential_0 = _S1328;

#line 198
        DiffPair_float3_0 _S1337;

#line 198
        _S1337.primal_0 = _S1328;

#line 198
        _S1337.differential_0 = _S1328;

#line 198
        DiffPair_float3_0 _S1338 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_1(_S1333, hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S1334, _S1335, _S1336, _S1337);

#line 198
        info_1.triangleID_2 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
        info_1.instanceID_7 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
        info_1.barycentrics_2 = _S1336.primal_0;

#line 198
        info_1.normalW_2 = _S1337.primal_0;

#line 198
        info_1.posW_5 = _S1338.primal_0;

#line 198
        info_1.hitT_5 = _S1335.primal_0;

#line 198
        s_diff_info_0.barycentrics_0 = _S1336.differential_0;

#line 198
        s_diff_info_0.normalW_0 = _S1337.differential_0;

#line 198
        s_diff_info_0.posW_2 = _S1338.differential_0;

#line 198
        s_diff_info_0.hitT_0 = _S1335.differential_0;

#line 198
    }
    else
    {

#line 198
        if(mode_1 == int(1))
        {

#line 198
            float3 _S1339 = GeometryHit_getBarycentricWeights_0(hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit);

#line 198
            _s_diff_ctx_0._S1205 = _S1339;

#line 198
            DiffPair_DifferentiableSceneQuery_0 _S1340 = { dpdpthis_5.primal_0, dpdpthis_5.differential_0 };

#line 198
            DiffPair_float3_0 _S1341;

#line 198
            _S1341.primal_0 = _S1328;

#line 198
            _S1341.differential_0 = _S1328;

#line 198
            DiffPair_float3_0 _S1342 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_0(_S1340, hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S1339, _S1341, dpdpray_1.primal_0.pixel_1);

#line 198
            DiffPair_float3_0 _S1343 = { _S1342.primal_0 - dpdpray_1.primal_0.origin_2, _S1342.differential_0 - dpdpray_1.differential_0.origin_0 };

#line 198
            DiffPair_float_0 _S1344 = s_bwd_primal_s_fwd_length_impl_0(_S1343);

#line 198
            info_1.triangleID_2 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
            info_1.instanceID_7 = hit_9._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
            info_1.barycentrics_2 = _S1339;

#line 198
            info_1.normalW_2 = _S1341.primal_0;

#line 198
            info_1.posW_5 = _S1342.primal_0;

#line 198
            info_1.hitT_5 = _S1344.primal_0;

#line 198
            s_diff_info_0.barycentrics_0 = _S1328;

#line 198
            s_diff_info_0.normalW_0 = _S1341.differential_0;

#line 198
            s_diff_info_0.posW_2 = _S1342.differential_0;

#line 198
            s_diff_info_0.hitT_0 = _S1344.differential_0;

#line 198
        }
        else
        {

#line 198
            s_diff_info_0 = _S1332.differential_0;

#line 198
        }

#line 198
    }

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S1345 = { dpdpthis_5.primal_0, dpdpthis_5.differential_0 };

#line 198
    DiffPair_float3_0 _S1346 = { info_1.barycentrics_2, s_diff_info_0.barycentrics_0 };

#line 198
    DiffPair_float3_0 _S1347 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeShadingNormal_0(_S1345, info_1.instanceID_7, info_1.triangleID_2, _S1346);

#line 198
    info_1.normalW_2 = _S1347.primal_0;

#line 198
    s_diff_info_0.normalW_0 = _S1347.differential_0;

#line 198
    DiffPair_IntersectionInfo_0 _S1348 = { info_1, s_diff_info_0 };

#line 198
    return _S1348;
}


#line 198
bool s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_6, DiffPair_DiffRay_0 dpdprayData_0, out DiffPair_IntersectionInfo_0 dpdpisectInfo_0, int mode_2, out s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _s_diff_ctx_1)
{

#line 144
    uint4 _S1349 = (uint4)0U;

#line 144
    HitInfo_0 _S1350 = { _S1349 };

#line 144
    _s_diff_ctx_1._S1199 = _S1350;

#line 144
    _s_diff_ctx_1.isHit_0 = false;

#line 144
    float3 _S1351 = (float3)0.0;

#line 144
    GeometryInstanceID_0 _S1352 = { 0U };

#line 144
    GeometryHit_0 _S1353 = { _S1352, 0U, (float2)0.0 };

#line 144
    TriangleHit_0 _S1354 = { _S1353 };

#line 144
    _s_diff_ctx_1._S1199.data_4 = _S1349;

#line 144
    IntersectionInfo_0 _S1355 = { 0U, _S1352, _S1351, _S1351, _S1351, 0.0 };

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S1356 = { _S1351, _S1351, _S1351, 0.0 };

#line 144
    Ray_0 _S1357 = { dpdprayData_0.primal_0.origin_2, 0.0, dpdprayData_0.primal_0.direction_1, 340282346638528859811704183484516925440.0 };

#line 144
    HitInfo_0 _S1358 = HitInfo_x24init_0();

#line 144
    float _S1359 = 0.0;

#line 144
    HitInfo_0 _S1360 = _S1358;

#line 144
    bool _S1361 = SceneRayQuery_traceRay_0(_S1357, _S1360, _S1359, 0U, 255U);

#line 144
    _s_diff_ctx_1.isHit_0 = _S1361;

#line 144
    _s_diff_ctx_1._S1199 = _S1360;

#line 144
    HitInfo_0 _S1362 = _S1360;

#line 163
    bool _S1363 = !_S1361;

#line 163
    DiffPair_IntersectionInfo_0 _S1364;

#line 163
    if(_S1363)
    {

#line 163
        DiffPair_IntersectionInfo_0 _S1365 = s_bwd_primal_s_fwd_IntersectionInfo_x24init_0();

#line 163
        _S1364.primal_0 = _S1365.primal_0;

#line 163
        _S1364.differential_0 = _S1365.differential_0;

#line 163
    }
    else
    {

#line 163
        _S1364.primal_0 = _S1355;

#line 163
        _S1364.differential_0 = _S1356;

#line 163
    }

#line 163
    bool _S1366 = !_S1363;

#line 163
    if(_S1366)
    {

#line 163
        DiffPair_DifferentiableSceneQuery_0 _S1367 = { dpdpthis_6.primal_0, dpdpthis_6.differential_0 };

#line 163
        DiffPair_DiffRay_0 _S1368 = { dpdprayData_0.primal_0, dpdprayData_0.differential_0 };

#line 163
        s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _S1369;

#line 163
        _S1369._S1205 = _S1351;

#line 163
        _S1369.hit_8 = _S1354;

#line 163
        DiffPair_IntersectionInfo_0 _S1370 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_0(_S1367, _S1362, _S1368, mode_2, _S1369);

#line 163
        _S1364.primal_0 = _S1370.primal_0;

#line 163
        _S1364.differential_0 = _S1370.differential_0;

#line 163
    }
    else
    {

#line 163
    }

#line 163
    dpdpisectInfo_0 = _S1364;

#line 163
    return _S1366;
}


#line 163
float3 s_bwd_cross_0(float3 _S1371, float3 _S1372)
{

#line 163
    return cross(_S1371, _S1372);
}


#line 163
float s_bwd_dot_0(float3 _S1373, float3 _S1374)
{

#line 163
    return dot(_S1373, _S1374);
}


#line 163
float s_bwd_clamp_0(float _S1375, float _S1376, float _S1377)
{

#line 163
    return clamp(_S1375, _S1376, _S1377);
}


#line 163
DiffPair_float_0 s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(IntersectionInfo_0 dpinfo_0, float3 dporigin_1, float3 dpauxDirection_0, float dpauxSampleY_0, float dpkappa_0, DiffPair_float3_0 dpdirection_1, out s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _s_diff_ctx_2)
{

#line 163
    _s_diff_ctx_2.boundaryTerm_0 = 0.0;

#line 163
    float boundaryTerm_1 = computeBoundaryTermMitsuba_0(dpinfo_0, dporigin_1, dpauxDirection_0);

#line 163
    _s_diff_ctx_2.boundaryTerm_0 = boundaryTerm_1;

#line 163
    float invVMFDensity_0 = 1.0 / (dpauxSampleY_0 * s_bwd_exp_0(-2.0 * dpkappa_0) + (1.0 - dpauxSampleY_0));

#line 163
    float wDenom_0 = invVMFDensity_0 - 1.0 + boundaryTerm_1;

#line 163
    float wDenomRCP_0 = wDenom_0 > 0.00009999999747378752 ? 1.0 / wDenom_0 : 0.0;

#line 163
    float w_0 = wDenomRCP_0 * wDenomRCP_0 * wDenomRCP_0 * invVMFDensity_0;

#line 163
    DiffPair_float_0 _S1378 = { w_0, s_bwd_clamp_0(invVMFDensity_0 * w_0 * wDenomRCP_0 * ReparamCB_0.gVMFConcentration_0 * 3.0 * s_bwd_dot_0(- s_bwd_cross_0(dpdirection_1.primal_0, s_bwd_cross_0(dpdirection_1.primal_0, dpdirection_1.differential_0)), dpauxDirection_0), -10000000000.0, 10000000000.0) };

#line 163
    return _S1378;
}


#line 163
bool s_bwd_primal_s_fwd_traceAsymptoticWeightedMeanIntersection_0(DiffPair_DifferentiableSceneQuery_0 dpdpquery_0, float kappa_1, uint2 globalPixel_0, float3 baseDirection_0, DiffPair_float3_0 dpdporigin_3, DiffPair_array_float3_1 dpdpdirection_3, out DiffPair_array_float3_1 dpdpwarpedPoint_0, inout UniformSampleGenerator_0 sg_18, out s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _s_diff_ctx_3)
{

#line 382 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    DiffPair_float_0 _S1379 = { 0.0, 0.0 };

#line 382
    DiffPair_float_0  _S1380[int(18)] = { _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379, _S1379 };

#line 382
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1381 = { 0.0 };

#line 382
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1382[int(18)] = { _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381, _S1381 };

#line 382
    float3 _S1383 = (float3)0.0;

#line 382
    float3  _S1384[int(18)] = { _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383, _S1383 };

#line 382
    int  _S1385[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 382
    float3  _S1386[int(2)] = { _S1383, _S1383 };

#line 382
    float  _S1387[int(2)] = { 0.0, 0.0 };

#line 382
    float  _S1388[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 382
    _s_diff_ctx_3._S1104 = _S1380;

#line 382
    _s_diff_ctx_3._S1105 = _S1382;

#line 382
    _s_diff_ctx_3._S1106 = _S1380;

#line 382
    _s_diff_ctx_3._S1107 = _S1382;

#line 382
    _s_diff_ctx_3._S1108 = _S1384;

#line 382
    _s_diff_ctx_3._S1109 = _S1384;

#line 382
    _s_diff_ctx_3._S1110 = int(0);

#line 382
    _s_diff_ctx_3._S1111 = _S1385;

#line 382
    _s_diff_ctx_3._S1112 = _S1386;

#line 382
    _s_diff_ctx_3._S1113 = _S1386;

#line 382
    _s_diff_ctx_3._S1114 = _S1387;

#line 382
    _s_diff_ctx_3._S1115 = _S1387;

#line 382
    _s_diff_ctx_3._S1116 = int(0);

#line 382
    _s_diff_ctx_3._S1117 = _S1388;

#line 382
    _s_diff_ctx_3._S1118 = _S1385;

#line 382
    HitInfo_0 _S1389 = { (uint4)0U };

#line 382
    _s_diff_ctx_3._S1104[int(0)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(1)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(2)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(3)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(4)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(5)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(6)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(7)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(8)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(9)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(10)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(11)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(12)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(13)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(14)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(15)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(16)] = _S1379;

#line 382
    _s_diff_ctx_3._S1104[int(17)] = _S1379;

#line 382
    _s_diff_ctx_3._S1105[int(0)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(1)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(2)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(3)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(4)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(5)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(6)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(7)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(8)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(9)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(10)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(11)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(12)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(13)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(14)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(15)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(16)] = _S1381;

#line 382
    _s_diff_ctx_3._S1105[int(17)] = _S1381;

#line 382
    _s_diff_ctx_3._S1106[int(0)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(1)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(2)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(3)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(4)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(5)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(6)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(7)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(8)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(9)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(10)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(11)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(12)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(13)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(14)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(15)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(16)] = _S1379;

#line 382
    _s_diff_ctx_3._S1106[int(17)] = _S1379;

#line 382
    _s_diff_ctx_3._S1107[int(0)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(1)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(2)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(3)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(4)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(5)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(6)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(7)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(8)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(9)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(10)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(11)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(12)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(13)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(14)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(15)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(16)] = _S1381;

#line 382
    _s_diff_ctx_3._S1107[int(17)] = _S1381;

#line 382
    _s_diff_ctx_3._S1108[int(0)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(1)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(2)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(3)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(4)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(5)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(6)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(7)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(8)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(9)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(10)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(11)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(12)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(13)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(14)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(15)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(16)] = _S1383;

#line 382
    _s_diff_ctx_3._S1108[int(17)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(0)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(1)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(2)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(3)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(4)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(5)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(6)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(7)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(8)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(9)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(10)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(11)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(12)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(13)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(14)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(15)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(16)] = _S1383;

#line 382
    _s_diff_ctx_3._S1109[int(17)] = _S1383;

#line 382
    _s_diff_ctx_3._S1110 = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(0)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(1)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(2)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(3)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(4)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(5)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(6)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(7)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(8)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(9)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(10)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(11)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(12)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(13)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(14)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(15)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(16)] = int(0);

#line 382
    _s_diff_ctx_3._S1111[int(17)] = int(0);

#line 382
    _s_diff_ctx_3._S1112[int(0)] = _S1383;

#line 382
    _s_diff_ctx_3._S1112[int(1)] = _S1383;

#line 382
    _s_diff_ctx_3._S1113[int(0)] = _S1383;

#line 382
    _s_diff_ctx_3._S1113[int(1)] = _S1383;

#line 382
    _s_diff_ctx_3._S1114[int(0)] = 0.0;

#line 382
    _s_diff_ctx_3._S1114[int(1)] = 0.0;

#line 382
    _s_diff_ctx_3._S1115[int(0)] = 0.0;

#line 382
    _s_diff_ctx_3._S1115[int(1)] = 0.0;

#line 382
    _s_diff_ctx_3._S1116 = int(0);

#line 382
    _s_diff_ctx_3._S1117[int(0)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(1)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(2)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(3)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(4)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(5)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(6)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(7)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(8)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(9)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(10)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(11)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(12)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(13)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(14)] = 0.0;

#line 382
    _s_diff_ctx_3._S1117[int(15)] = 0.0;

#line 382
    _s_diff_ctx_3._S1118[int(0)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(1)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(2)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(3)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(4)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(5)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(6)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(7)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(8)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(9)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(10)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(11)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(12)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(13)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(14)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(15)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(16)] = int(0);

#line 382
    _s_diff_ctx_3._S1118[int(17)] = int(0);

#line 382
    UniformSampleGenerator_0 _S1390 = sg_18;

#line 382
    float3 _S1391 = float3(0.0, 0.0, 0.0);

#line 382
    float3  _S1392[int(2)] = { _S1391, _S1391 };

#line 382
    DiffPair_float3_0 _S1393 = { dpdporigin_3.primal_0, dpdporigin_3.differential_0 };

#line 382
    DiffPair_DifferentiableSceneQuery_0 _S1394 = { dpdpquery_0.primal_0, dpdpquery_0.differential_0 };

#line 382
    GeometryInstanceID_0 _S1395 = { 0U };

#line 382
    IntersectionInfo_0 _S1396 = { 0U, _S1395, _S1383, _S1383, _S1383, 0.0 };

#line 382
    s_diff_s_diff_IntersectionInfo_0 _S1397 = { _S1383, _S1383, _S1383, 0.0 };

#line 382
    DiffPair_float3_0 _S1398 = { dpdpdirection_3.primal_0[int(0)], dpdpdirection_3.differential_0[int(0)] };

#line 382
    DiffPair_float3_0 _S1399 = { dpdpdirection_3.primal_0[int(1)], dpdpdirection_3.differential_0[int(1)] };

#line 382
    DiffPair_float_0 _S1400 = { 0.00000000999999993923, 0.0 };

#line 382
    int _S1401;

#line 382
    bool _bflag_0 = true;

#line 382
    int i_0 = int(0);

#line 382
    UniformSampleGenerator_0 _S1402 = sg_18;

#line 382
    float  rnd_0[int(16)];

#line 382
    rnd_0[int(0)] = 0.0;

#line 382
    rnd_0[int(1)] = 0.0;

#line 382
    rnd_0[int(2)] = 0.0;

#line 382
    rnd_0[int(3)] = 0.0;

#line 382
    rnd_0[int(4)] = 0.0;

#line 382
    rnd_0[int(5)] = 0.0;

#line 382
    rnd_0[int(6)] = 0.0;

#line 382
    rnd_0[int(7)] = 0.0;

#line 382
    rnd_0[int(8)] = 0.0;

#line 382
    rnd_0[int(9)] = 0.0;

#line 382
    rnd_0[int(10)] = 0.0;

#line 382
    rnd_0[int(11)] = 0.0;

#line 382
    rnd_0[int(12)] = 0.0;

#line 382
    rnd_0[int(13)] = 0.0;

#line 382
    rnd_0[int(14)] = 0.0;

#line 382
    rnd_0[int(15)] = 0.0;

#line 382
    float  s_diff_rnd_0[int(16)];

#line 382
    s_diff_rnd_0[int(0)] = 0.0;

#line 382
    s_diff_rnd_0[int(1)] = 0.0;

#line 382
    s_diff_rnd_0[int(2)] = 0.0;

#line 382
    s_diff_rnd_0[int(3)] = 0.0;

#line 382
    s_diff_rnd_0[int(4)] = 0.0;

#line 382
    s_diff_rnd_0[int(5)] = 0.0;

#line 382
    s_diff_rnd_0[int(6)] = 0.0;

#line 382
    s_diff_rnd_0[int(7)] = 0.0;

#line 382
    s_diff_rnd_0[int(8)] = 0.0;

#line 382
    s_diff_rnd_0[int(9)] = 0.0;

#line 382
    s_diff_rnd_0[int(10)] = 0.0;

#line 382
    s_diff_rnd_0[int(11)] = 0.0;

#line 382
    s_diff_rnd_0[int(12)] = 0.0;

#line 382
    s_diff_rnd_0[int(13)] = 0.0;

#line 382
    s_diff_rnd_0[int(14)] = 0.0;

#line 382
    s_diff_rnd_0[int(15)] = 0.0;

#line 382
    int _pc_0 = int(0);

#line 382
    for(;;)
    {

#line 382
        _s_diff_ctx_3._S1116 = _pc_0;

#line 382
        _s_diff_ctx_3._S1117 = rnd_0;

#line 382
        _s_diff_ctx_3._S1118[_pc_0] = _S1401;

#line 382
        if(_bflag_0)
        {
        }
        else
        {

#line 382
            break;
        }

#line 382
        bool _S1403 = i_0 < int(16);

#line 382
        int _S1404;

#line 382
        if(_S1403)
        {

#line 382
            _S1404 = _S1401;

#line 382
        }
        else
        {

#line 382
            _S1404 = int(1);

#line 382
        }

#line 382
        UniformSampleGenerator_0 _S1405;

#line 382
        if(_S1403)
        {

#line 382
            UniformSampleGenerator_0 _S1406 = _S1402;

#line 382
            float _S1407 = sampleNext1D_0(_S1406);

#line 382
            _S1405 = _S1406;

#line 382
            float  _S1408[int(16)] = rnd_0;

#line 382
            _S1408[i_0] = _S1407;

#line 382
            float  _S1409[int(16)] = s_diff_rnd_0;

#line 382
            _S1409[i_0] = 0.0;

#line 382
            _S1401 = int(2);

#line 382
            rnd_0 = _S1408;

#line 382
            s_diff_rnd_0 = _S1409;

#line 382
        }
        else
        {

#line 382
            _S1401 = _S1404;

#line 382
        }

#line 382
        if(_S1401 != int(2))
        {

#line 382
            _bflag_0 = false;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        if(_bflag_0)
        {

#line 382
            i_0 = i_0 + int(1);

#line 382
            _S1402 = _S1405;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        _pc_0 = _pc_0 + int(1);

#line 382
    }

#line 382
    _bflag_0 = true;

#line 382
    uint i_1 = 0U;

#line 382
    float  totalWeight_0[int(2)];

#line 382
    totalWeight_0[int(0)] = 0.0;

#line 382
    totalWeight_0[int(1)] = 0.0;

#line 382
    float  s_diff_totalWeight_0[int(2)];

#line 382
    s_diff_totalWeight_0[int(0)] = 0.0;

#line 382
    s_diff_totalWeight_0[int(1)] = 0.0;

#line 382
    float3  totalWarpedPoint_0[int(2)];

#line 382
    totalWarpedPoint_0[int(0)] = _S1391;

#line 382
    totalWarpedPoint_0[int(1)] = _S1391;

#line 382
    float3  s_diff_totalWarpedPoint_0[int(2)];

#line 382
    s_diff_totalWarpedPoint_0[int(0)] = _S1391;

#line 382
    s_diff_totalWarpedPoint_0[int(1)] = _S1391;

#line 382
    i_0 = _S1401;

#line 382
    _pc_0 = int(0);

#line 382
    for(;;)
    {

#line 382
        _s_diff_ctx_3._S1110 = _pc_0;

#line 382
        _s_diff_ctx_3._S1111[_pc_0] = i_0;

#line 382
        _s_diff_ctx_3._S1112 = s_diff_totalWarpedPoint_0;

#line 382
        _s_diff_ctx_3._S1113 = totalWarpedPoint_0;

#line 382
        _s_diff_ctx_3._S1114 = s_diff_totalWeight_0;

#line 382
        _s_diff_ctx_3._S1115 = totalWeight_0;

#line 382
        if(_bflag_0)
        {
        }
        else
        {

#line 382
            break;
        }

#line 382
        bool _S1410 = i_1 < 16U;

#line 382
        if(_S1410)
        {

#line 382
            _S1401 = i_0;

#line 382
        }
        else
        {

#line 382
            _S1401 = int(1);

#line 382
        }

#line 382
        float  totalWeight_1[int(2)];

#line 382
        float  s_diff_totalWeight_1[int(2)];

#line 382
        float3  totalWarpedPoint_1[int(2)];

#line 382
        float3  s_diff_totalWarpedPoint_1[int(2)];

#line 382
        if(_S1410)
        {

#line 382
            uint _S1411 = i_1 / 2U * 2U;

#line 382
            uint _S1412 = _S1411 + 1U;

#line 382
            float  _S1413[int(16)] = rnd_0;

#line 382
            float3 _S1414 = sampleVonMisesFisher_0(baseDirection_0, kappa_1, float2(rnd_0[_S1411], rnd_0[_S1412]));

#line 382
            _s_diff_ctx_3._S1109[_pc_0] = _S1414;

#line 382
            float3 auxDir_0;

#line 382
            if(i_1 % 2U != 0U)
            {

#line 382
                float3 _S1415 = _reflect_0(- _S1414, baseDirection_0);

#line 382
                _s_diff_ctx_3._S1108[_pc_0] = _S1415;

#line 382
                auxDir_0 = _S1415;

#line 382
            }
            else
            {

#line 382
                auxDir_0 = _S1414;

#line 382
            }

#line 382
            DiffPair_float3_0 _S1416 = { auxDir_0, _S1383 };

#line 382
            DiffPair_DiffRay_0 _S1417 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S1393, _S1416, globalPixel_0);

#line 382
            DiffPair_DiffRay_0 _S1418 = { _S1417.primal_0, _S1417.differential_0 };

#line 382
            DiffPair_IntersectionInfo_0 _S1419;

#line 382
            _S1419.primal_0 = _S1396;

#line 382
            _S1419.differential_0 = _S1397;

#line 382
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S1420;

#line 382
            _S1420._S1199 = _S1389;

#line 382
            _S1420.isHit_0 = false;

#line 382
            bool _S1421 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S1394, _S1418, _S1419, int(1), _S1420);

#line 382
            DiffPair_IntersectionInfo_0 _S1422 = _S1419;

#line 382
            if(_S1421)
            {

#line 382
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1423;

#line 382
                _S1423.boundaryTerm_0 = 0.0;

#line 382
                DiffPair_float_0 _S1424 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S1422.primal_0, dpdporigin_3.primal_0, auxDir_0, _S1413[_S1412], kappa_1, _S1398, _S1423);

#line 382
                _s_diff_ctx_3._S1106[_pc_0] = _S1424;

#line 382
                _s_diff_ctx_3._S1107[_pc_0] = _S1423;

#line 382
                if(_S1424.primal_0 > 0.0)
                {

#line 382
                    float _S1425 = totalWeight_0[int(0)] + _S1424.primal_0;

#line 382
                    float _S1426 = s_diff_totalWeight_0[int(0)] + _S1424.differential_0;

#line 382
                    totalWeight_1 = totalWeight_0;

#line 382
                    totalWeight_1[int(0)] = _S1425;

#line 382
                    s_diff_totalWeight_1 = s_diff_totalWeight_0;

#line 382
                    s_diff_totalWeight_1[int(0)] = _S1426;

#line 382
                    float3 _S1427 = (float3)_S1424.primal_0;

#line 382
                    float3 _S1428 = totalWarpedPoint_0[int(0)] + _S1427 * _S1422.primal_0.posW_5;

#line 382
                    float3 _S1429 = s_diff_totalWarpedPoint_0[int(0)] + ((float3)_S1424.differential_0 * _S1422.primal_0.posW_5 + _S1422.differential_0.posW_2 * _S1427);

#line 382
                    totalWarpedPoint_1 = totalWarpedPoint_0;

#line 382
                    totalWarpedPoint_1[int(0)] = _S1428;

#line 382
                    s_diff_totalWarpedPoint_1 = s_diff_totalWarpedPoint_0;

#line 382
                    s_diff_totalWarpedPoint_1[int(0)] = _S1429;

#line 382
                }
                else
                {

#line 382
                    totalWeight_1 = totalWeight_0;

#line 382
                    s_diff_totalWeight_1 = s_diff_totalWeight_0;

#line 382
                    totalWarpedPoint_1 = totalWarpedPoint_0;

#line 382
                    s_diff_totalWarpedPoint_1 = s_diff_totalWarpedPoint_0;

#line 382
                }

#line 382
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1430;

#line 382
                _S1430.boundaryTerm_0 = 0.0;

#line 382
                DiffPair_float_0 _S1431 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S1422.primal_0, dpdporigin_3.primal_0, auxDir_0, _S1413[_S1412], kappa_1, _S1399, _S1430);

#line 382
                _s_diff_ctx_3._S1104[_pc_0] = _S1431;

#line 382
                _s_diff_ctx_3._S1105[_pc_0] = _S1430;

#line 382
                float  totalWeight_2[int(2)];

#line 382
                float  s_diff_totalWeight_2[int(2)];

#line 382
                float3  totalWarpedPoint_2[int(2)];

#line 382
                float3  s_diff_totalWarpedPoint_2[int(2)];

#line 382
                if(_S1431.primal_0 > 0.0)
                {

#line 382
                    float _S1432 = totalWeight_1[int(1)] + _S1431.primal_0;

#line 382
                    float _S1433 = s_diff_totalWeight_1[int(1)] + _S1431.differential_0;

#line 382
                    totalWeight_2 = totalWeight_1;

#line 382
                    totalWeight_2[int(1)] = _S1432;

#line 382
                    s_diff_totalWeight_2 = s_diff_totalWeight_1;

#line 382
                    s_diff_totalWeight_2[int(1)] = _S1433;

#line 382
                    float3 _S1434 = (float3)_S1431.primal_0;

#line 382
                    float3 _S1435 = totalWarpedPoint_1[int(1)] + _S1434 * _S1422.primal_0.posW_5;

#line 382
                    float3 _S1436 = s_diff_totalWarpedPoint_1[int(1)] + ((float3)_S1431.differential_0 * _S1422.primal_0.posW_5 + _S1422.differential_0.posW_2 * _S1434);

#line 382
                    totalWarpedPoint_2 = totalWarpedPoint_1;

#line 382
                    totalWarpedPoint_2[int(1)] = _S1435;

#line 382
                    s_diff_totalWarpedPoint_2 = s_diff_totalWarpedPoint_1;

#line 382
                    s_diff_totalWarpedPoint_2[int(1)] = _S1436;

#line 382
                }
                else
                {

#line 382
                    totalWeight_2 = totalWeight_1;

#line 382
                    s_diff_totalWeight_2 = s_diff_totalWeight_1;

#line 382
                    totalWarpedPoint_2 = totalWarpedPoint_1;

#line 382
                    s_diff_totalWarpedPoint_2 = s_diff_totalWarpedPoint_1;

#line 382
                }

#line 382
                totalWeight_1 = totalWeight_2;

#line 382
                s_diff_totalWeight_1 = s_diff_totalWeight_2;

#line 382
                totalWarpedPoint_1 = totalWarpedPoint_2;

#line 382
                s_diff_totalWarpedPoint_1 = s_diff_totalWarpedPoint_2;

#line 382
            }
            else
            {

#line 382
                totalWeight_1 = totalWeight_0;

#line 382
                s_diff_totalWeight_1 = s_diff_totalWeight_0;

#line 382
                totalWarpedPoint_1 = totalWarpedPoint_0;

#line 382
                s_diff_totalWarpedPoint_1 = s_diff_totalWarpedPoint_0;

#line 382
            }

#line 382
            i_0 = int(2);

#line 382
        }
        else
        {

#line 382
            i_0 = _S1401;

#line 382
            totalWeight_1 = totalWeight_0;

#line 382
            s_diff_totalWeight_1 = s_diff_totalWeight_0;

#line 382
            totalWarpedPoint_1 = totalWarpedPoint_0;

#line 382
            s_diff_totalWarpedPoint_1 = s_diff_totalWarpedPoint_0;

#line 382
        }

#line 382
        if(i_0 != int(2))
        {

#line 382
            _bflag_0 = false;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        if(_bflag_0)
        {

#line 382
            i_1 = i_1 + 1U;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        int _S1437 = _pc_0 + int(1);

#line 382
        totalWeight_0 = totalWeight_1;

#line 382
        s_diff_totalWeight_0 = s_diff_totalWeight_1;

#line 382
        totalWarpedPoint_0 = totalWarpedPoint_1;

#line 382
        s_diff_totalWarpedPoint_0 = s_diff_totalWarpedPoint_1;

#line 382
        _pc_0 = _S1437;

#line 382
    }

#line 382
    float  _S1438[int(2)] = totalWeight_0;

#line 382
    float  _S1439[int(2)] = s_diff_totalWeight_0;

#line 382
    bool _S1440 = totalWeight_0[int(0)] == 0.0;

#line 382
    UniformSampleGenerator_0 _S1441;

#line 382
    DiffPair_array_float3_1 _S1442;

#line 382
    if(_S1440)
    {

#line 382
        _S1442.primal_0 = _S1392;

#line 382
        _S1442.differential_0 = _S1392;

#line 382
        _S1441 = _S1402;

#line 382
    }
    else
    {

#line 382
        _S1442.primal_0 = _S1386;

#line 382
        _S1442.differential_0 = _S1386;

#line 382
        _S1441 = _S1390;

#line 382
    }

#line 382
    bool _S1443 = !_S1440;

#line 382
    if(_S1443)
    {

#line 382
        DiffPair_float_0 _S1444 = { _S1438[int(0)], _S1439[int(0)] };

#line 382
        DiffPair_float_0 _S1445 = s_bwd_primal_d_max_0(_S1444, _S1400);

#line 382
        float3 _S1446 = (float3)_S1445.primal_0;

#line 382
        DiffPair_float_0 _S1447 = { totalWeight_0[int(1)], s_diff_totalWeight_0[int(1)] };

#line 382
        DiffPair_float_0 _S1448 = s_bwd_primal_d_max_0(_S1447, _S1400);

#line 382
        float3 _S1449 = (float3)_S1448.primal_0;

#line 382
        float3  _S1450[int(2)] = { totalWarpedPoint_0[int(0)] / _S1446, totalWarpedPoint_0[int(1)] / _S1449 };

#line 382
        float3  _S1451[int(2)] = { (s_diff_totalWarpedPoint_0[int(0)] * _S1446 - totalWarpedPoint_0[int(0)] * (float3)_S1445.differential_0) / (_S1446 * _S1446), (s_diff_totalWarpedPoint_0[int(1)] * _S1449 - totalWarpedPoint_0[int(1)] * (float3)_S1448.differential_0) / (_S1449 * _S1449) };

#line 382
        _S1442.primal_0 = _S1450;

#line 382
        _S1442.differential_0 = _S1451;

#line 382
    }
    else
    {

#line 382
        _S1402 = _S1441;

#line 382
    }

#line 382
    sg_18 = _S1402;

#line 382
    dpdpwarpedPoint_0 = _S1442;

#line 382
    return _S1443;
}


#line 382
DiffPair_float2_0 s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(DiffPair_DifferentiableSceneQuery_0 dpdpthis_7, DiffPair_float3_0 dpdpdirection_4, uint2 frameDim_0)
{

#line 297 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    Scene_0 _S1452 = gScene_0;

#line 297
    DiffPair_float3_0 _S1453 = { dpdpdirection_4.primal_0, dpdpdirection_4.differential_0 };

#line 297
    DiffPair_float3_0 _S1454 = s_bwd_primal_s_fwd_safeNormalize_0(_S1453);

#line 297
    float3 _S1455 = (float3)0.0;

#line 297
    DiffPair_float3_0 _S1456 = { _S1452.camera_0.data_1.cameraW_0, _S1455 };

#line 297
    DiffPair_float_0 _S1457 = s_bwd_primal_d_dot_0(_S1456, _S1456);

#line 297
    float3 _S1458 = _S1454.primal_0 * _S1457.primal_0;

#line 297
    DiffPair_float3_0 _S1459 = { _S1454.primal_0, _S1454.differential_0 };

#line 297
    DiffPair_float_0 _S1460 = s_bwd_primal_d_dot_0(_S1456, _S1459);

#line 297
    DiffPair_float3_0 _S1461 = { _S1458 / _S1460.primal_0 - _S1452.camera_0.data_1.cameraW_0, ((_S1454.differential_0 * _S1457.primal_0 + _S1457.differential_0 * _S1454.primal_0) * _S1460.primal_0 - _S1458 * _S1460.differential_0) / (_S1460.primal_0 * _S1460.primal_0) };

#line 297
    DiffPair_float3_0 _S1462 = { _S1452.camera_0.data_1.cameraU_0, _S1455 };

#line 297
    DiffPair_float_0 _S1463 = s_bwd_primal_d_dot_0(_S1461, _S1462);

#line 297
    DiffPair_float3_0 _S1464 = { _S1452.camera_0.data_1.cameraV_0, _S1455 };

#line 297
    DiffPair_float_0 _S1465 = s_bwd_primal_d_dot_0(_S1461, _S1464);

#line 297
    float2 _S1466 = float2(_S1463.primal_0, _S1465.primal_0);

#line 297
    DiffPair_float_0 _S1467 = s_bwd_primal_d_dot_0(_S1462, _S1462);

#line 297
    DiffPair_float_0 _S1468 = s_bwd_primal_d_dot_0(_S1464, _S1464);

#line 297
    float2 _S1469 = float2(_S1467.primal_0, _S1468.primal_0);

#line 297
    float2 _S1470 = float2(2.0, -2.0);

#line 321
    float2 _S1471 = float2(frameDim_0);

#line 321
    DiffPair_float2_0 _S1472 = { _S1471 * ((_S1466 / _S1469 + float2(1.0, -1.0)) / _S1470) - float2(0.5, 0.5), (float2(_S1463.differential_0, _S1465.differential_0) * _S1469 - _S1466 * float2(_S1467.differential_0, _S1468.differential_0)) / (_S1469 * _S1469) * _S1470 / (_S1470 * _S1470) * _S1471 };

#line 321
    return _S1472;
}


#line 321
void s_bwd_primal_s_fwd_computeWarpedPrimalSample_0(DiffPair_DifferentiableSceneQuery_0 dpdpquery_1, float kappa_2, DiffPair_float2_0 dpdpbasePosS_0, DiffPair_array_float2_0 dpdpposS_1, out DiffPair_array_float2_0 dpdpwarpedPosS_0, uint2 frameDim_1, uint2 globalPixel_1, inout UniformSampleGenerator_0 sg_19, out s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _s_diff_ctx_4)
{

#line 604 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    DiffPair_float_0 _S1473 = { 0.0, 0.0 };

#line 604
    DiffPair_float_0  _S1474[int(18)] = { _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473, _S1473 };

#line 604
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1475 = { 0.0 };

#line 604
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1476[int(18)] = { _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475, _S1475 };

#line 604
    float3 _S1477 = (float3)0.0;

#line 604
    float3  _S1478[int(18)] = { _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477, _S1477 };

#line 604
    int  _S1479[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 604
    float3  _S1480[int(2)] = { _S1477, _S1477 };

#line 604
    float  _S1481[int(2)] = { 0.0, 0.0 };

#line 604
    float  _S1482[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 604
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S1483 = { _S1474, _S1476, _S1474, _S1476, _S1478, _S1478, int(0), _S1479, _S1480, _S1480, _S1481, _S1481, int(0), _S1482, _S1479 };

#line 604
    DiffPair_array_float3_1 _S1484 = { _S1480, _S1480 };

#line 604
    uint  _S1485[int(4)] = { 0U, 0U, 0U, 0U };

#line 604
    Xoshiro128StarStar_0 _S1486 = { _S1485 };

#line 604
    UniformSampleGenerator_0 _S1487 = { _S1486 };

#line 604
    _s_diff_ctx_4._S1119 = _S1483;

#line 604
    _s_diff_ctx_4._S1120 = _S1484;

#line 604
    _s_diff_ctx_4._S1121 = _S1487;

#line 604
    _s_diff_ctx_4._S1122 = false;

#line 604
    _s_diff_ctx_4._S1120.primal_0 = _S1480;

#line 604
    _s_diff_ctx_4._S1120.differential_0 = _S1480;

#line 604
    _s_diff_ctx_4._S1121.rng_0 = _S1486;

#line 604
    DiffPair_DifferentiableSceneQuery_0 _S1488 = { dpdpquery_1.primal_0, dpdpquery_1.differential_0 };

#line 604
    DiffPair_float2_0 _S1489 = { dpdpbasePosS_0.primal_0, dpdpbasePosS_0.differential_0 };

#line 604
    DiffPair_float2_0 _S1490 = { float2(frameDim_1), (float2)0.0 };

#line 604
    DiffPair_float3_0 _S1491 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S1488, _S1489, _S1490);

#line 604
    DiffPair_float2_0 _S1492 = { dpdpposS_1.primal_0[int(0)], dpdpposS_1.differential_0[int(0)] };

#line 604
    DiffPair_float3_0 _S1493 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S1488, _S1492, _S1490);

#line 604
    DiffPair_float2_0 _S1494 = { dpdpposS_1.primal_0[int(1)], dpdpposS_1.differential_0[int(1)] };

#line 604
    DiffPair_float3_0 _S1495 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S1488, _S1494, _S1490);

#line 604
    float3  rayDir_0[int(2)] = { _S1493.primal_0, _S1495.primal_0 };

#line 604
    float3  s_diff_rayDir_0[int(2)] = { _S1493.differential_0, _S1495.differential_0 };

#line 604
    DiffPair_float3_0 _S1496 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadCameraPosition_0(_S1488);

#line 604
    DiffPair_float3_0 _S1497 = { _S1496.primal_0, _S1496.differential_0 };

#line 604
    DiffPair_array_float3_1 _S1498 = { rayDir_0, s_diff_rayDir_0 };

#line 604
    UniformSampleGenerator_0 _S1499 = sg_19;

#line 604
    DiffPair_array_float3_1 _S1500;

#line 604
    _S1500.primal_0 = _S1480;

#line 604
    _S1500.differential_0 = _S1480;

#line 604
    bool _S1501 = s_bwd_primal_s_fwd_traceAsymptoticWeightedMeanIntersection_0(_S1488, kappa_2, globalPixel_1, _S1491.primal_0, _S1497, _S1498, _S1500, _S1499, _s_diff_ctx_4._S1119);

#line 604
    _s_diff_ctx_4._S1122 = _S1501;

#line 604
    _s_diff_ctx_4._S1120 = _S1500;

#line 604
    _s_diff_ctx_4._S1121 = _S1499;

#line 604
    DiffPair_array_float3_1 _S1502 = _S1500;

#line 604
    UniformSampleGenerator_0 _S1503 = _S1499;

#line 604
    float2  _S1504[int(2)];

#line 604
    float2  _S1505[int(2)];

#line 604
    if(_S1501)
    {

#line 604
        DiffPair_float3_0 _S1506 = { _S1502.primal_0[int(0)] - _S1496.primal_0, _S1502.differential_0[int(0)] - _S1496.differential_0 };

#line 604
        DiffPair_float3_0 _S1507 = s_bwd_primal_s_fwd_normalize_impl_0(_S1506);

#line 604
        DiffPair_float3_0 _S1508 = { _S1507.primal_0, _S1507.differential_0 };

#line 604
        DiffPair_float2_0 _S1509 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(_S1488, _S1508, frameDim_1);

#line 604
        DiffPair_float3_0 _S1510 = { _S1502.primal_0[int(1)] - _S1496.primal_0, _S1502.differential_0[int(1)] - _S1496.differential_0 };

#line 604
        DiffPair_float3_0 _S1511 = s_bwd_primal_s_fwd_normalize_impl_0(_S1510);

#line 604
        DiffPair_float3_0 _S1512 = { _S1511.primal_0, _S1511.differential_0 };

#line 604
        DiffPair_float2_0 _S1513 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(_S1488, _S1512, frameDim_1);

#line 604
        _S1504[int(0)] = _S1509.primal_0;

#line 604
        _S1504[int(1)] = _S1513.primal_0;

#line 604
        _S1505[int(0)] = _S1509.differential_0;

#line 604
        _S1505[int(1)] = _S1513.differential_0;

#line 604
    }
    else
    {

#line 604
        _S1504[int(0)] = dpdpposS_1.primal_0[int(0)];

#line 604
        _S1504[int(1)] = dpdpposS_1.primal_0[int(1)];

#line 604
        _S1505[int(0)] = dpdpposS_1.differential_0[int(0)];

#line 604
        _S1505[int(1)] = dpdpposS_1.differential_0[int(1)];

#line 604
    }

#line 604
    sg_19 = _S1503;

#line 604
    dpdpwarpedPosS_0.primal_0 = _S1504;

#line 604
    dpdpwarpedPosS_0.differential_0 = _S1505;

#line 604
    return;
}


#line 604
float2 s_bwd_primal_reparameterizeScreenSample_0(DifferentiableSceneQuery_0 dpquery_0, float2 dpposS_1, uint2 gFrameDim_0, uint2 globalPixel_2, inout UniformSampleGenerator_0 sg_20, out float dpweight_0, out s_bwd_reparameterizeScreenSample_Intermediates_0 _s_diff_ctx_5)
{

#line 658
    DiffPair_float_0 _S1514 = { 0.0, 0.0 };

#line 658
    DiffPair_float_0  _S1515[int(18)] = { _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514, _S1514 };

#line 658
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1516 = { 0.0 };

#line 658
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1517[int(18)] = { _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516, _S1516 };

#line 658
    float3 _S1518 = (float3)0.0;

#line 658
    float3  _S1519[int(18)] = { _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518, _S1518 };

#line 658
    int  _S1520[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 658
    float3  _S1521[int(2)] = { _S1518, _S1518 };

#line 658
    float  _S1522[int(2)] = { 0.0, 0.0 };

#line 658
    float  _S1523[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 658
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S1524 = { _S1515, _S1517, _S1515, _S1517, _S1519, _S1519, int(0), _S1520, _S1521, _S1521, _S1522, _S1522, int(0), _S1523, _S1520 };

#line 658
    DiffPair_array_float3_1 _S1525 = { _S1521, _S1521 };

#line 658
    uint  _S1526[int(4)] = { 0U, 0U, 0U, 0U };

#line 658
    Xoshiro128StarStar_0 _S1527 = { _S1526 };

#line 658
    UniformSampleGenerator_0 _S1528 = { _S1527 };

#line 658
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _S1529 = { _S1524, _S1525, _S1528, false };

#line 658
    float2 _S1530 = (float2)0.0;

#line 658
    float2  _S1531[int(2)] = { _S1530, _S1530 };

#line 658
    DiffPair_array_float2_0 _S1532 = { _S1531, _S1531 };

#line 658
    s_diff_s_diff_SceneDerivativeFlags_0 _S1533 = { int(0) };

#line 658
    _s_diff_ctx_5._S1123 = _S1529;

#line 658
    _s_diff_ctx_5._S1124 = _S1532;

#line 658
    _s_diff_ctx_5._S1125 = _S1528;

#line 658
    _s_diff_ctx_5._S1126 = _S1533;

#line 658
    _s_diff_ctx_5._S1124.primal_0 = _S1531;

#line 658
    _s_diff_ctx_5._S1124.differential_0 = _S1531;

#line 658
    _s_diff_ctx_5._S1125.rng_0 = _S1527;

#line 658
    UniformSampleGenerator_0 sgCopy_0 = sg_20;

#line 658
    float2  _S1534[int(2)] = { dpposS_1, dpposS_1 };

#line 658
    float2  _S1535[int(2)] = { float2(1.0, 0.0), float2(0.0, 1.0) };

#line 658
    DiffPair_array_float2_0 _S1536 = { _S1534, _S1535 };

#line 658
    s_diff_s_diff_SceneDerivativeFlags_0 _S1537 = s_bwd_SceneDerivativeFlags_make_0(int(0));

#line 658
    _s_diff_ctx_5._S1126 = _S1537;

#line 658
    s_diff_s_diff_DifferentiableSceneQuery_0 _S1538 = { _S1537 };

#line 658
    DiffPair_DifferentiableSceneQuery_0 _S1539 = { dpquery_0, _S1538 };

#line 658
    float _S1540 = ReparamCB_0.gVMFConcentrationScreen_0;

#line 658
    DiffPair_float2_0 _S1541 = { dpposS_1, (float2)0.0 };

#line 658
    UniformSampleGenerator_0 _S1542 = sgCopy_0;

#line 658
    DiffPair_array_float2_0 _S1543;

#line 658
    _S1543.primal_0 = _S1531;

#line 658
    _S1543.differential_0 = _S1531;

#line 658
    s_bwd_primal_s_fwd_computeWarpedPrimalSample_0(_S1539, _S1540, _S1541, _S1536, _S1543, gFrameDim_0, globalPixel_2, _S1542, _s_diff_ctx_5._S1123);

#line 658
    _s_diff_ctx_5._S1124 = _S1543;

#line 658
    _s_diff_ctx_5._S1125 = _S1542;

#line 658
    matrix<float,int(2),int(2)>  _S1544 = matrix<float,int(2),int(2)> (0.0, 0.0, 0.0, 0.0);

#line 658
    _S1544[int(0)][int(0)] = 1.0;

#line 658
    _S1544[int(1)][int(1)] = 1.0;

#line 658
    float _S1545 = s_bwd_determinant_0(_S1544);

#line 658
    sg_20 = sgCopy_0;

#line 658
    dpweight_0 = _S1545;

#line 658
    return dpposS_1;
}


#line 658
float s_bwd_dot_1(float2 _S1546, float2 _S1547)
{

#line 658
    return dot(_S1546, _S1547);
}


#line 658
float s_bwd_primal_evalGaussian_0(float2 dpxy_1, float sigma_0, float radius_1)
{

#line 439 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    return s_bwd_exp_0(-1.0 / (2.0 * sigma_0 * sigma_0) * s_bwd_dot_1(dpxy_1, dpxy_1)) * (1.0 / (6.28318548202514648438 * sigma_0 * sigma_0));
}


#line 439
struct s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0
{
    HitInfo_0 _S1548;
    bool isHit_1;
};


#line 144 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
struct s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0
{
    float3 _S1549;
    TriangleHit_0 hit_10;
};


#line 144
float3 s_bwd_normalize_0(float3 _S1550)
{

#line 144
    return normalize(_S1550);
}


#line 144
float3 s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_0(DifferentiableSceneQuery_0 dpthis_3, GeometryInstanceID_0 instanceID_16, uint triangleID_9, float3 barycentrics_7, out float3 dpfaceNormalW_0, uint2 pixel_8)
{

#line 254
    float3 _S1551 = (float3)0.0;

#line 254
    float3 _S1552 = _S1551;

#line 254
    float3 _S1553 = _S1551;

#line 254
    float3 _S1554 = _S1551;

#line 254
    s_bwd_FalcorSceneIO_loadVertexPositionsW_0(dpthis_3.gradientFlags_1, instanceID_16, triangleID_9, _S1552, _S1553, _S1554, pixel_8);

#line 254
    float3 posW_11 = _S1552 * barycentrics_7.x + _S1553 * barycentrics_7.y + _S1554 * barycentrics_7.z;

#line 254
    dpfaceNormalW_0 = s_bwd_normalize_0(s_bwd_cross_0(_S1553 - _S1552, _S1554 - _S1552));

#line 254
    return posW_11;
}


#line 254
float s_bwd_primal_computeDistanceToTriangle_0(float3 dpv0_1, float3 dpv1_1, float3 dpv2_1, float3 dporigin_2, float3 dpdirection_2)
{

#line 254
    float3 edge1_0 = dpv1_1 - dpv0_1;

#line 254
    float3 edge2_0 = dpv2_1 - dpv0_1;

#line 254
    return s_bwd_dot_0(edge2_0, s_bwd_cross_0(dporigin_2 - dpv0_1, edge1_0)) / s_bwd_dot_0(edge1_0, s_bwd_cross_0(dpdirection_2, edge2_0));
}


#line 254
void s_bwd_primal_computeBarycentrics_0(float3 dpv0_2, float3 dpv1_2, float3 dpv2_2, float3 dporigin_3, float3 dpdirection_3, float dpt_0, out float3 dpbarycentrics_1)
{

#line 254
    float3 p_5 = dporigin_3 + dpdirection_3 * dpt_0;

#line 254
    float3 edgep0_0 = dpv0_2 - p_5;

#line 254
    float3 edgep1_0 = dpv1_2 - p_5;

#line 254
    float3 edgep2_0 = dpv2_2 - p_5;

#line 254
    float _S1555 = s_bwd_length_0(s_bwd_cross_0(edgep1_0, edgep2_0));

#line 254
    float _S1556 = s_bwd_length_0(s_bwd_cross_0(edgep2_0, edgep0_0));

#line 254
    float _S1557 = s_bwd_length_0(s_bwd_cross_0(edgep0_0, edgep1_0));

#line 254
    float area_3 = _S1555 + _S1556 + _S1557;

#line 254
    dpbarycentrics_1 = float3(_S1555 / area_3, _S1556 / area_3, _S1557 / area_3);

#line 254
    return;
}


#line 254
float3 s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_1(DifferentiableSceneQuery_0 dpthis_4, GeometryInstanceID_0 instanceID_17, uint triangleID_10, DiffRay_0 dpray_0, out float dpt_1, out float3 dpbarycentrics_2, out float3 dpfaceNormalW_1)
{

#line 269
    float3 _S1558 = (float3)0.0;

#line 269
    float3 _S1559 = _S1558;

#line 269
    float3 _S1560 = _S1558;

#line 269
    float3 _S1561 = _S1558;

#line 269
    s_bwd_FalcorSceneIO_loadVertexPositionsW_0(dpthis_4.gradientFlags_1, instanceID_17, triangleID_10, _S1559, _S1560, _S1561, dpray_0.pixel_1);

#line 269
    float _S1562 = s_bwd_primal_computeDistanceToTriangle_0(_S1559, _S1560, _S1561, dpray_0.origin_2, dpray_0.direction_1);

#line 269
    float3 _S1563 = _S1558;

#line 269
    s_bwd_primal_computeBarycentrics_0(_S1559, _S1560, _S1561, dpray_0.origin_2, dpray_0.direction_1, _S1562, _S1563);

#line 269
    float3 posW_12 = _S1559 * _S1563.x + _S1560 * _S1563.y + _S1561 * _S1563.z;

#line 269
    float3 _S1564 = s_bwd_normalize_0(s_bwd_cross_0(_S1560 - _S1559, _S1561 - _S1559));

#line 269
    dpt_1 = _S1562;

#line 269
    dpbarycentrics_2 = _S1563;

#line 269
    dpfaceNormalW_1 = _S1564;

#line 269
    return posW_12;
}


#line 269
IntersectionInfo_0 s_bwd_primal_DifferentiableSceneQuery_loadIntersectionInfo_0(DifferentiableSceneQuery_0 dpthis_5, HitInfo_0 hitInfo_2, DiffRay_0 dpray_1, int mode_3, out s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _s_diff_ctx_6)
{

#line 198
    float3 _S1565 = (float3)0.0;

#line 198
    GeometryInstanceID_0 _S1566 = { 0U };

#line 198
    GeometryHit_0 _S1567 = { _S1566, 0U, (float2)0.0 };

#line 198
    TriangleHit_0 _S1568 = { _S1567 };

#line 198
    _s_diff_ctx_6._S1549 = _S1565;

#line 198
    _s_diff_ctx_6.hit_10 = _S1568;

#line 198
    _s_diff_ctx_6._S1549 = _S1565;

#line 198
    TriangleHit_0 hit_11 = HitInfo_getTriangleHit_0(hitInfo_2);

#line 198
    _s_diff_ctx_6.hit_10 = hit_11;

#line 198
    IntersectionInfo_0 info_2 = s_bwd_primal_IntersectionInfo_x24init_0();

#line 198
    info_2.triangleID_2 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
    info_2.instanceID_7 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
    if(mode_3 == int(0))
    {

#line 198
        float _S1569 = 0.0;

#line 198
        float3 _S1570 = _S1565;

#line 198
        float3 _S1571 = _S1565;

#line 198
        float3 _S1572 = s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_1(dpthis_5, hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, dpray_1, _S1569, _S1570, _S1571);

#line 198
        info_2.triangleID_2 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
        info_2.instanceID_7 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
        info_2.barycentrics_2 = _S1570;

#line 198
        info_2.normalW_2 = _S1571;

#line 198
        info_2.posW_5 = _S1572;

#line 198
        info_2.hitT_5 = _S1569;

#line 198
    }
    else
    {

#line 198
        if(mode_3 == int(1))
        {

#line 198
            float3 _S1573 = GeometryHit_getBarycentricWeights_0(hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit);

#line 198
            _s_diff_ctx_6._S1549 = _S1573;

#line 198
            float3 _S1574 = _S1565;

#line 198
            float3 _S1575 = s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_0(dpthis_5, hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S1573, _S1574, dpray_1.pixel_1);

#line 198
            float _S1576 = s_bwd_length_0(_S1575 - dpray_1.origin_2);

#line 198
            info_2.triangleID_2 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
            info_2.instanceID_7 = hit_11._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
            info_2.barycentrics_2 = _S1573;

#line 198
            info_2.normalW_2 = _S1574;

#line 198
            info_2.posW_5 = _S1575;

#line 198
            info_2.hitT_5 = _S1576;

#line 198
        }
        else
        {

#line 198
        }

#line 198
    }

#line 198
    info_2.normalW_2 = s_bwd_primal_DifferentiableSceneQuery_computeShadingNormal_0(dpthis_5, info_2.instanceID_7, info_2.triangleID_2, info_2.barycentrics_2);

#line 198
    return info_2;
}


#line 198
bool s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(DifferentiableSceneQuery_0 dpthis_6, DiffRay_0 dprayData_0, out IntersectionInfo_0 dpisectInfo_0, int mode_4, out s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _s_diff_ctx_7)
{

#line 144
    uint4 _S1577 = (uint4)0U;

#line 144
    HitInfo_0 _S1578 = { _S1577 };

#line 144
    _s_diff_ctx_7._S1548 = _S1578;

#line 144
    _s_diff_ctx_7.isHit_1 = false;

#line 144
    float3 _S1579 = (float3)0.0;

#line 144
    GeometryInstanceID_0 _S1580 = { 0U };

#line 144
    GeometryHit_0 _S1581 = { _S1580, 0U, (float2)0.0 };

#line 144
    TriangleHit_0 _S1582 = { _S1581 };

#line 144
    _s_diff_ctx_7._S1548.data_4 = _S1577;

#line 144
    Ray_0 _S1583 = { dprayData_0.origin_2, 0.0, dprayData_0.direction_1, 340282346638528859811704183484516925440.0 };

#line 144
    HitInfo_0 _S1584 = HitInfo_x24init_0();

#line 144
    float _S1585 = 0.0;

#line 144
    HitInfo_0 _S1586 = _S1584;

#line 144
    bool _S1587 = SceneRayQuery_traceRay_0(_S1583, _S1586, _S1585, 0U, 255U);

#line 144
    _s_diff_ctx_7.isHit_1 = _S1587;

#line 144
    _s_diff_ctx_7._S1548 = _S1586;

#line 144
    HitInfo_0 hitInfo_3 = _S1586;

#line 163
    bool _S1588 = !_S1587;

#line 163
    IntersectionInfo_0 _S1589;

#line 163
    if(_S1588)
    {

#line 163
        _S1589 = s_bwd_primal_IntersectionInfo_x24init_0();

#line 163
    }
    else
    {

#line 163
        _S1589.triangleID_2 = 0U;

#line 163
        _S1589.instanceID_7 = _S1580;

#line 163
        _S1589.barycentrics_2 = _S1579;

#line 163
        _S1589.normalW_2 = _S1579;

#line 163
        _S1589.posW_5 = _S1579;

#line 163
        _S1589.hitT_5 = 0.0;

#line 163
    }

#line 163
    bool _S1590 = !_S1588;

#line 163
    if(_S1590)
    {

#line 163
        s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _S1591;

#line 163
        _S1591._S1549 = _S1579;

#line 163
        _S1591.hit_10 = _S1582;

#line 163
        IntersectionInfo_0 _S1592 = s_bwd_primal_DifferentiableSceneQuery_loadIntersectionInfo_0(dpthis_6, hitInfo_3, dprayData_0, mode_4, _S1591);

#line 163
        _S1589 = _S1592;

#line 163
    }
    else
    {

#line 163
    }

#line 163
    dpisectInfo_0 = _S1589;

#line 163
    return _S1590;
}


#line 523 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
ShadingData_0 prepareShadingData_0(StructuredBuffer<MaterialDataBlob_0 > _S1593, SamplerState  _S1594[int(256)], Texture2D<float4 >  _S1595[int(49)], ByteAddressBuffer  _S1596[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S1597, StructuredBuffer<NetworkParamStorageFP32_0 > _S1598, StructuredBuffer<int > _S1599, VertexData_0 _S1600, uint _S1601, float3 _S1602, ExplicitLodTextureSampler_0 _S1603)
{

#line 82 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
    float3 _S1604 = float3(0.0, 0.0, 0.0);

#line 82
    float2 _S1605 = float2(0.0, 0.0);

#line 82
    ShadingFrame_0 _S1606 = { _S1604, _S1604, _S1604 };

#line 82
    float4 _S1607 = float4(0.0, 0.0, 0.0, 0.0);

#line 43 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
    uint2 _S1608 = uint2(0U, 0U);

#line 82 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
    MaterialHeader_0 _S1609 = { _S1608 };

#line 82
    ShadingData_0 sd_9;

#line 82
    sd_9.posW_10 = _S1604;

#line 82
    sd_9.V_1 = _S1604;

#line 82
    sd_9.uv_3 = _S1605;

#line 82
    sd_9.frame_1 = _S1606;

#line 82
    sd_9.faceN_0 = _S1604;

#line 82
    sd_9.tangentW_3 = _S1607;

#line 82
    sd_9.frontFacing_0 = false;

#line 82
    sd_9.curveRadius_2 = 0.0;

#line 82
    sd_9.normalCurvature_0 = 0.0;

#line 82
    sd_9.mtl_0 = _S1609;

#line 82
    sd_9.materialID_6 = 0U;

#line 82
    sd_9.opacity_0 = 0.0;

#line 82
    sd_9.IoR_2 = 0.0;

#line 82
    sd_9.geometryGradOffset_0 = 0U;

#line 82
    sd_9.materialGradOffset_0 = 0U;

#line 82
    sd_9.threadID_0 = 0U;

    sd_9.posW_10 = _S1600.posW_4;
    sd_9.uv_3 = _S1600.texC_0;
    sd_9.V_1 = _S1602;



    bool valid_4;
    ShadingFrame_0 _S1610 = ShadingFrame_createSafe_0(_S1600.normalW_1, _S1600.tangentW_0, valid_4);

#line 91
    sd_9.frame_1 = _S1610;

#line 91
    float4 _S1611;
    if(valid_4)
    {

#line 92
        _S1611 = _S1600.tangentW_0;

#line 92
    }
    else
    {

#line 92
        _S1611 = float4(sd_9.frame_1.T_1, 1.0);

#line 92
    }

#line 92
    sd_9.tangentW_3 = _S1611;


    sd_9.faceN_0 = _S1600.faceNormalW_0;
    sd_9.frontFacing_0 = dot(sd_9.V_1, _S1600.faceNormalW_0) >= 0.0;
    sd_9.curveRadius_2 = _S1600.curveRadius_1;


    MaterialDataBlob_0 m_0 = _S1593[_S1601];

    sd_9.mtl_0 = m_0.header_0;
    sd_9.materialID_6 = _S1601;



    sd_9.IoR_2 = 1.0;

#line 107
    Tuple_1 _S1612 = { uint2(0U, 0U), _S1608, packAnyValue16_0(_S1603) };

#line 113
    sd_9.opacity_0 = _S766(getMaterial_0(_S1593, _S1594, _S1595, _S1596, _S1597, _S1598, _S1599, _S1601), _S1593, _S1594, _S1595, _S1596, _S1597, _S1598, _S1599, _S1600, _S1612);

    return sd_9;
}


#line 115
ShadingData_0 loadShadingData_0(HitInfo_0 _S1613, float3 _S1614, float3 _S1615, ExplicitLodTextureSampler_0 _S1616)
{

#line 159 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float3 _S1617 = float3(0.0, 0.0, 0.0);

#line 159
    float4 _S1618 = float4(0.0, 0.0, 0.0, 0.0);

#line 159
    float2 _S1619 = float2(0.0, 0.0);

#line 159
    VertexData_0 v_6;

#line 159
    uint materialID_7;


    if(HitInfo_getType_0(_S1613) == 1U)
    {
        TriangleHit_0 triangleHit_1 = HitInfo_getTriangleHit_0(_S1613);

#line 164
        uint _S1620 = Scene_getMaterialID_0(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, triangleHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2);

#line 164
        v_6 = Scene_getVertexData_2(gScene_rtAccel_0, gScene_worldMatrices_0, gScene_inverseTransposeWorldMatrices_0, gScene_prevWorldMatrices_0, gScene_prevInverseTransposeWorldMatrices_0, gScene_geometryInstances_0, gScene_meshes_0, gScene_vertices_0, gScene_prevVertices_0, gScene_indexData_0, gScene_curves_0, gScene_curveVertices_0, gScene_prevCurveVertices_0, gScene_curveIndices_0, gScene_proceduralPrimitiveAABBs_0, gScene_customPrimitives_0, gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, gScene_lights_0, gScene_lightCollection_triangleData_0, gScene_lightCollection_activeTriangles_0, gScene_lightCollection_triToActiveMapping_0, gScene_lightCollection_fluxData_0, gScene_lightCollection_meshData_0, gScene_lightCollection_perMeshInstanceOffset_0, gScene_lightProfile_texture_0, gScene_lightProfile_sampler_0, gScene_envMap_envMap_0, gScene_envMap_envSampler_0, gScene_gridVolumes_0, gScene_grids_buf_0, gScene_grids_rangeTex_0, gScene_grids_indirectionTex_0, gScene_grids_atlasTex_0, triangleHit_1);

#line 164
        materialID_7 = _S1620;

#line 164
    }
    else
    {

#line 164
        v_6.posW_4 = _S1617;

#line 164
        v_6.normalW_1 = _S1617;

#line 164
        v_6.tangentW_0 = _S1618;

#line 164
        v_6.texC_0 = _S1619;

#line 164
        v_6.faceNormalW_0 = _S1617;

#line 164
        v_6.curveRadius_1 = 0.0;

#line 164
        v_6.coneTexLODValue_0 = 0.0;

#line 164
        materialID_7 = 0U;

#line 164
    }

#line 171
    return prepareShadingData_0(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, v_6, materialID_7, - _S1615, _S1616);
}


#line 47 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IMaterialInstance.slang"
bool isNormalMappingEnabled_0(uint hints_0)
{
    return !bool(hints_0 & 1U);
}


#line 102 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/BasicMaterialData.slang"
int BasicMaterialData_getNormalMapType_0(BasicMaterialData_0 this_56)
{

#line 102
    return int(this_56.flags_4 >> 1U & 3U);
}


#line 39 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
float3 rgbToNormal_0(float3 rgb_1)
{
    return rgb_1 * 2.0 - 1.0;
}



float3 rgToNormal_0(float2 rg_0)
{
    float3 n_1;
    n_1.xy = rg_0 * 2.0 - 1.0;


    n_1[int(2)] = saturate(dot(rg_0, rg_0));
    n_1[int(2)] = sqrt(1.0 - n_1.z);
    return n_1;
}


#line 114 "C:/Falcor/build/python-3.8/bin/Release/shaders/Utils/Math/ShadingFrame.slang"
void ShadingFrame_orthonormalize_0(inout ShadingFrame_0 this_57, float4 tangentW_4)
{
    float3 _S1621 = tangentW_4.xyz;

#line 116
    float3 _S1622 = normalize(_S1621 - this_57.N_2 * dot(_S1621, this_57.N_2));

#line 116
    this_57.T_1 = _S1622;
    this_57.B_1 = cross(this_57.N_2, _S1622) * tangentW_4.w;
    return;
}


#line 47
ShadingFrame_0 ShadingFrame_x24init_0(float3 normalW_6, float4 tangentW_5)
{

#line 47
    ShadingFrame_0 _S1623;

    _S1623.N_2 = normalize(normalW_6);
    ShadingFrame_orthonormalize_0(_S1623, tangentW_5);

#line 47
    return _S1623;
}


#line 82 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
ShadingFrame_0 computeShadingFrameFromNormalMap_0(ShadingData_0 sd_10, int type_2, float3 encodedNormal_0)
{

    float3 _S1624 = float3(0.0, 0.0, 1.0);

#line 85
    float3 mapN_0;
    switch(type_2)
    {
    case int(1):
        {

#line 86
            mapN_0 = rgbToNormal_0(encodedNormal_0);

#line 86
            break;
        }
    case int(2):
        {

#line 86
            mapN_0 = rgToNormal_0(encodedNormal_0.xy);

#line 86
            break;
        }
    case int(0):
        {

#line 95
            return sd_10.frame_1;
        }
    default:
        {

#line 95
            mapN_0 = _S1624;

#line 95
            break;
        }
    }

#line 103
    return ShadingFrame_x24init_0(ShadingFrame_fromLocal_0(sd_10.frame_1, mapN_0), sd_10.tangentW_3);
}


#line 130 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialData.slang"
bool MaterialHeader_isDoubleSided_0(MaterialHeader_0 this_58)
{

#line 130
    return bool(this_58.packedData_0.x & 268435456U);
}


#line 110 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
void flipShadingNormal_0(ShadingData_0 sd_11, inout ShadingFrame_0 sf_5)
{
    if(!sd_11.frontFacing_0 && MaterialHeader_isDoubleSided_0(sd_11.mtl_0))
    {
        sf_5.N_2 = - sf_5.N_2;

#line 112
    }
    else
    {

#line 112
    }



    return;
}


#line 52 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/IMaterialInstance.slang"
bool isAdjustShadingNormalEnabled_0(uint hints_1)
{
    return bool(hints_1 & 2U);
}


#line 100 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/ShadingData.slang"
float3 ShadingData_getOrientedFaceNormal_0(ShadingData_0 this_59)
{

#line 100
    float3 _S1625;

    if(this_59.frontFacing_0)
    {

#line 102
        _S1625 = this_59.faceN_0;

#line 102
    }
    else
    {

#line 102
        _S1625 = - this_59.faceN_0;

#line 102
    }

#line 102
    return _S1625;
}


#line 123 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/ShadingUtils.slang"
void adjustShadingNormal_0(ShadingData_0 sd_12, inout ShadingFrame_0 sf_6)
{

#line 129
    float3 Ng_0 = ShadingData_getOrientedFaceNormal_0(sd_12);

#line 129
    float signN_0;
    if(dot(sf_6.N_2, Ng_0) >= 0.0)
    {

#line 130
        signN_0 = 1.0;

#line 130
    }
    else
    {

#line 130
        signN_0 = -1.0;

#line 130
    }
    float3 Ns_0 = signN_0 * sf_6.N_2;

#line 141
    float3 R_0 = reflect(- sd_12.V_1, Ns_0);
    float a_5 = dot(Ng_0, R_0);
    if(a_5 < 0.0)
    {

        sf_6 = ShadingFrame_x24init_0(signN_0 * (sd_12.V_1 + normalize(R_0 - Ns_0 * a_5 / max(0.00100000004749745131, dot(Ns_0, Ng_0)))), sd_12.tangentW_3);

#line 143
    }
    else
    {

#line 143
    }

#line 159
    return;
}


#line 159
PBRTDiffuseMaterialInstance_0 PBRTDiffuseMaterial_setupMaterialInstance_0(PBRTDiffuseMaterial_0 _S1626, StructuredBuffer<MaterialDataBlob_0 > _S1627, SamplerState  _S1628[int(256)], Texture2D<float4 >  _S1629[int(49)], ByteAddressBuffer  _S1630[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S1631, StructuredBuffer<NetworkParamStorageFP32_0 > _S1632, StructuredBuffer<int > _S1633, ShadingData_0 _S1634, Tuple_1 _S1635, uint _S1636)
{

#line 83 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/PBRT/PBRTDiffuseMaterial.slang"
    uint _S1637 = MaterialHeader_getDefaultTextureSamplerID_0(_S1626._S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1);

    float3 baseColor_1 = MaterialSystem_sampleTexture_0(_S1627, _S1628, _S1629, _S1630, _S1631, _S1632, _S1633, _S1626.data_5.texBaseColor_0, _S1628[_S1637], _S1634.uv_3, float4(_S1626.data_5.baseColor_0), _S1635.value2_1, _S1635.value0_1, _S1635.value1_1).xyz;


    ShadingFrame_0 sf_7 = _S1634.frame_1;
    if(isNormalMappingEnabled_0(_S1636))
    {

        sf_7 = computeShadingFrameFromNormalMap_0(_S1634, BasicMaterialData_getNormalMapType_0(_S1626.data_5), MaterialSystem_sampleTexture_0(_S1627, _S1628, _S1629, _S1630, _S1631, _S1632, _S1633, _S1626.data_5.texNormalMap_0, _S1628[_S1637], _S1634.uv_3, (float4)0.0, _S1635.value2_1, _S1635.value0_1, _S1635.value1_1).xyz);

#line 89
    }
    else
    {

#line 89
    }

#line 94
    flipShadingNormal_0(_S1634, sf_7);
    if(isAdjustShadingNormalEnabled_0(_S1636))
    {
        adjustShadingNormal_0(_S1634, sf_7);

#line 95
    }
    else
    {

#line 95
    }

#line 100
    PBRTDiffuseBSDF_0 _S1638 = { baseColor_1 };

#line 100
    PBRTDiffuseMaterialInstance_0 mi_0 = { sf_7, _S1638 };

    return mi_0;
}


#line 102
AnyValue128 packAnyValue128_1(PBRTDiffuseMaterialInstance_0 _S1639)
{

#line 102
    AnyValue128 _S1640;

#line 102
    _S1640.field0_1 = 0U;

#line 102
    _S1640.field1_1 = 0U;

#line 102
    _S1640.field2_1 = 0U;

#line 102
    _S1640.field3_1 = 0U;

#line 102
    _S1640.field4_1 = 0U;

#line 102
    _S1640.field5_1 = 0U;

#line 102
    _S1640.field6_1 = 0U;

#line 102
    _S1640.field7_1 = 0U;

#line 102
    _S1640.field8_1 = 0U;

#line 102
    _S1640.field9_1 = 0U;

#line 102
    _S1640.field10_1 = 0U;

#line 102
    _S1640.field11_1 = 0U;

#line 102
    _S1640.field12_1 = 0U;

#line 102
    _S1640.field13_1 = 0U;

#line 102
    _S1640.field14_1 = 0U;

#line 102
    _S1640.field15_1 = 0U;

#line 102
    _S1640.field16_1 = 0U;

#line 102
    _S1640.field17_1 = 0U;

#line 102
    _S1640.field18_1 = 0U;

#line 102
    _S1640.field19_1 = 0U;

#line 102
    _S1640.field20_1 = 0U;

#line 102
    _S1640.field21_1 = 0U;

#line 102
    _S1640.field22_1 = 0U;

#line 102
    _S1640.field23_1 = 0U;

#line 102
    _S1640.field24_1 = 0U;

#line 102
    _S1640.field25_1 = 0U;

#line 102
    _S1640.field26_1 = 0U;

#line 102
    _S1640.field27_1 = 0U;

#line 102
    _S1640.field28_1 = 0U;

#line 102
    _S1640.field29_1 = 0U;

#line 102
    _S1640.field30_0 = 0U;

#line 102
    _S1640.field31_0 = 0U;

#line 102
    _S1640.field0_1 = (uint)(asuint(_S1639.sf_1.T_1[int(0)]));

#line 102
    _S1640.field1_1 = (uint)(asuint(_S1639.sf_1.T_1[int(1)]));

#line 102
    _S1640.field2_1 = (uint)(asuint(_S1639.sf_1.T_1[int(2)]));

#line 102
    _S1640.field3_1 = (uint)(asuint(_S1639.sf_1.B_1[int(0)]));

#line 102
    _S1640.field4_1 = (uint)(asuint(_S1639.sf_1.B_1[int(1)]));

#line 102
    _S1640.field5_1 = (uint)(asuint(_S1639.sf_1.B_1[int(2)]));

#line 102
    _S1640.field6_1 = (uint)(asuint(_S1639.sf_1.N_2[int(0)]));

#line 102
    _S1640.field7_1 = (uint)(asuint(_S1639.sf_1.N_2[int(1)]));

#line 102
    _S1640.field8_1 = (uint)(asuint(_S1639.sf_1.N_2[int(2)]));

#line 102
    _S1640.field9_1 = (uint)(asuint(_S1639.bsdf_0.albedo_1[int(0)]));

#line 102
    _S1640.field10_1 = (uint)(asuint(_S1639.bsdf_0.albedo_1[int(1)]));

#line 102
    _S1640.field11_1 = (uint)(asuint(_S1639.bsdf_0.albedo_1[int(2)]));

#line 102
    return _S1640;
}


#line 62 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Scene.slang"

float kDiffuseAlbedoMultiplier_0_init()
{

#line 62
    return 1.0;
}
static float kDiffuseAlbedoMultiplier_0 = kDiffuseAlbedoMultiplier_0_init();


#line 53 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterialInstance.slang"
StandardMaterialInstance_0 StandardMaterialInstance_x24init_0(ShadingFrame_0 sf_8, StandardBSDFData_0 data_10, float3 emission_2)
{

#line 53
    StandardMaterialInstance_0 _S1641;

    _S1641.sf_2 = sf_8;
    _S1641.data_7 = data_10;
    _S1641.emission_1 = emission_2;

#line 53
    return _S1641;
}


#line 53
StandardMaterialInstance_0 StandardMaterial_setupMaterialInstance_0(StandardMaterial_0 _S1642, StructuredBuffer<MaterialDataBlob_0 > _S1643, SamplerState  _S1644[int(256)], Texture2D<float4 >  _S1645[int(49)], ByteAddressBuffer  _S1646[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S1647, StructuredBuffer<NetworkParamStorageFP32_0 > _S1648, StructuredBuffer<int > _S1649, ShadingData_0 _S1650, Tuple_1 _S1651, uint _S1652)
{

#line 175 "C:/Falcor/build/python-3.8/bin/Release/shaders/Rendering/Materials/StandardMaterial.slang"
    uint _S1653 = MaterialHeader_getDefaultTextureSamplerID_0(_S1642._S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase.header_1);

    float3 _S1654 = float3(0.0, 0.0, 0.0);

#line 177
    StandardBSDFData_0 d_4;

#line 177
    d_4.diffuse_0 = _S1654;

#line 177
    d_4.specular_1 = _S1654;

#line 177
    d_4.roughness_1 = 0.0;

#line 177
    d_4.metallic_0 = 0.0;

#line 177
    d_4.eta_0 = 0.0;

#line 177
    d_4.transmission_1 = _S1654;

#line 177
    d_4.diffuseTransmission_1 = 0.0;

#line 177
    d_4.specularTransmission_1 = 0.0;

#line 177
    float _S1655;

    if(_S1650.frontFacing_0)
    {

#line 179
        _S1655 = _S1650.IoR_2 / float(_S1642.data_6.IoR_1);

#line 179
    }
    else
    {

#line 179
        _S1655 = float(_S1642.data_6.IoR_1) / _S1650.IoR_2;

#line 179
    }

#line 179
    d_4.eta_0 = _S1655;
    d_4.diffuseTransmission_1 = float(_S1642.data_6.diffuseTransmission_0);
    float _S1656 = float(_S1642.data_6.specularTransmission_0);

#line 181
    d_4.specularTransmission_1 = _S1656;
    if(d_4.diffuseTransmission_1 > 0.0 || _S1656 > 0.0)
    {
        d_4.transmission_1 = MaterialSystem_sampleTexture_0(_S1643, _S1644, _S1645, _S1646, _S1647, _S1648, _S1649, _S1642.data_6.texTransmission_0, _S1644[_S1653], _S1650.uv_3, float4(float3(_S1642.data_6.transmission_0), 0.0), _S1651.value2_1, _S1651.value0_1, _S1651.value1_1).xyz;

#line 182
    }
    else
    {

#line 182
    }

#line 189
    float f_0 = (float(_S1642.data_6.IoR_1) - 1.0) / (float(_S1642.data_6.IoR_1) + 1.0);
    float F0_0 = f_0 * f_0;


    float3 baseColor_2 = MaterialSystem_sampleTexture_0(_S1643, _S1644, _S1645, _S1646, _S1647, _S1648, _S1649, _S1642.data_6.texBaseColor_0, _S1644[_S1653], _S1650.uv_3, float4(_S1642.data_6.baseColor_0), _S1651.value2_1, _S1651.value0_1, _S1651.value1_1).xyz;

#line 193
    float4 _S1657 = MaterialSystem_sampleTexture_0(_S1643, _S1644, _S1645, _S1646, _S1647, _S1648, _S1649, _S1642.data_6.texSpecular_0, _S1644[_S1653], _S1650.uv_3, float4(_S1642.data_6.specular_0), _S1651.value2_1, _S1651.value0_1, _S1651.value1_1);

#line 204
    float _S1658 = _S1657.z;

#line 204
    float3 _S1659 = (float3)_S1658;

#line 204
    d_4.diffuse_0 = lerp(baseColor_2, (float3)0.0, _S1659);
    d_4.specular_1 = lerp((float3)F0_0, baseColor_2, _S1659);
    d_4.roughness_1 = _S1657.y;
    d_4.metallic_0 = _S1658;

#line 220
    if(kDiffuseAlbedoMultiplier_0 != 1.0)
    {
        d_4.diffuse_0 = saturate(d_4.diffuse_0 * kDiffuseAlbedoMultiplier_0);

#line 220
    }
    else
    {

#line 220
    }

#line 226
    ShadingFrame_0 sf_9 = _S1650.frame_1;
    if(isNormalMappingEnabled_0(_S1652))
    {

        sf_9 = computeShadingFrameFromNormalMap_0(_S1650, BasicMaterialData_getNormalMapType_0(_S1642.data_6), MaterialSystem_sampleTexture_0(_S1643, _S1644, _S1645, _S1646, _S1647, _S1648, _S1649, _S1642.data_6.texNormalMap_0, _S1644[_S1653], _S1650.uv_3, (float4)0.0, _S1651.value2_1, _S1651.value0_1, _S1651.value1_1).xyz);

#line 227
    }
    else
    {

#line 227
    }

#line 232
    flipShadingNormal_0(_S1650, sf_9);
    if(isAdjustShadingNormalEnabled_0(_S1652))
    {
        adjustShadingNormal_0(_S1650, sf_9);

#line 233
    }
    else
    {

#line 233
    }

#line 233
    float3 emission_3;

#line 242
    if(_S1650.frontFacing_0)
    {

#line 242
        emission_3 = MaterialSystem_sampleTexture_0(_S1643, _S1644, _S1645, _S1646, _S1647, _S1648, _S1649, _S1642.data_6.texEmissive_0, _S1644[_S1653], _S1650.uv_3, float4(_S1642.data_6.emissive_0, 1.0), _S1651.value2_1, _S1651.value0_1, _S1651.value1_1).xyz * _S1642.data_6.emissiveFactor_0;

#line 242
    }
    else
    {

#line 242
        emission_3 = _S1654;

#line 242
    }

#line 247
    return StandardMaterialInstance_x24init_0(sf_9, d_4, emission_3);
}


#line 247
AnyValue128 packAnyValue128_2(StandardMaterialInstance_0 _S1660)
{

#line 247
    AnyValue128 _S1661;

#line 247
    _S1661.field0_1 = 0U;

#line 247
    _S1661.field1_1 = 0U;

#line 247
    _S1661.field2_1 = 0U;

#line 247
    _S1661.field3_1 = 0U;

#line 247
    _S1661.field4_1 = 0U;

#line 247
    _S1661.field5_1 = 0U;

#line 247
    _S1661.field6_1 = 0U;

#line 247
    _S1661.field7_1 = 0U;

#line 247
    _S1661.field8_1 = 0U;

#line 247
    _S1661.field9_1 = 0U;

#line 247
    _S1661.field10_1 = 0U;

#line 247
    _S1661.field11_1 = 0U;

#line 247
    _S1661.field12_1 = 0U;

#line 247
    _S1661.field13_1 = 0U;

#line 247
    _S1661.field14_1 = 0U;

#line 247
    _S1661.field15_1 = 0U;

#line 247
    _S1661.field16_1 = 0U;

#line 247
    _S1661.field17_1 = 0U;

#line 247
    _S1661.field18_1 = 0U;

#line 247
    _S1661.field19_1 = 0U;

#line 247
    _S1661.field20_1 = 0U;

#line 247
    _S1661.field21_1 = 0U;

#line 247
    _S1661.field22_1 = 0U;

#line 247
    _S1661.field23_1 = 0U;

#line 247
    _S1661.field24_1 = 0U;

#line 247
    _S1661.field25_1 = 0U;

#line 247
    _S1661.field26_1 = 0U;

#line 247
    _S1661.field27_1 = 0U;

#line 247
    _S1661.field28_1 = 0U;

#line 247
    _S1661.field29_1 = 0U;

#line 247
    _S1661.field30_0 = 0U;

#line 247
    _S1661.field31_0 = 0U;

#line 247
    _S1661.field0_1 = (uint)(asuint(_S1660.sf_2.T_1[int(0)]));

#line 247
    _S1661.field1_1 = (uint)(asuint(_S1660.sf_2.T_1[int(1)]));

#line 247
    _S1661.field2_1 = (uint)(asuint(_S1660.sf_2.T_1[int(2)]));

#line 247
    _S1661.field3_1 = (uint)(asuint(_S1660.sf_2.B_1[int(0)]));

#line 247
    _S1661.field4_1 = (uint)(asuint(_S1660.sf_2.B_1[int(1)]));

#line 247
    _S1661.field5_1 = (uint)(asuint(_S1660.sf_2.B_1[int(2)]));

#line 247
    _S1661.field6_1 = (uint)(asuint(_S1660.sf_2.N_2[int(0)]));

#line 247
    _S1661.field7_1 = (uint)(asuint(_S1660.sf_2.N_2[int(1)]));

#line 247
    _S1661.field8_1 = (uint)(asuint(_S1660.sf_2.N_2[int(2)]));

#line 247
    _S1661.field9_1 = (uint)(asuint(_S1660.data_7.diffuse_0[int(0)]));

#line 247
    _S1661.field10_1 = (uint)(asuint(_S1660.data_7.diffuse_0[int(1)]));

#line 247
    _S1661.field11_1 = (uint)(asuint(_S1660.data_7.diffuse_0[int(2)]));

#line 247
    _S1661.field12_1 = (uint)(asuint(_S1660.data_7.specular_1[int(0)]));

#line 247
    _S1661.field13_1 = (uint)(asuint(_S1660.data_7.specular_1[int(1)]));

#line 247
    _S1661.field14_1 = (uint)(asuint(_S1660.data_7.specular_1[int(2)]));

#line 247
    _S1661.field15_1 = (uint)(asuint(_S1660.data_7.roughness_1));

#line 247
    _S1661.field16_1 = (uint)(asuint(_S1660.data_7.metallic_0));

#line 247
    _S1661.field17_1 = (uint)(asuint(_S1660.data_7.eta_0));

#line 247
    _S1661.field18_1 = (uint)(asuint(_S1660.data_7.transmission_1[int(0)]));

#line 247
    _S1661.field19_1 = (uint)(asuint(_S1660.data_7.transmission_1[int(1)]));

#line 247
    _S1661.field20_1 = (uint)(asuint(_S1660.data_7.transmission_1[int(2)]));

#line 247
    _S1661.field21_1 = (uint)(asuint(_S1660.data_7.diffuseTransmission_1));

#line 247
    _S1661.field22_1 = (uint)(asuint(_S1660.data_7.specularTransmission_1));

#line 247
    _S1661.field23_1 = (uint)(asuint(_S1660.emission_1[int(0)]));

#line 247
    _S1661.field24_1 = (uint)(asuint(_S1660.emission_1[int(1)]));

#line 247
    _S1661.field25_1 = (uint)(asuint(_S1660.emission_1[int(2)]));

#line 247
    return _S1661;
}


#line 247
AnyValue128 _S1662(Tuple_0 _S1663, StructuredBuffer<MaterialDataBlob_0 > _S1664, SamplerState  _S1665[int(256)], Texture2D<float4 >  _S1666[int(49)], ByteAddressBuffer  _S1667[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S1668, StructuredBuffer<NetworkParamStorageFP32_0 > _S1669, StructuredBuffer<int > _S1670, ShadingData_0 _S1671, Tuple_1 _S1672, uint _S1673)
{

#line 247
    switch(_S1663.value1_0.x)
    {
    case 6U:
        {

#line 247
            return packAnyValue128_1(PBRTDiffuseMaterial_setupMaterialInstance_0(unpackAnyValue128_0(_S1663.value2_0), _S1664, _S1665, _S1666, _S1667, _S1668, _S1669, _S1670, _S1671, _S1672, _S1673));
        }
    default:
        {

#line 247
            return packAnyValue128_2(StandardMaterial_setupMaterialInstance_0(unpackAnyValue128_1(_S1663.value2_0), _S1664, _S1665, _S1666, _S1667, _S1668, _S1669, _S1670, _S1671, _S1672, _S1673));
        }
    }

#line 247
}


#line 247
Tuple_0 getMaterialInstance_0(StructuredBuffer<MaterialDataBlob_0 > _S1674, SamplerState  _S1675[int(256)], Texture2D<float4 >  _S1676[int(49)], ByteAddressBuffer  _S1677[int(1)], StructuredBuffer<NetworkParamStorageFP16_0 > _S1678, StructuredBuffer<NetworkParamStorageFP32_0 > _S1679, StructuredBuffer<int > _S1680, ShadingData_0 _S1681, ExplicitLodTextureSampler_0 _S1682, uint _S1683)
{

#line 247
    Tuple_0 _S1684 = getMaterial_0(_S1674, _S1675, _S1676, _S1677, _S1678, _S1679, _S1680, _S1681.materialID_6);

#line 247
    Tuple_1 _S1685 = { uint2(0U, 0U), uint2(0U, 0U), packAnyValue16_0(_S1682) };

#line 247
    Tuple_0 _S1686 = { uint2(0U, 0U), U_SR35Rendering_2FxMaterials_2FxIMaterial9IMaterial16MaterialInstanceIR43Rendering_2FxMaterials_2FxIMaterialInstance17IMaterialInstance_0(_S1684.value1_0), _S1662(_S1684, _S1674, _S1675, _S1676, _S1677, _S1678, _S1679, _S1680, _S1681, _S1685, _S1683) };

#line 70 "C:/Falcor/build/python-3.8/bin/Release/shaders/Scene/Material/MaterialFactory.slang"
    return _S1686;
}


#line 70
float3 s_bwd_dsq_computeRayOrigin_0(float3 _S1687, float3 _S1688)
{

#line 70
    return dsq_computeRayOrigin_0(_S1687, _S1688);
}


#line 392 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
bool s_bwd_primal_s_fwd_traceAsymptoticWeightedMeanIntersection_1(DiffPair_DifferentiableSceneQuery_0 dpdpquery_2, float kappa_3, uint2 globalPixel_3, float3 baseDirection_1, DiffPair_float3_0 dpdporigin_4, DiffPair_array_float3_0 dpdpdirection_5, out DiffPair_array_float3_0 dpdpwarpedPoint_1, inout UniformSampleGenerator_0 sg_21, out s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _s_diff_ctx_8)
{

#line 382
    DiffPair_float_0 _S1689 = { 0.0, 0.0 };

#line 382
    DiffPair_float_0  _S1690[int(18)] = { _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689, _S1689 };

#line 382
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1691 = { 0.0 };

#line 382
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1692[int(18)] = { _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691, _S1691 };

#line 382
    float3 _S1693 = (float3)0.0;

#line 382
    float3  _S1694[int(18)] = { _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693, _S1693 };

#line 382
    int  _S1695[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 382
    float3  _S1696[int(3)] = { _S1693, _S1693, _S1693 };

#line 382
    float  _S1697[int(3)] = { 0.0, 0.0, 0.0 };

#line 382
    float  _S1698[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 382
    _s_diff_ctx_8._S1047 = _S1690;

#line 382
    _s_diff_ctx_8._S1048 = _S1692;

#line 382
    _s_diff_ctx_8._S1049 = _S1690;

#line 382
    _s_diff_ctx_8._S1050 = _S1692;

#line 382
    _s_diff_ctx_8._S1051 = _S1690;

#line 382
    _s_diff_ctx_8._S1052 = _S1692;

#line 382
    _s_diff_ctx_8._S1053 = _S1694;

#line 382
    _s_diff_ctx_8._S1054 = _S1694;

#line 382
    _s_diff_ctx_8._S1055 = int(0);

#line 382
    _s_diff_ctx_8._S1056 = _S1695;

#line 382
    _s_diff_ctx_8._S1057 = _S1696;

#line 382
    _s_diff_ctx_8._S1058 = _S1696;

#line 382
    _s_diff_ctx_8._S1059 = _S1697;

#line 382
    _s_diff_ctx_8._S1060 = _S1697;

#line 382
    _s_diff_ctx_8._S1061 = int(0);

#line 382
    _s_diff_ctx_8._S1062 = _S1698;

#line 382
    _s_diff_ctx_8._S1063 = _S1695;

#line 382
    HitInfo_0 _S1699 = { (uint4)0U };

#line 382
    _s_diff_ctx_8._S1047[int(0)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(1)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(2)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(3)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(4)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(5)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(6)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(7)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(8)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(9)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(10)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(11)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(12)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(13)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(14)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(15)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(16)] = _S1689;

#line 382
    _s_diff_ctx_8._S1047[int(17)] = _S1689;

#line 382
    _s_diff_ctx_8._S1048[int(0)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(1)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(2)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(3)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(4)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(5)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(6)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(7)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(8)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(9)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(10)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(11)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(12)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(13)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(14)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(15)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(16)] = _S1691;

#line 382
    _s_diff_ctx_8._S1048[int(17)] = _S1691;

#line 382
    _s_diff_ctx_8._S1049[int(0)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(1)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(2)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(3)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(4)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(5)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(6)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(7)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(8)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(9)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(10)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(11)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(12)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(13)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(14)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(15)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(16)] = _S1689;

#line 382
    _s_diff_ctx_8._S1049[int(17)] = _S1689;

#line 382
    _s_diff_ctx_8._S1050[int(0)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(1)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(2)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(3)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(4)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(5)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(6)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(7)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(8)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(9)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(10)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(11)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(12)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(13)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(14)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(15)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(16)] = _S1691;

#line 382
    _s_diff_ctx_8._S1050[int(17)] = _S1691;

#line 382
    _s_diff_ctx_8._S1051[int(0)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(1)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(2)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(3)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(4)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(5)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(6)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(7)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(8)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(9)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(10)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(11)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(12)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(13)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(14)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(15)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(16)] = _S1689;

#line 382
    _s_diff_ctx_8._S1051[int(17)] = _S1689;

#line 382
    _s_diff_ctx_8._S1052[int(0)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(1)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(2)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(3)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(4)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(5)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(6)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(7)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(8)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(9)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(10)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(11)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(12)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(13)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(14)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(15)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(16)] = _S1691;

#line 382
    _s_diff_ctx_8._S1052[int(17)] = _S1691;

#line 382
    _s_diff_ctx_8._S1053[int(0)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(1)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(2)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(3)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(4)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(5)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(6)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(7)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(8)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(9)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(10)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(11)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(12)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(13)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(14)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(15)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(16)] = _S1693;

#line 382
    _s_diff_ctx_8._S1053[int(17)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(0)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(1)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(2)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(3)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(4)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(5)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(6)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(7)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(8)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(9)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(10)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(11)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(12)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(13)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(14)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(15)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(16)] = _S1693;

#line 382
    _s_diff_ctx_8._S1054[int(17)] = _S1693;

#line 382
    _s_diff_ctx_8._S1055 = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(0)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(1)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(2)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(3)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(4)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(5)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(6)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(7)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(8)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(9)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(10)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(11)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(12)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(13)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(14)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(15)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(16)] = int(0);

#line 382
    _s_diff_ctx_8._S1056[int(17)] = int(0);

#line 382
    _s_diff_ctx_8._S1057[int(0)] = _S1693;

#line 382
    _s_diff_ctx_8._S1057[int(1)] = _S1693;

#line 382
    _s_diff_ctx_8._S1057[int(2)] = _S1693;

#line 382
    _s_diff_ctx_8._S1058[int(0)] = _S1693;

#line 382
    _s_diff_ctx_8._S1058[int(1)] = _S1693;

#line 382
    _s_diff_ctx_8._S1058[int(2)] = _S1693;

#line 382
    _s_diff_ctx_8._S1059[int(0)] = 0.0;

#line 382
    _s_diff_ctx_8._S1059[int(1)] = 0.0;

#line 382
    _s_diff_ctx_8._S1059[int(2)] = 0.0;

#line 382
    _s_diff_ctx_8._S1060[int(0)] = 0.0;

#line 382
    _s_diff_ctx_8._S1060[int(1)] = 0.0;

#line 382
    _s_diff_ctx_8._S1060[int(2)] = 0.0;

#line 382
    _s_diff_ctx_8._S1061 = int(0);

#line 382
    _s_diff_ctx_8._S1062[int(0)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(1)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(2)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(3)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(4)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(5)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(6)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(7)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(8)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(9)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(10)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(11)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(12)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(13)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(14)] = 0.0;

#line 382
    _s_diff_ctx_8._S1062[int(15)] = 0.0;

#line 382
    _s_diff_ctx_8._S1063[int(0)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(1)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(2)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(3)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(4)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(5)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(6)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(7)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(8)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(9)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(10)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(11)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(12)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(13)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(14)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(15)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(16)] = int(0);

#line 382
    _s_diff_ctx_8._S1063[int(17)] = int(0);

#line 382
    UniformSampleGenerator_0 _S1700 = sg_21;

#line 382
    float3 _S1701 = float3(0.0, 0.0, 0.0);

#line 382
    float3  _S1702[int(3)] = { _S1701, _S1701, _S1701 };

#line 382
    DiffPair_float3_0 _S1703 = { dpdporigin_4.primal_0, dpdporigin_4.differential_0 };

#line 382
    DiffPair_DifferentiableSceneQuery_0 _S1704 = { dpdpquery_2.primal_0, dpdpquery_2.differential_0 };

#line 382
    GeometryInstanceID_0 _S1705 = { 0U };

#line 382
    IntersectionInfo_0 _S1706 = { 0U, _S1705, _S1693, _S1693, _S1693, 0.0 };

#line 382
    s_diff_s_diff_IntersectionInfo_0 _S1707 = { _S1693, _S1693, _S1693, 0.0 };

#line 382
    DiffPair_float3_0 _S1708 = { dpdpdirection_5.primal_0[int(0)], dpdpdirection_5.differential_0[int(0)] };

#line 382
    DiffPair_float3_0 _S1709 = { dpdpdirection_5.primal_0[int(1)], dpdpdirection_5.differential_0[int(1)] };

#line 382
    DiffPair_float3_0 _S1710 = { dpdpdirection_5.primal_0[int(2)], dpdpdirection_5.differential_0[int(2)] };

#line 382
    DiffPair_float_0 _S1711 = { 0.00000000999999993923, 0.0 };

#line 382
    int _S1712;

#line 382
    bool _bflag_1 = true;

#line 382
    int i_2 = int(0);

#line 382
    UniformSampleGenerator_0 _S1713 = sg_21;

#line 382
    float  rnd_1[int(16)];

#line 382
    rnd_1[int(0)] = 0.0;

#line 382
    rnd_1[int(1)] = 0.0;

#line 382
    rnd_1[int(2)] = 0.0;

#line 382
    rnd_1[int(3)] = 0.0;

#line 382
    rnd_1[int(4)] = 0.0;

#line 382
    rnd_1[int(5)] = 0.0;

#line 382
    rnd_1[int(6)] = 0.0;

#line 382
    rnd_1[int(7)] = 0.0;

#line 382
    rnd_1[int(8)] = 0.0;

#line 382
    rnd_1[int(9)] = 0.0;

#line 382
    rnd_1[int(10)] = 0.0;

#line 382
    rnd_1[int(11)] = 0.0;

#line 382
    rnd_1[int(12)] = 0.0;

#line 382
    rnd_1[int(13)] = 0.0;

#line 382
    rnd_1[int(14)] = 0.0;

#line 382
    rnd_1[int(15)] = 0.0;

#line 382
    float  s_diff_rnd_1[int(16)];

#line 382
    s_diff_rnd_1[int(0)] = 0.0;

#line 382
    s_diff_rnd_1[int(1)] = 0.0;

#line 382
    s_diff_rnd_1[int(2)] = 0.0;

#line 382
    s_diff_rnd_1[int(3)] = 0.0;

#line 382
    s_diff_rnd_1[int(4)] = 0.0;

#line 382
    s_diff_rnd_1[int(5)] = 0.0;

#line 382
    s_diff_rnd_1[int(6)] = 0.0;

#line 382
    s_diff_rnd_1[int(7)] = 0.0;

#line 382
    s_diff_rnd_1[int(8)] = 0.0;

#line 382
    s_diff_rnd_1[int(9)] = 0.0;

#line 382
    s_diff_rnd_1[int(10)] = 0.0;

#line 382
    s_diff_rnd_1[int(11)] = 0.0;

#line 382
    s_diff_rnd_1[int(12)] = 0.0;

#line 382
    s_diff_rnd_1[int(13)] = 0.0;

#line 382
    s_diff_rnd_1[int(14)] = 0.0;

#line 382
    s_diff_rnd_1[int(15)] = 0.0;

#line 382
    int _pc_1 = int(0);

#line 382
    for(;;)
    {

#line 382
        _s_diff_ctx_8._S1061 = _pc_1;

#line 382
        _s_diff_ctx_8._S1062 = rnd_1;

#line 382
        _s_diff_ctx_8._S1063[_pc_1] = _S1712;

#line 382
        if(_bflag_1)
        {
        }
        else
        {

#line 382
            break;
        }

#line 382
        bool _S1714 = i_2 < int(16);

#line 382
        int _S1715;

#line 382
        if(_S1714)
        {

#line 382
            _S1715 = _S1712;

#line 382
        }
        else
        {

#line 382
            _S1715 = int(1);

#line 382
        }

#line 382
        UniformSampleGenerator_0 _S1716;

#line 382
        if(_S1714)
        {

#line 382
            UniformSampleGenerator_0 _S1717 = _S1713;

#line 382
            float _S1718 = sampleNext1D_0(_S1717);

#line 382
            _S1716 = _S1717;

#line 382
            float  _S1719[int(16)] = rnd_1;

#line 382
            _S1719[i_2] = _S1718;

#line 382
            float  _S1720[int(16)] = s_diff_rnd_1;

#line 382
            _S1720[i_2] = 0.0;

#line 382
            _S1712 = int(2);

#line 382
            rnd_1 = _S1719;

#line 382
            s_diff_rnd_1 = _S1720;

#line 382
        }
        else
        {

#line 382
            _S1712 = _S1715;

#line 382
        }

#line 382
        if(_S1712 != int(2))
        {

#line 382
            _bflag_1 = false;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        if(_bflag_1)
        {

#line 382
            i_2 = i_2 + int(1);

#line 382
            _S1713 = _S1716;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        _pc_1 = _pc_1 + int(1);

#line 382
    }

#line 382
    _bflag_1 = true;

#line 382
    uint i_3 = 0U;

#line 382
    float  totalWeight_3[int(3)];

#line 382
    totalWeight_3[int(0)] = 0.0;

#line 382
    totalWeight_3[int(1)] = 0.0;

#line 382
    totalWeight_3[int(2)] = 0.0;

#line 382
    float  s_diff_totalWeight_3[int(3)];

#line 382
    s_diff_totalWeight_3[int(0)] = 0.0;

#line 382
    s_diff_totalWeight_3[int(1)] = 0.0;

#line 382
    s_diff_totalWeight_3[int(2)] = 0.0;

#line 382
    float3  totalWarpedPoint_3[int(3)];

#line 382
    totalWarpedPoint_3[int(0)] = _S1701;

#line 382
    totalWarpedPoint_3[int(1)] = _S1701;

#line 382
    totalWarpedPoint_3[int(2)] = _S1701;

#line 382
    float3  s_diff_totalWarpedPoint_3[int(3)];

#line 382
    s_diff_totalWarpedPoint_3[int(0)] = _S1701;

#line 382
    s_diff_totalWarpedPoint_3[int(1)] = _S1701;

#line 382
    s_diff_totalWarpedPoint_3[int(2)] = _S1701;

#line 382
    i_2 = _S1712;

#line 382
    _pc_1 = int(0);

#line 382
    for(;;)
    {

#line 382
        _s_diff_ctx_8._S1055 = _pc_1;

#line 382
        _s_diff_ctx_8._S1056[_pc_1] = i_2;

#line 382
        _s_diff_ctx_8._S1057 = s_diff_totalWarpedPoint_3;

#line 382
        _s_diff_ctx_8._S1058 = totalWarpedPoint_3;

#line 382
        _s_diff_ctx_8._S1059 = s_diff_totalWeight_3;

#line 382
        _s_diff_ctx_8._S1060 = totalWeight_3;

#line 382
        if(_bflag_1)
        {
        }
        else
        {

#line 382
            break;
        }

#line 382
        bool _S1721 = i_3 < 16U;

#line 382
        if(_S1721)
        {

#line 382
            _S1712 = i_2;

#line 382
        }
        else
        {

#line 382
            _S1712 = int(1);

#line 382
        }

#line 382
        float  totalWeight_4[int(3)];

#line 382
        float  s_diff_totalWeight_4[int(3)];

#line 382
        float3  totalWarpedPoint_4[int(3)];

#line 382
        float3  s_diff_totalWarpedPoint_4[int(3)];

#line 382
        if(_S1721)
        {

#line 382
            uint _S1722 = i_3 / 2U * 2U;

#line 382
            uint _S1723 = _S1722 + 1U;

#line 382
            float  _S1724[int(16)] = rnd_1;

#line 382
            float3 _S1725 = sampleVonMisesFisher_0(baseDirection_1, kappa_3, float2(rnd_1[_S1722], rnd_1[_S1723]));

#line 382
            _s_diff_ctx_8._S1054[_pc_1] = _S1725;

#line 382
            float3 auxDir_1;

#line 382
            if(i_3 % 2U != 0U)
            {

#line 382
                float3 _S1726 = _reflect_0(- _S1725, baseDirection_1);

#line 382
                _s_diff_ctx_8._S1053[_pc_1] = _S1726;

#line 382
                auxDir_1 = _S1726;

#line 382
            }
            else
            {

#line 382
                auxDir_1 = _S1725;

#line 382
            }

#line 382
            DiffPair_float3_0 _S1727 = { auxDir_1, _S1693 };

#line 382
            DiffPair_DiffRay_0 _S1728 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S1703, _S1727, globalPixel_3);

#line 382
            DiffPair_DiffRay_0 _S1729 = { _S1728.primal_0, _S1728.differential_0 };

#line 382
            DiffPair_IntersectionInfo_0 _S1730;

#line 382
            _S1730.primal_0 = _S1706;

#line 382
            _S1730.differential_0 = _S1707;

#line 382
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S1731;

#line 382
            _S1731._S1199 = _S1699;

#line 382
            _S1731.isHit_0 = false;

#line 382
            bool _S1732 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S1704, _S1729, _S1730, int(1), _S1731);

#line 382
            DiffPair_IntersectionInfo_0 _S1733 = _S1730;

#line 382
            if(_S1732)
            {

#line 382
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1734;

#line 382
                _S1734.boundaryTerm_0 = 0.0;

#line 382
                DiffPair_float_0 _S1735 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S1733.primal_0, dpdporigin_4.primal_0, auxDir_1, _S1724[_S1723], kappa_3, _S1708, _S1734);

#line 382
                _s_diff_ctx_8._S1051[_pc_1] = _S1735;

#line 382
                _s_diff_ctx_8._S1052[_pc_1] = _S1734;

#line 382
                if(_S1735.primal_0 > 0.0)
                {

#line 382
                    float _S1736 = totalWeight_3[int(0)] + _S1735.primal_0;

#line 382
                    float _S1737 = s_diff_totalWeight_3[int(0)] + _S1735.differential_0;

#line 382
                    totalWeight_4 = totalWeight_3;

#line 382
                    totalWeight_4[int(0)] = _S1736;

#line 382
                    s_diff_totalWeight_4 = s_diff_totalWeight_3;

#line 382
                    s_diff_totalWeight_4[int(0)] = _S1737;

#line 382
                    float3 _S1738 = (float3)_S1735.primal_0;

#line 382
                    float3 _S1739 = totalWarpedPoint_3[int(0)] + _S1738 * _S1733.primal_0.posW_5;

#line 382
                    float3 _S1740 = s_diff_totalWarpedPoint_3[int(0)] + ((float3)_S1735.differential_0 * _S1733.primal_0.posW_5 + _S1733.differential_0.posW_2 * _S1738);

#line 382
                    totalWarpedPoint_4 = totalWarpedPoint_3;

#line 382
                    totalWarpedPoint_4[int(0)] = _S1739;

#line 382
                    s_diff_totalWarpedPoint_4 = s_diff_totalWarpedPoint_3;

#line 382
                    s_diff_totalWarpedPoint_4[int(0)] = _S1740;

#line 382
                }
                else
                {

#line 382
                    totalWeight_4 = totalWeight_3;

#line 382
                    s_diff_totalWeight_4 = s_diff_totalWeight_3;

#line 382
                    totalWarpedPoint_4 = totalWarpedPoint_3;

#line 382
                    s_diff_totalWarpedPoint_4 = s_diff_totalWarpedPoint_3;

#line 382
                }

#line 382
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1741;

#line 382
                _S1741.boundaryTerm_0 = 0.0;

#line 382
                DiffPair_float_0 _S1742 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S1733.primal_0, dpdporigin_4.primal_0, auxDir_1, _S1724[_S1723], kappa_3, _S1709, _S1741);

#line 382
                _s_diff_ctx_8._S1049[_pc_1] = _S1742;

#line 382
                _s_diff_ctx_8._S1050[_pc_1] = _S1741;

#line 382
                float  totalWeight_5[int(3)];

#line 382
                float  s_diff_totalWeight_5[int(3)];

#line 382
                float3  totalWarpedPoint_5[int(3)];

#line 382
                float3  s_diff_totalWarpedPoint_5[int(3)];

#line 382
                if(_S1742.primal_0 > 0.0)
                {

#line 382
                    float _S1743 = totalWeight_4[int(1)] + _S1742.primal_0;

#line 382
                    float _S1744 = s_diff_totalWeight_4[int(1)] + _S1742.differential_0;

#line 382
                    totalWeight_5 = totalWeight_4;

#line 382
                    totalWeight_5[int(1)] = _S1743;

#line 382
                    s_diff_totalWeight_5 = s_diff_totalWeight_4;

#line 382
                    s_diff_totalWeight_5[int(1)] = _S1744;

#line 382
                    float3 _S1745 = (float3)_S1742.primal_0;

#line 382
                    float3 _S1746 = totalWarpedPoint_4[int(1)] + _S1745 * _S1733.primal_0.posW_5;

#line 382
                    float3 _S1747 = s_diff_totalWarpedPoint_4[int(1)] + ((float3)_S1742.differential_0 * _S1733.primal_0.posW_5 + _S1733.differential_0.posW_2 * _S1745);

#line 382
                    totalWarpedPoint_5 = totalWarpedPoint_4;

#line 382
                    totalWarpedPoint_5[int(1)] = _S1746;

#line 382
                    s_diff_totalWarpedPoint_5 = s_diff_totalWarpedPoint_4;

#line 382
                    s_diff_totalWarpedPoint_5[int(1)] = _S1747;

#line 382
                }
                else
                {

#line 382
                    totalWeight_5 = totalWeight_4;

#line 382
                    s_diff_totalWeight_5 = s_diff_totalWeight_4;

#line 382
                    totalWarpedPoint_5 = totalWarpedPoint_4;

#line 382
                    s_diff_totalWarpedPoint_5 = s_diff_totalWarpedPoint_4;

#line 382
                }

#line 382
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1748;

#line 382
                _S1748.boundaryTerm_0 = 0.0;

#line 382
                DiffPair_float_0 _S1749 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S1733.primal_0, dpdporigin_4.primal_0, auxDir_1, _S1724[_S1723], kappa_3, _S1710, _S1748);

#line 382
                _s_diff_ctx_8._S1047[_pc_1] = _S1749;

#line 382
                _s_diff_ctx_8._S1048[_pc_1] = _S1748;

#line 382
                float  totalWeight_6[int(3)];

#line 382
                float  s_diff_totalWeight_6[int(3)];

#line 382
                float3  totalWarpedPoint_6[int(3)];

#line 382
                float3  s_diff_totalWarpedPoint_6[int(3)];

#line 382
                if(_S1749.primal_0 > 0.0)
                {

#line 382
                    float _S1750 = totalWeight_5[int(2)] + _S1749.primal_0;

#line 382
                    float _S1751 = s_diff_totalWeight_5[int(2)] + _S1749.differential_0;

#line 382
                    totalWeight_6 = totalWeight_5;

#line 382
                    totalWeight_6[int(2)] = _S1750;

#line 382
                    s_diff_totalWeight_6 = s_diff_totalWeight_5;

#line 382
                    s_diff_totalWeight_6[int(2)] = _S1751;

#line 382
                    float3 _S1752 = (float3)_S1749.primal_0;

#line 382
                    float3 _S1753 = totalWarpedPoint_5[int(2)] + _S1752 * _S1733.primal_0.posW_5;

#line 382
                    float3 _S1754 = s_diff_totalWarpedPoint_5[int(2)] + ((float3)_S1749.differential_0 * _S1733.primal_0.posW_5 + _S1733.differential_0.posW_2 * _S1752);

#line 382
                    totalWarpedPoint_6 = totalWarpedPoint_5;

#line 382
                    totalWarpedPoint_6[int(2)] = _S1753;

#line 382
                    s_diff_totalWarpedPoint_6 = s_diff_totalWarpedPoint_5;

#line 382
                    s_diff_totalWarpedPoint_6[int(2)] = _S1754;

#line 382
                }
                else
                {

#line 382
                    totalWeight_6 = totalWeight_5;

#line 382
                    s_diff_totalWeight_6 = s_diff_totalWeight_5;

#line 382
                    totalWarpedPoint_6 = totalWarpedPoint_5;

#line 382
                    s_diff_totalWarpedPoint_6 = s_diff_totalWarpedPoint_5;

#line 382
                }

#line 382
                totalWeight_4 = totalWeight_6;

#line 382
                s_diff_totalWeight_4 = s_diff_totalWeight_6;

#line 382
                totalWarpedPoint_4 = totalWarpedPoint_6;

#line 382
                s_diff_totalWarpedPoint_4 = s_diff_totalWarpedPoint_6;

#line 382
            }
            else
            {

#line 382
                totalWeight_4 = totalWeight_3;

#line 382
                s_diff_totalWeight_4 = s_diff_totalWeight_3;

#line 382
                totalWarpedPoint_4 = totalWarpedPoint_3;

#line 382
                s_diff_totalWarpedPoint_4 = s_diff_totalWarpedPoint_3;

#line 382
            }

#line 382
            i_2 = int(2);

#line 382
        }
        else
        {

#line 382
            i_2 = _S1712;

#line 382
            totalWeight_4 = totalWeight_3;

#line 382
            s_diff_totalWeight_4 = s_diff_totalWeight_3;

#line 382
            totalWarpedPoint_4 = totalWarpedPoint_3;

#line 382
            s_diff_totalWarpedPoint_4 = s_diff_totalWarpedPoint_3;

#line 382
        }

#line 382
        if(i_2 != int(2))
        {

#line 382
            _bflag_1 = false;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        if(_bflag_1)
        {

#line 382
            i_3 = i_3 + 1U;

#line 382
        }
        else
        {

#line 382
        }

#line 382
        int _S1755 = _pc_1 + int(1);

#line 382
        totalWeight_3 = totalWeight_4;

#line 382
        s_diff_totalWeight_3 = s_diff_totalWeight_4;

#line 382
        totalWarpedPoint_3 = totalWarpedPoint_4;

#line 382
        s_diff_totalWarpedPoint_3 = s_diff_totalWarpedPoint_4;

#line 382
        _pc_1 = _S1755;

#line 382
    }

#line 382
    float  _S1756[int(3)] = totalWeight_3;

#line 382
    float  _S1757[int(3)] = s_diff_totalWeight_3;

#line 382
    bool _S1758 = totalWeight_3[int(0)] == 0.0;

#line 382
    UniformSampleGenerator_0 _S1759;

#line 382
    DiffPair_array_float3_0 _S1760;

#line 382
    if(_S1758)
    {

#line 382
        _S1760.primal_0 = _S1702;

#line 382
        _S1760.differential_0 = _S1702;

#line 382
        _S1759 = _S1713;

#line 382
    }
    else
    {

#line 382
        _S1760.primal_0 = _S1696;

#line 382
        _S1760.differential_0 = _S1696;

#line 382
        _S1759 = _S1700;

#line 382
    }

#line 382
    bool _S1761 = !_S1758;

#line 382
    if(_S1761)
    {

#line 382
        DiffPair_float_0 _S1762 = { _S1756[int(0)], _S1757[int(0)] };

#line 382
        DiffPair_float_0 _S1763 = s_bwd_primal_d_max_0(_S1762, _S1711);

#line 382
        float3 _S1764 = (float3)_S1763.primal_0;

#line 382
        DiffPair_float_0 _S1765 = { totalWeight_3[int(1)], s_diff_totalWeight_3[int(1)] };

#line 382
        DiffPair_float_0 _S1766 = s_bwd_primal_d_max_0(_S1765, _S1711);

#line 382
        float3 _S1767 = (float3)_S1766.primal_0;

#line 382
        DiffPair_float_0 _S1768 = { totalWeight_3[int(2)], s_diff_totalWeight_3[int(2)] };

#line 382
        DiffPair_float_0 _S1769 = s_bwd_primal_d_max_0(_S1768, _S1711);

#line 382
        float3 _S1770 = (float3)_S1769.primal_0;

#line 382
        float3  _S1771[int(3)] = { totalWarpedPoint_3[int(0)] / _S1764, totalWarpedPoint_3[int(1)] / _S1767, totalWarpedPoint_3[int(2)] / _S1770 };

#line 382
        float3  _S1772[int(3)] = { (s_diff_totalWarpedPoint_3[int(0)] * _S1764 - totalWarpedPoint_3[int(0)] * (float3)_S1763.differential_0) / (_S1764 * _S1764), (s_diff_totalWarpedPoint_3[int(1)] * _S1767 - totalWarpedPoint_3[int(1)] * (float3)_S1766.differential_0) / (_S1767 * _S1767), (s_diff_totalWarpedPoint_3[int(2)] * _S1770 - totalWarpedPoint_3[int(2)] * (float3)_S1769.differential_0) / (_S1770 * _S1770) };

#line 382
        _S1760.primal_0 = _S1771;

#line 382
        _S1760.differential_0 = _S1772;

#line 382
    }
    else
    {

#line 382
        _S1713 = _S1759;

#line 382
    }

#line 382
    sg_21 = _S1713;

#line 382
    dpdpwarpedPoint_1 = _S1760;

#line 382
    return _S1761;
}


#line 382
void s_bwd_primal_s_fwd_computeWarpedRay_0(DiffPair_DifferentiableSceneQuery_0 dpdpquery_3, float kappa_4, uint2 globalPixel_4, DiffPair_float3_0 dpdporigin_5, DiffPair_float3_0 dpdpbaseDirection_0, DiffPair_array_float3_0 dpdpdirection_6, out DiffPair_array_float3_0 dpdpwarpedDirection_0, inout UniformSampleGenerator_0 sg_22, out s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _s_diff_ctx_9)
{

#line 515
    DiffPair_float_0 _S1773 = { 0.0, 0.0 };

#line 515
    DiffPair_float_0  _S1774[int(18)] = { _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773, _S1773 };

#line 515
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1775 = { 0.0 };

#line 515
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1776[int(18)] = { _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775, _S1775 };

#line 515
    float3 _S1777 = (float3)0.0;

#line 515
    float3  _S1778[int(18)] = { _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777, _S1777 };

#line 515
    int  _S1779[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 515
    float3  _S1780[int(3)] = { _S1777, _S1777, _S1777 };

#line 515
    float  _S1781[int(3)] = { 0.0, 0.0, 0.0 };

#line 515
    float  _S1782[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 515
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1783 = { _S1774, _S1776, _S1774, _S1776, _S1774, _S1776, _S1778, _S1778, int(0), _S1779, _S1780, _S1780, _S1781, _S1781, int(0), _S1782, _S1779 };

#line 515
    DiffPair_array_float3_0 _S1784 = { _S1780, _S1780 };

#line 515
    uint  _S1785[int(4)] = { 0U, 0U, 0U, 0U };

#line 515
    Xoshiro128StarStar_0 _S1786 = { _S1785 };

#line 515
    UniformSampleGenerator_0 _S1787 = { _S1786 };

#line 515
    _s_diff_ctx_9._S1064 = _S1783;

#line 515
    _s_diff_ctx_9._S1065 = _S1784;

#line 515
    _s_diff_ctx_9._S1066 = _S1787;

#line 515
    _s_diff_ctx_9._S1067 = false;

#line 515
    _s_diff_ctx_9._S1065.primal_0 = _S1780;

#line 515
    _s_diff_ctx_9._S1065.differential_0 = _S1780;

#line 515
    _s_diff_ctx_9._S1066.rng_0 = _S1786;

#line 515
    DiffPair_DifferentiableSceneQuery_0 _S1788 = { dpdpquery_3.primal_0, dpdpquery_3.differential_0 };

#line 515
    DiffPair_float3_0 _S1789 = { dpdporigin_5.primal_0, dpdporigin_5.differential_0 };

#line 515
    DiffPair_array_float3_0 _S1790 = { dpdpdirection_6.primal_0, dpdpdirection_6.differential_0 };

#line 515
    UniformSampleGenerator_0 _S1791 = sg_22;

#line 515
    DiffPair_array_float3_0 _S1792;

#line 515
    _S1792.primal_0 = _S1780;

#line 515
    _S1792.differential_0 = _S1780;

#line 515
    bool _S1793 = s_bwd_primal_s_fwd_traceAsymptoticWeightedMeanIntersection_1(_S1788, kappa_4, globalPixel_4, dpdpbaseDirection_0.primal_0, _S1789, _S1790, _S1792, _S1791, _s_diff_ctx_9._S1064);

#line 515
    _s_diff_ctx_9._S1067 = _S1793;

#line 515
    _s_diff_ctx_9._S1065 = _S1792;

#line 515
    _s_diff_ctx_9._S1066 = _S1791;

#line 515
    DiffPair_array_float3_0 _S1794 = _S1792;

#line 515
    UniformSampleGenerator_0 _S1795 = _S1791;

#line 515
    float3  _S1796[int(3)];

#line 515
    float3  _S1797[int(3)];

#line 515
    if(_S1793)
    {

#line 515
        DiffPair_float3_0 _S1798 = { _S1794.primal_0[int(0)] - dpdporigin_5.primal_0, _S1794.differential_0[int(0)] - dpdporigin_5.differential_0 };

#line 515
        DiffPair_float3_0 _S1799 = s_bwd_primal_s_fwd_safeNormalize_0(_S1798);

#line 515
        DiffPair_float3_0 _S1800 = { _S1794.primal_0[int(1)] - dpdporigin_5.primal_0, _S1794.differential_0[int(1)] - dpdporigin_5.differential_0 };

#line 515
        DiffPair_float3_0 _S1801 = s_bwd_primal_s_fwd_safeNormalize_0(_S1800);

#line 515
        DiffPair_float3_0 _S1802 = { _S1794.primal_0[int(2)] - dpdporigin_5.primal_0, _S1794.differential_0[int(2)] - dpdporigin_5.differential_0 };

#line 515
        DiffPair_float3_0 _S1803 = s_bwd_primal_s_fwd_safeNormalize_0(_S1802);

#line 515
        _S1796[int(0)] = _S1799.primal_0;

#line 515
        _S1796[int(1)] = _S1801.primal_0;

#line 515
        _S1796[int(2)] = _S1803.primal_0;

#line 515
        _S1797[int(0)] = _S1799.differential_0;

#line 515
        _S1797[int(1)] = _S1801.differential_0;

#line 515
        _S1797[int(2)] = _S1803.differential_0;

#line 515
    }
    else
    {

#line 515
        _S1796[int(0)] = _S1777;

#line 515
        _S1796[int(1)] = _S1777;

#line 515
        _S1796[int(2)] = _S1777;

#line 515
        _S1797[int(0)] = _S1777;

#line 515
        _S1797[int(1)] = _S1777;

#line 515
        _S1797[int(2)] = _S1777;

#line 515
    }

#line 515
    sg_22 = _S1795;

#line 515
    dpdpwarpedDirection_0.primal_0 = _S1796;

#line 515
    dpdpwarpedDirection_0.differential_0 = _S1797;

#line 515
    return;
}


#line 515
DiffRay_0 s_bwd_primal_reparameterizeRay_0(DifferentiableSceneQuery_0 dpquery_1, DiffRay_0 dpray_2, inout UniformSampleGenerator_0 sg_23, out float dpweight_1, out s_bwd_reparameterizeRay_Intermediates_0 _s_diff_ctx_10)
{

#line 548
    DiffPair_float_0 _S1804 = { 0.0, 0.0 };

#line 548
    DiffPair_float_0  _S1805[int(18)] = { _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804, _S1804 };

#line 548
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1806 = { 0.0 };

#line 548
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1807[int(18)] = { _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806, _S1806 };

#line 548
    float3 _S1808 = (float3)0.0;

#line 548
    float3  _S1809[int(18)] = { _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808, _S1808 };

#line 548
    int  _S1810[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 548
    float3  _S1811[int(3)] = { _S1808, _S1808, _S1808 };

#line 548
    float  _S1812[int(3)] = { 0.0, 0.0, 0.0 };

#line 548
    float  _S1813[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 548
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1814 = { _S1805, _S1807, _S1805, _S1807, _S1805, _S1807, _S1809, _S1809, int(0), _S1810, _S1811, _S1811, _S1812, _S1812, int(0), _S1813, _S1810 };

#line 548
    DiffPair_array_float3_0 _S1815 = { _S1811, _S1811 };

#line 548
    uint  _S1816[int(4)] = { 0U, 0U, 0U, 0U };

#line 548
    Xoshiro128StarStar_0 _S1817 = { _S1816 };

#line 548
    UniformSampleGenerator_0 _S1818 = { _S1817 };

#line 548
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1819 = { _S1814, _S1815, _S1818, false };

#line 548
    s_diff_s_diff_SceneDerivativeFlags_0 _S1820 = { int(0) };

#line 548
    _s_diff_ctx_10._S1068 = _S1819;

#line 548
    _s_diff_ctx_10._S1069 = _S1815;

#line 548
    _s_diff_ctx_10._S1070 = _S1818;

#line 548
    _s_diff_ctx_10._S1071 = _S1820;

#line 548
    _s_diff_ctx_10._S1069.primal_0 = _S1811;

#line 548
    _s_diff_ctx_10._S1069.differential_0 = _S1811;

#line 548
    _s_diff_ctx_10._S1070.rng_0 = _S1817;

#line 548
    UniformSampleGenerator_0 sgCopy_1 = sg_23;

#line 548
    float3 _S1821 = dpray_2.direction_1;

#line 548
    float3  _S1822[int(3)] = { _S1821, _S1821, _S1821 };

#line 548
    float3  _S1823[int(3)] = { float3(1.0, 0.0, 0.0), float3(0.0, 1.0, 0.0), float3(0.0, 0.0, 1.0) };

#line 548
    DiffPair_array_float3_0 _S1824 = { _S1822, _S1823 };

#line 548
    s_diff_s_diff_SceneDerivativeFlags_0 _S1825 = s_bwd_SceneDerivativeFlags_make_0(int(0));

#line 548
    _s_diff_ctx_10._S1071 = _S1825;

#line 548
    s_diff_s_diff_DifferentiableSceneQuery_0 _S1826 = { _S1825 };

#line 548
    DiffPair_DifferentiableSceneQuery_0 _S1827 = { dpquery_1, _S1826 };

#line 548
    float _S1828 = ReparamCB_0.gVMFConcentration_0;

#line 548
    float3 _S1829 = (float3)0.0;

#line 548
    DiffPair_float3_0 _S1830 = { dpray_2.origin_2, _S1829 };

#line 548
    DiffPair_float3_0 _S1831 = { dpray_2.direction_1, _S1829 };

#line 548
    UniformSampleGenerator_0 _S1832 = sgCopy_1;

#line 548
    DiffPair_array_float3_0 _S1833;

#line 548
    _S1833.primal_0 = _S1811;

#line 548
    _S1833.differential_0 = _S1811;

#line 548
    s_bwd_primal_s_fwd_computeWarpedRay_0(_S1827, _S1828, dpray_2.pixel_1, _S1830, _S1831, _S1824, _S1833, _S1832, _s_diff_ctx_10._S1068);

#line 548
    _s_diff_ctx_10._S1069 = _S1833;

#line 548
    _s_diff_ctx_10._S1070 = _S1832;

#line 548
    matrix<float,int(3),int(3)>  _S1834 = matrix<float,int(3),int(3)> (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

#line 548
    _S1834[int(0)][int(0)] = 1.0;

#line 548
    _S1834[int(1)][int(1)] = 1.0;

#line 548
    _S1834[int(2)][int(2)] = 1.0;

#line 548
    float _S1835 = s_bwd_determinant_1(_S1834);

#line 548
    DiffRay_0 _S1836 = s_bwd_primal_DiffRay_x24init_0(dpray_2.origin_2, dpray_2.direction_1, dpray_2.pixel_1);

#line 548
    sg_23 = sgCopy_1;

#line 548
    dpweight_1 = _S1835;

#line 548
    return _S1836;
}


#line 548
float3 s_bwd_primal_temporaryBsdfEval_0(Tuple_0 mi_1, ShadingData_0 dpsd_0, float3 dpwo_0, float3 dpn_0, out s_bwd_temporaryBsdfEval_Intermediates_0 _s_diff_ctx_11)
{

#line 214 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float3 _S1837 = (float3)0.0;

#line 214
    BSDFProperties_0 _S1838 = { _S1837, 0.0, _S1837, 0U, _S1837, _S1837, _S1837, _S1837, _S1837 };

#line 214
    _s_diff_ctx_11._S1046 = _S1838;

#line 214
    BSDFProperties_0 _S1839 = _S960(mi_1, dpsd_0);

#line 214
    _s_diff_ctx_11._S1046 = _S1839;

#line 214
    return _S1839.diffuseReflectionAlbedo_0 * s_bwd_max_0(0.0, s_bwd_dot_0(dpwo_0, dpn_0)) * 0.31830987334251403809;
}


#line 214
void s_bwd_primal_computeNEE_0(DifferentiableSceneQuery_0 dpsceneQuery_0, ShadingData_0 dpsd_1, Tuple_0 mi_2, IntersectionInfo_0 dpisectInfo_1, LightSample_0 ls_3, uint2 globalPixel_5, inout PathData_0 dppathData_0, inout UniformSampleGenerator_0 sg_24, bool shouldReparameterize_0, out s_bwd_computeNEE_Intermediates_0 _s_diff_ctx_12)
{

#line 302
    float3 _S1840 = (float3)0.0;

#line 302
    uint2 _S1841 = (uint2)0U;

#line 302
    DiffRay_0 _S1842 = { _S1840, _S1840, _S1841 };

#line 302
    BSDFProperties_0 _S1843 = { _S1840, 0.0, _S1840, 0U, _S1840, _S1840, _S1840, _S1840, _S1840 };

#line 302
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1844 = { _S1843 };

#line 302
    DiffPair_float_0 _S1845 = { 0.0, 0.0 };

#line 302
    DiffPair_float_0  _S1846[int(18)] = { _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845, _S1845 };

#line 302
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1847 = { 0.0 };

#line 302
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1848[int(18)] = { _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847, _S1847 };

#line 302
    float3  _S1849[int(18)] = { _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840, _S1840 };

#line 302
    int  _S1850[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 302
    float3  _S1851[int(3)] = { _S1840, _S1840, _S1840 };

#line 302
    float  _S1852[int(3)] = { 0.0, 0.0, 0.0 };

#line 302
    float  _S1853[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 302
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1854 = { _S1846, _S1848, _S1846, _S1848, _S1846, _S1848, _S1849, _S1849, int(0), _S1850, _S1851, _S1851, _S1852, _S1852, int(0), _S1853, _S1850 };

#line 302
    DiffPair_array_float3_0 _S1855 = { _S1851, _S1851 };

#line 302
    uint  _S1856[int(4)] = { 0U, 0U, 0U, 0U };

#line 302
    Xoshiro128StarStar_0 _S1857 = { _S1856 };

#line 302
    UniformSampleGenerator_0 _S1858 = { _S1857 };

#line 302
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1859 = { _S1854, _S1855, _S1858, false };

#line 302
    s_diff_s_diff_SceneDerivativeFlags_0 _S1860 = { int(0) };

#line 302
    s_bwd_reparameterizeRay_Intermediates_0 _S1861 = { _S1859, _S1855, _S1858, _S1860 };

#line 302
    PathData_0 _S1862 = { _S1840, _S1840, 0U, false };

#line 302
    _s_diff_ctx_12._S1082 = _S1844;

#line 302
    _s_diff_ctx_12._S1083 = _S1842;

#line 302
    _s_diff_ctx_12._S1084 = _S1861;

#line 302
    _s_diff_ctx_12._S1085 = 0.0;

#line 302
    _s_diff_ctx_12._S1086 = _S1858;

#line 302
    _s_diff_ctx_12._S1087 = _S1862;

#line 302
    _s_diff_ctx_12._S1088 = _S1840;

#line 302
    _s_diff_ctx_12._S1083.origin_2 = _S1840;

#line 302
    _s_diff_ctx_12._S1083.direction_1 = _S1840;

#line 302
    _s_diff_ctx_12._S1083.pixel_1 = _S1841;

#line 302
    _s_diff_ctx_12._S1085 = 0.0;

#line 302
    _s_diff_ctx_12._S1086.rng_0 = _S1857;

#line 302
    PathData_0 _S1863 = dppathData_0;

#line 302
    _s_diff_ctx_12._S1087 = dppathData_0;

#line 302
    UniformSampleGenerator_0 _S1864 = sg_24;

#line 302
    float3 wo_20 = ls_3.lightPos_0 - dpisectInfo_1.posW_5;

#line 302
    float _S1865 = s_bwd_length_0(wo_20);

#line 302
    float3 wo_21 = wo_20 / _S1865;

#line 302
    float3 thp_2;

#line 302
    if(dpsd_1.frontFacing_0)
    {

#line 302
        thp_2 = dpsd_1.faceN_0;

#line 302
    }
    else
    {

#line 302
        thp_2 = - dpsd_1.faceN_0;

#line 302
    }

#line 302
    DiffRay_0 _S1866 = s_bwd_primal_DiffRay_x24init_0(s_bwd_dsq_computeRayOrigin_0(dpisectInfo_1.posW_5, thp_2), wo_21, globalPixel_5);

#line 302
    DiffRay_0 ray_8;

#line 302
    UniformSampleGenerator_0 _S1867;

#line 302
    if(shouldReparameterize_0)
    {

#line 302
        UniformSampleGenerator_0 _S1868 = _S1864;

#line 302
        float _S1869 = 0.0;

#line 302
        DiffRay_0 _S1870 = s_bwd_primal_reparameterizeRay_0(dpsceneQuery_0, _S1866, _S1868, _S1869, _s_diff_ctx_12._S1084);

#line 302
        _s_diff_ctx_12._S1083 = _S1870;

#line 302
        _s_diff_ctx_12._S1085 = _S1869;

#line 302
        _s_diff_ctx_12._S1086 = _S1868;

#line 302
        float _S1871 = _S1869;

#line 302
        UniformSampleGenerator_0 _S1872 = _S1868;

#line 302
        float _S1873;

#line 302
        if(CB_0.gDisableDivergence_0)
        {

#line 302
            _S1873 = 1.0;

#line 302
        }
        else
        {

#line 302
            _S1873 = _S1871;

#line 302
        }

#line 302
        float3 thp_3 = _S1863.thp_1 * _S1873;

#line 302
        ray_8 = _S1870;

#line 302
        thp_2 = thp_3;

#line 302
        _S1867 = _S1872;

#line 302
    }
    else
    {

#line 302
        ray_8 = _S1866;

#line 302
        thp_2 = _S1863.thp_1;

#line 302
        _S1867 = _S1864;

#line 302
    }

#line 302
    float areaToSolidAngle_0 = _S1865 * _S1865 / s_bwd_dot_0(ls_3.lightNormal_0, - ray_8.direction_1);

#line 302
    float3 _S1874 = s_bwd_primal_temporaryBsdfEval_0(mi_2, dpsd_1, ray_8.direction_1, dpisectInfo_1.normalW_2, _s_diff_ctx_12._S1082);

#line 302
    _s_diff_ctx_12._S1088 = _S1874;

#line 302
    float3 _S1875 = _S1863.radiance_1 + thp_2 * (ls_3.Li_0 * _S1874 * areaToSolidAngle_0 / areaToSolidAngle_0);

#line 302
    PathData_0 _S1876 = _S1863;

#line 302
    _S1876.radiance_1 = _S1875;

#line 302
    sg_24 = _S1867;

#line 302
    dppathData_0 = _S1876;

#line 302
    return;
}


#line 240
bool s_bwd_primal_generateScatterRay_0(DifferentiableSceneQuery_0 dpsceneQuery_1, ShadingData_0 dpsd_2, Tuple_0 mi_3, IntersectionInfo_0 dpisectInfo_2, inout DiffRay_0 dpray_3, inout PathData_0 dppathData_1, inout UniformSampleGenerator_0 sg_25, bool shouldReparameterize_1, out s_bwd_generateScatterRay_Intermediates_0 _s_diff_ctx_13)
{

#line 229
    float3 _S1877 = (float3)0.0;

#line 229
    uint2 _S1878 = (uint2)0U;

#line 229
    DiffRay_0 _S1879 = { _S1877, _S1877, _S1878 };

#line 229
    BSDFProperties_0 _S1880 = { _S1877, 0.0, _S1877, 0U, _S1877, _S1877, _S1877, _S1877, _S1877 };

#line 229
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1881 = { _S1880 };

#line 229
    DiffPair_float_0 _S1882 = { 0.0, 0.0 };

#line 229
    DiffPair_float_0  _S1883[int(18)] = { _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882, _S1882 };

#line 229
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1884 = { 0.0 };

#line 229
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1885[int(18)] = { _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884, _S1884 };

#line 229
    float3  _S1886[int(18)] = { _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877, _S1877 };

#line 229
    int  _S1887[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 229
    float3  _S1888[int(3)] = { _S1877, _S1877, _S1877 };

#line 229
    float  _S1889[int(3)] = { 0.0, 0.0, 0.0 };

#line 229
    float  _S1890[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 229
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1891 = { _S1883, _S1885, _S1883, _S1885, _S1883, _S1885, _S1886, _S1886, int(0), _S1887, _S1888, _S1888, _S1889, _S1889, int(0), _S1890, _S1887 };

#line 229
    DiffPair_array_float3_0 _S1892 = { _S1888, _S1888 };

#line 229
    uint  _S1893[int(4)] = { 0U, 0U, 0U, 0U };

#line 229
    Xoshiro128StarStar_0 _S1894 = { _S1893 };

#line 229
    UniformSampleGenerator_0 _S1895 = { _S1894 };

#line 229
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1896 = { _S1891, _S1892, _S1895, false };

#line 229
    s_diff_s_diff_SceneDerivativeFlags_0 _S1897 = { int(0) };

#line 229
    s_bwd_reparameterizeRay_Intermediates_0 _S1898 = { _S1896, _S1892, _S1895, _S1897 };

#line 229
    BSDFSample_0 _S1899 = { _S1877, 0.0, _S1877, 0U };

#line 229
    PathData_0 _S1900 = { _S1877, _S1877, 0U, false };

#line 229
    _s_diff_ctx_13._S1072 = _S1877;

#line 229
    _s_diff_ctx_13._S1073 = _S1881;

#line 229
    _s_diff_ctx_13._S1074 = _S1879;

#line 229
    _s_diff_ctx_13._S1075 = _S1898;

#line 229
    _s_diff_ctx_13._S1076 = 0.0;

#line 229
    _s_diff_ctx_13._S1077 = _S1895;

#line 229
    _s_diff_ctx_13._S1078 = _S1899;

#line 229
    _s_diff_ctx_13._S1079 = _S1879;

#line 229
    _s_diff_ctx_13._S1080 = _S1900;

#line 229
    _s_diff_ctx_13._S1081 = false;

#line 229
    _s_diff_ctx_13._S1072 = _S1877;

#line 229
    _s_diff_ctx_13._S1074.origin_2 = _S1877;

#line 229
    _s_diff_ctx_13._S1074.direction_1 = _S1877;

#line 229
    _s_diff_ctx_13._S1074.pixel_1 = _S1878;

#line 229
    _s_diff_ctx_13._S1076 = 0.0;

#line 229
    _s_diff_ctx_13._S1077.rng_0 = _S1894;

#line 229
    _s_diff_ctx_13._S1078.wo_0 = _S1877;

#line 229
    _s_diff_ctx_13._S1078.pdf_2 = 0.0;

#line 229
    _s_diff_ctx_13._S1078.weight_0 = _S1877;

#line 229
    _s_diff_ctx_13._S1078.lobeType_0 = 0U;

#line 229
    DiffRay_0 _S1901 = dpray_3;

#line 229
    _s_diff_ctx_13._S1079 = dpray_3;

#line 229
    PathData_0 _S1902 = dppathData_1;

#line 229
    _s_diff_ctx_13._S1080 = dppathData_1;

#line 229
    float3 _S1903 = float3(0.0, 0.0, 0.0);

#line 229
    UniformSampleGenerator_0 _S1904 = sg_25;

#line 229
    BSDFSample_0 _S1905;

#line 229
    _S1905.wo_0 = _S1903;

#line 229
    _S1905.pdf_2 = 0.0;

#line 229
    _S1905.weight_0 = _S1903;

#line 229
    _S1905.lobeType_0 = 0U;

#line 229
    bool _S1906 = _S1038(mi_3, dpsd_2, _S1904, _S1905, true);

#line 229
    _s_diff_ctx_13._S1081 = _S1906;

#line 229
    _s_diff_ctx_13._S1078 = _S1905;

#line 229
    BSDFSample_0 bsdfSample_0 = _S1905;

#line 229
    UniformSampleGenerator_0 _S1907 = _S1904;

#line 229
    DiffRay_0 _S1908;

#line 229
    PathData_0 _S1909;

#line 229
    UniformSampleGenerator_0 _S1910;

#line 229
    bool _bflag_2;

#line 229
    bool _S1911;

#line 229
    if(_S1906)
    {

#line 229
        _S1908 = _S1901;

#line 229
        _S1908.direction_1 = bsdfSample_0.wo_0;

#line 229
        float3 _S1912;

#line 229
        if(dpsd_2.frontFacing_0)
        {

#line 229
            _S1912 = dpsd_2.faceN_0;

#line 229
        }
        else
        {

#line 229
            _S1912 = - dpsd_2.faceN_0;

#line 229
        }

#line 229
        _S1908.origin_2 = s_bwd_dsq_computeRayOrigin_0(dpisectInfo_2.posW_5, _S1912);

#line 229
        if(shouldReparameterize_1)
        {

#line 229
            UniformSampleGenerator_0 _S1913 = _S1907;

#line 229
            float _S1914 = 0.0;

#line 229
            DiffRay_0 _S1915 = s_bwd_primal_reparameterizeRay_0(dpsceneQuery_1, _S1908, _S1913, _S1914, _s_diff_ctx_13._S1075);

#line 229
            _s_diff_ctx_13._S1074 = _S1915;

#line 229
            _s_diff_ctx_13._S1076 = _S1914;

#line 229
            _s_diff_ctx_13._S1077 = _S1913;

#line 229
            float _S1916 = _S1914;

#line 229
            UniformSampleGenerator_0 _S1917 = _S1913;

#line 229
            float _S1918;

#line 229
            if(CB_0.gDisableDivergence_0)
            {

#line 229
                _S1918 = 1.0;

#line 229
            }
            else
            {

#line 229
                _S1918 = _S1916;

#line 229
            }

#line 229
            float3 _S1919 = _S1902.thp_1 * _S1918;

#line 229
            _S1909 = _S1902;

#line 229
            _S1909.thp_1 = _S1919;

#line 229
            _S1908 = _S1915;

#line 229
            _S1910 = _S1917;

#line 229
        }
        else
        {

#line 229
            _S1909 = _S1902;

#line 229
            _S1910 = _S1907;

#line 229
        }

#line 229
        float3 _S1920 = s_bwd_primal_temporaryBsdfEval_0(mi_3, dpsd_2, _S1908.direction_1, dpisectInfo_2.normalW_2, _s_diff_ctx_13._S1073);

#line 229
        _s_diff_ctx_13._S1072 = _S1920;

#line 229
        float3 weight_8 = _S1920 / bsdfSample_0.pdf_2;

#line 229
        _S1909.thp_1 = _S1909.thp_1 * weight_8;

#line 229
        bool _S1921 = any(weight_8 > 0.0);

#line 229
        _bflag_2 = false;

#line 229
        _S1911 = _S1921;

#line 229
    }
    else
    {

#line 229
        _bflag_2 = true;

#line 229
        _S1908 = _S1901;

#line 229
        _S1909 = _S1902;

#line 229
        _S1910 = _S1907;

#line 229
    }

#line 229
    if(_bflag_2)
    {

#line 229
        _bflag_2 = false;

#line 229
    }
    else
    {

#line 229
        _bflag_2 = _S1911;

#line 229
    }

#line 229
    sg_25 = _S1910;

#line 229
    dpray_3 = _S1908;

#line 229
    dppathData_1 = _S1909;

#line 229
    return _bflag_2;
}


#line 229
void s_bwd_primal_handleHit_0(DifferentiableSceneQuery_0 dpsceneQuery_2, IntersectionInfo_0 dpisectInfo_3, inout PathData_0 dppathData_2, inout DiffRay_0 dpray_4, inout UniformSampleGenerator_0 sg_26, bool shouldReparameterize_2, out s_bwd_handleHit_Intermediates_0 _s_diff_ctx_14)
{

#line 349
    float3 _S1922 = (float3)0.0;

#line 349
    BSDFProperties_0 _S1923 = { _S1922, 0.0, _S1922, 0U, _S1922, _S1922, _S1922, _S1922, _S1922 };

#line 349
    uint2 _S1924 = (uint2)0U;

#line 349
    DiffRay_0 _S1925 = { _S1922, _S1922, _S1924 };

#line 349
    uint  _S1926[int(4)] = { 0U, 0U, 0U, 0U };

#line 349
    Xoshiro128StarStar_0 _S1927 = { _S1926 };

#line 349
    UniformSampleGenerator_0 _S1928 = { _S1927 };

#line 349
    PathData_0 _S1929 = { _S1922, _S1922, 0U, false };

#line 349
    LightSample_0 _S1930 = { _S1922, 0.0, _S1922, 0.0, _S1922, _S1922, _S1922 };

#line 349
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1931 = { _S1923 };

#line 349
    DiffPair_float_0 _S1932 = { 0.0, 0.0 };

#line 349
    DiffPair_float_0  _S1933[int(18)] = { _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932, _S1932 };

#line 349
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1934 = { 0.0 };

#line 349
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1935[int(18)] = { _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934, _S1934 };

#line 349
    float3  _S1936[int(18)] = { _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922, _S1922 };

#line 349
    int  _S1937[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 349
    float3  _S1938[int(3)] = { _S1922, _S1922, _S1922 };

#line 349
    float  _S1939[int(3)] = { 0.0, 0.0, 0.0 };

#line 349
    float  _S1940[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 349
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1941 = { _S1933, _S1935, _S1933, _S1935, _S1933, _S1935, _S1936, _S1936, int(0), _S1937, _S1938, _S1938, _S1939, _S1939, int(0), _S1940, _S1937 };

#line 349
    DiffPair_array_float3_0 _S1942 = { _S1938, _S1938 };

#line 349
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1943 = { _S1941, _S1942, _S1928, false };

#line 349
    s_diff_s_diff_SceneDerivativeFlags_0 _S1944 = { int(0) };

#line 349
    s_bwd_reparameterizeRay_Intermediates_0 _S1945 = { _S1943, _S1942, _S1928, _S1944 };

#line 349
    BSDFSample_0 _S1946 = { _S1922, 0.0, _S1922, 0U };

#line 349
    s_bwd_generateScatterRay_Intermediates_0 _S1947 = { _S1922, _S1931, _S1925, _S1945, 0.0, _S1928, _S1946, _S1925, _S1929, false };

#line 349
    s_bwd_computeNEE_Intermediates_0 _S1948 = { _S1931, _S1925, _S1945, 0.0, _S1928, _S1929, _S1922 };

#line 349
    ShadingFrame_0 _S1949 = { _S1922, _S1922, _S1922 };

#line 349
    MaterialHeader_0 _S1950 = { _S1924 };

#line 349
    ShadingData_0 _S1951 = { _S1922, _S1922, (float2)0.0, _S1949, _S1922, (float4)0.0, false, 0.0, 0.0, _S1950, 0U, 0.0, 0.0, 0U, 0U, 0U };

#line 349
    AnyValue128 _S1952 = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U };

#line 349
    Tuple_0 _S1953 = { _S1924, _S1924, _S1952 };

#line 349
    _s_diff_ctx_14._S1089 = false;

#line 349
    _s_diff_ctx_14._S1090 = _S1947;

#line 349
    _s_diff_ctx_14._S1091 = _S1929;

#line 349
    _s_diff_ctx_14._S1092 = _S1925;

#line 349
    _s_diff_ctx_14._S1093 = _S1928;

#line 349
    _s_diff_ctx_14._S1094 = _S1948;

#line 349
    _s_diff_ctx_14._S1095 = _S1929;

#line 349
    _s_diff_ctx_14._S1096 = _S1928;

#line 349
    _s_diff_ctx_14._S1097 = false;

#line 349
    _s_diff_ctx_14._S1098 = false;

#line 349
    _s_diff_ctx_14._S1099 = _S1930;

#line 349
    _s_diff_ctx_14._S1100 = _S1923;

#line 349
    _s_diff_ctx_14._S1101 = _S1929;

#line 349
    _s_diff_ctx_14._S1102 = _S1925;

#line 349
    _s_diff_ctx_14.sd_8 = _S1951;

#line 349
    _s_diff_ctx_14._S1103 = _S1953;

#line 349
    _s_diff_ctx_14._S1089 = false;

#line 349
    _s_diff_ctx_14._S1091.radiance_1 = _S1922;

#line 349
    _s_diff_ctx_14._S1091.thp_1 = _S1922;

#line 349
    _s_diff_ctx_14._S1091.length_0 = 0U;

#line 349
    _s_diff_ctx_14._S1091.terminated_0 = false;

#line 349
    _s_diff_ctx_14._S1092.origin_2 = _S1922;

#line 349
    _s_diff_ctx_14._S1092.direction_1 = _S1922;

#line 349
    _s_diff_ctx_14._S1092.pixel_1 = _S1924;

#line 349
    _s_diff_ctx_14._S1093.rng_0 = _S1927;

#line 349
    _s_diff_ctx_14._S1095.radiance_1 = _S1922;

#line 349
    _s_diff_ctx_14._S1095.thp_1 = _S1922;

#line 349
    _s_diff_ctx_14._S1095.length_0 = 0U;

#line 349
    _s_diff_ctx_14._S1095.terminated_0 = false;

#line 349
    _s_diff_ctx_14._S1096.rng_0 = _S1927;

#line 349
    _s_diff_ctx_14._S1097 = false;

#line 349
    _s_diff_ctx_14._S1098 = false;

#line 349
    _s_diff_ctx_14._S1099.Li_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1099.pdf_1 = 0.0;

#line 349
    _s_diff_ctx_14._S1099.origin_4 = _S1922;

#line 349
    _s_diff_ctx_14._S1099.distance_1 = 0.0;

#line 349
    _s_diff_ctx_14._S1099.dir_4 = _S1922;

#line 349
    _s_diff_ctx_14._S1099.lightPos_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1099.lightNormal_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.emission_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.roughness_0 = 0.0;

#line 349
    _s_diff_ctx_14._S1100.guideNormal_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.flags_8 = 0U;

#line 349
    _s_diff_ctx_14._S1100.diffuseReflectionAlbedo_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.diffuseTransmissionAlbedo_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.specularReflectionAlbedo_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.specularTransmissionAlbedo_0 = _S1922;

#line 349
    _s_diff_ctx_14._S1100.specularReflectance_0 = _S1922;

#line 349
    PathData_0 _S1954 = dppathData_2;

#line 349
    _s_diff_ctx_14._S1101 = dppathData_2;

#line 349
    DiffRay_0 _S1955 = dpray_4;

#line 349
    _s_diff_ctx_14._S1102 = dpray_4;

#line 349
    UniformSampleGenerator_0 _S1956 = sg_26;

#line 349
    ExplicitLodTextureSampler_0 _S1957 = ExplicitLodTextureSampler_x24init_0(0.0);

#line 349
    GeometryHit_0 _S1958 = { dpisectInfo_3.instanceID_7, dpisectInfo_3.triangleID_2, float2(dpisectInfo_3.barycentrics_2.y, dpisectInfo_3.barycentrics_2.z) };

#line 349
    TriangleHit_0 triHit_0 = { _S1958 };

#line 349
    ShadingData_0 sd_13 = loadShadingData_0(HitInfo_x24init_1(triHit_0), _S1955.origin_2, _S1955.direction_1, _S1957);

#line 349
    _s_diff_ctx_14.sd_8 = sd_13;

#line 349
    Tuple_0 _S1959 = getMaterialInstance_0(gScene_materials_materialData_0, gScene_materials_materialSamplers_0, gScene_materials_materialTextures_0, gScene_materials_materialBuffers_0, gScene_materials_networkParamsFP16_0, gScene_materials_networkParamsFP32_0, gScene_materials_udimIndirection_0, sd_13, _S1957, 0U);

#line 349
    _s_diff_ctx_14._S1103 = _S1959;

#line 349
    PathData_0 _S1960;

#line 349
    if(_S1954.length_0 == 0U)
    {

#line 349
        BSDFProperties_0 _S1961 = _S960(_S1959, sd_13);

#line 349
        _s_diff_ctx_14._S1100 = _S1961;

#line 349
        float3 _S1962 = _S1954.radiance_1 + _S1954.thp_1 * _S1961.emission_0;

#line 349
        _S1960 = _S1954;

#line 349
        _S1960.radiance_1 = _S1962;

#line 349
    }
    else
    {

#line 349
        _S1960 = _S1954;

#line 349
    }

#line 349
    bool _S1963 = _S1960.length_0 >= 1U;

#line 349
    if(_S1963)
    {

#line 349
        _S1960.terminated_0 = true;

#line 349
    }
    else
    {

#line 349
    }

#line 349
    bool _S1964 = !_S1963;

#line 349
    UniformSampleGenerator_0 _S1965;

#line 349
    DiffRay_0 _S1966;

#line 349
    if(_S1964)
    {

#line 349
        float3 _S1967 = float3(0.0, 0.0, 0.0);

#line 349
        UniformSampleGenerator_0 _S1968 = _S1956;

#line 349
        LightSample_0 _S1969;

#line 349
        _S1969.Li_0 = _S1967;

#line 349
        _S1969.pdf_1 = 0.0;

#line 349
        _S1969.origin_4 = _S1967;

#line 349
        _S1969.distance_1 = 0.0;

#line 349
        _S1969.dir_4 = _S1967;

#line 349
        _S1969.lightPos_0 = _S1967;

#line 349
        _S1969.lightNormal_0 = _S1967;

#line 349
        bool validSample_0 = generateEmissiveSample_0(dpisectInfo_3, true, _S1968, _S1969);

#line 349
        _s_diff_ctx_14._S1098 = validSample_0;

#line 349
        _s_diff_ctx_14._S1099 = _S1969;

#line 349
        LightSample_0 ls_4 = _S1969;

#line 349
        UniformSampleGenerator_0 _S1970 = _S1968;

#line 349
        if(validSample_0)
        {

#line 349
            bool visible_0 = DifferentiableSceneQuery_traceVisibilityRay_0(dpsceneQuery_2, LightSample_getVisibilityRay_0(ls_4));

#line 349
            _s_diff_ctx_14._S1097 = visible_0;

#line 349
            if(visible_0)
            {

#line 349
                UniformSampleGenerator_0 _S1971 = _S1970;

#line 349
                PathData_0 _S1972 = _S1960;

#line 349
                s_bwd_primal_computeNEE_0(dpsceneQuery_2, sd_13, _S1959, dpisectInfo_3, ls_4, _S1955.pixel_1, _S1972, _S1971, shouldReparameterize_2, _s_diff_ctx_14._S1094);

#line 349
                _s_diff_ctx_14._S1095 = _S1972;

#line 349
                _s_diff_ctx_14._S1096 = _S1971;

#line 349
                _S1960 = _S1972;

#line 349
                _S1965 = _S1971;

#line 349
            }
            else
            {

#line 349
                _S1965 = _S1970;

#line 349
            }

#line 349
        }
        else
        {

#line 349
            _S1965 = _S1970;

#line 349
        }

#line 349
        UniformSampleGenerator_0 _S1973 = _S1965;

#line 349
        DiffRay_0 _S1974 = _S1955;

#line 349
        PathData_0 _S1975 = _S1960;

#line 349
        bool _S1976 = s_bwd_primal_generateScatterRay_0(dpsceneQuery_2, sd_13, _S1959, dpisectInfo_3, _S1974, _S1975, _S1973, shouldReparameterize_2, _s_diff_ctx_14._S1090);

#line 349
        _s_diff_ctx_14._S1089 = _S1976;

#line 349
        _s_diff_ctx_14._S1091 = _S1975;

#line 349
        _s_diff_ctx_14._S1092 = _S1974;

#line 349
        _s_diff_ctx_14._S1093 = _S1973;

#line 349
        DiffRay_0 _S1977 = _S1974;

#line 349
        PathData_0 _S1978 = _S1975;

#line 349
        UniformSampleGenerator_0 _S1979 = _S1973;

#line 349
        bool _bflag_3;

#line 349
        if(!_S1976)
        {

#line 349
            _S1960 = _S1978;

#line 349
            _S1960.terminated_0 = true;

#line 349
            _bflag_3 = false;

#line 349
        }
        else
        {

#line 349
            _bflag_3 = _S1964;

#line 349
            _S1960 = _S1978;

#line 349
        }

#line 349
        if(_bflag_3)
        {

#line 349
            _S1960.length_0 = _S1960.length_0 + 1U;

#line 349
        }
        else
        {

#line 349
        }

#line 349
        _S1966 = _S1977;

#line 349
        _S1965 = _S1979;

#line 349
    }
    else
    {

#line 349
        _S1966 = _S1955;

#line 349
        _S1965 = _S1956;

#line 349
    }

#line 349
    sg_26 = _S1965;

#line 349
    dppathData_2 = _S1960;

#line 349
    dpray_4 = _S1966;

#line 349
    return;
}


#line 349
float3 s_bwd_primal_tracePath_0(DifferentiableSceneQuery_0 dpsceneQuery_3, float2 dppixel_0, float2 dporientation_0, float2 uPixel_0, uint2 frameDim_2, uint2 globalPixel_6, inout UniformSampleGenerator_0 sg_27, bool isEdgePath_0, out s_bwd_tracePath_Intermediates_0 _s_diff_ctx_15)
{

#line 460
    float3 _S1980 = (float3)0.0;

#line 460
    uint2 _S1981 = (uint2)0U;

#line 460
    DiffRay_0 _S1982 = { _S1980, _S1980, _S1981 };

#line 460
    uint  _S1983[int(4)] = { 0U, 0U, 0U, 0U };

#line 460
    Xoshiro128StarStar_0 _S1984 = { _S1983 };

#line 460
    UniformSampleGenerator_0 _S1985 = { _S1984 };

#line 460
    PathData_0 _S1986 = { _S1980, _S1980, 0U, false };

#line 460
    float2 _S1987 = (float2)0.0;

#line 460
    BSDFProperties_0 _S1988 = { _S1980, 0.0, _S1980, 0U, _S1980, _S1980, _S1980, _S1980, _S1980 };

#line 460
    s_bwd_temporaryBsdfEval_Intermediates_0 _S1989 = { _S1988 };

#line 460
    DiffPair_float_0 _S1990 = { 0.0, 0.0 };

#line 460
    DiffPair_float_0  _S1991[int(18)] = { _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990, _S1990 };

#line 460
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S1992 = { 0.0 };

#line 460
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S1993[int(18)] = { _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992, _S1992 };

#line 460
    float3  _S1994[int(18)] = { _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980, _S1980 };

#line 460
    int  _S1995[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 460
    float3  _S1996[int(3)] = { _S1980, _S1980, _S1980 };

#line 460
    float  _S1997[int(3)] = { 0.0, 0.0, 0.0 };

#line 460
    float  _S1998[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 460
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1999 = { _S1991, _S1993, _S1991, _S1993, _S1991, _S1993, _S1994, _S1994, int(0), _S1995, _S1996, _S1996, _S1997, _S1997, int(0), _S1998, _S1995 };

#line 460
    DiffPair_array_float3_0 _S2000 = { _S1996, _S1996 };

#line 460
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S2001 = { _S1999, _S2000, _S1985, false };

#line 460
    s_diff_s_diff_SceneDerivativeFlags_0 _S2002 = { int(0) };

#line 460
    s_bwd_reparameterizeRay_Intermediates_0 _S2003 = { _S2001, _S2000, _S1985, _S2002 };

#line 460
    BSDFSample_0 _S2004 = { _S1980, 0.0, _S1980, 0U };

#line 460
    s_bwd_generateScatterRay_Intermediates_0 _S2005 = { _S1980, _S1989, _S1982, _S2003, 0.0, _S1985, _S2004, _S1982, _S1986, false };

#line 460
    s_bwd_computeNEE_Intermediates_0 _S2006 = { _S1989, _S1982, _S2003, 0.0, _S1985, _S1986, _S1980 };

#line 460
    LightSample_0 _S2007 = { _S1980, 0.0, _S1980, 0.0, _S1980, _S1980, _S1980 };

#line 460
    ShadingFrame_0 _S2008 = { _S1980, _S1980, _S1980 };

#line 460
    MaterialHeader_0 _S2009 = { _S1981 };

#line 460
    ShadingData_0 _S2010 = { _S1980, _S1980, _S1987, _S2008, _S1980, (float4)0.0, false, 0.0, 0.0, _S2009, 0U, 0.0, 0.0, 0U, 0U, 0U };

#line 460
    AnyValue128 _S2011 = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U };

#line 460
    Tuple_0 _S2012 = { _S1981, _S1981, _S2011 };

#line 460
    s_bwd_handleHit_Intermediates_0 _S2013 = { false, _S2005, _S1986, _S1982, _S1985, _S2006, _S1986, _S1985, false, false, _S2007, _S1988, _S1986, _S1982, _S2010, _S2012 };

#line 460
    s_bwd_handleHit_Intermediates_0  _S2014[int(3)] = { _S2013, _S2013, _S2013 };

#line 460
    DiffRay_0  _S2015[int(3)] = { _S1982, _S1982, _S1982 };

#line 460
    PathData_0  _S2016[int(3)] = { _S1986, _S1986, _S1986 };

#line 460
    UniformSampleGenerator_0  _S2017[int(3)] = { _S1985, _S1985, _S1985 };

#line 460
    GeometryInstanceID_0 _S2018 = { 0U };

#line 460
    IntersectionInfo_0 _S2019 = { 0U, _S2018, _S1980, _S1980, _S1980, 0.0 };

#line 460
    IntersectionInfo_0  _S2020[int(3)] = { _S2019, _S2019, _S2019 };

#line 460
    bool  _S2021[int(3)] = { false, false, false };

#line 460
    float3  _S2022[int(2)] = { _S1980, _S1980 };

#line 460
    float  _S2023[int(2)] = { 0.0, 0.0 };

#line 460
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S2024 = { _S1991, _S1993, _S1991, _S1993, _S1994, _S1994, int(0), _S1995, _S2022, _S2022, _S2023, _S2023, int(0), _S1998, _S1995 };

#line 460
    DiffPair_array_float3_1 _S2025 = { _S2022, _S2022 };

#line 460
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _S2026 = { _S2024, _S2025, _S1985, false };

#line 460
    float2  _S2027[int(2)] = { _S1987, _S1987 };

#line 460
    DiffPair_array_float2_0 _S2028 = { _S2027, _S2027 };

#line 460
    s_bwd_reparameterizeScreenSample_Intermediates_0 _S2029 = { _S2026, _S2028, _S1985, _S2002 };

#line 460
    _s_diff_ctx_15._S1127 = _S2014;

#line 460
    _s_diff_ctx_15._S1128 = _S2015;

#line 460
    _s_diff_ctx_15._S1129 = _S2016;

#line 460
    _s_diff_ctx_15._S1130 = _S2017;

#line 460
    _s_diff_ctx_15._S1131 = int(0);

#line 460
    _s_diff_ctx_15._S1132 = _S2020;

#line 460
    _s_diff_ctx_15._S1133 = _S2021;

#line 460
    _s_diff_ctx_15._S1134 = _S2029;

#line 460
    _s_diff_ctx_15._S1135 = 0.0;

#line 460
    _s_diff_ctx_15._S1136 = _S1985;

#line 460
    _s_diff_ctx_15._S1137 = _S1986;

#line 460
    _s_diff_ctx_15._S1138 = _S1987;

#line 460
    _s_diff_ctx_15._S1139 = 0.0;

#line 460
    HitInfo_0 _S2030 = { (uint4)0U };

#line 460
    _s_diff_ctx_15._S1127[int(0)] = _S2013;

#line 460
    _s_diff_ctx_15._S1127[int(1)] = _S2013;

#line 460
    _s_diff_ctx_15._S1127[int(2)] = _S2013;

#line 460
    _s_diff_ctx_15._S1128[int(0)] = _S1982;

#line 460
    _s_diff_ctx_15._S1128[int(1)] = _S1982;

#line 460
    _s_diff_ctx_15._S1128[int(2)] = _S1982;

#line 460
    _s_diff_ctx_15._S1129[int(0)] = _S1986;

#line 460
    _s_diff_ctx_15._S1129[int(1)] = _S1986;

#line 460
    _s_diff_ctx_15._S1129[int(2)] = _S1986;

#line 460
    _s_diff_ctx_15._S1130[int(0)] = _S1985;

#line 460
    _s_diff_ctx_15._S1130[int(1)] = _S1985;

#line 460
    _s_diff_ctx_15._S1130[int(2)] = _S1985;

#line 460
    _s_diff_ctx_15._S1131 = int(0);

#line 460
    _s_diff_ctx_15._S1132[int(0)] = _S2019;

#line 460
    _s_diff_ctx_15._S1132[int(1)] = _S2019;

#line 460
    _s_diff_ctx_15._S1132[int(2)] = _S2019;

#line 460
    _s_diff_ctx_15._S1133[int(0)] = false;

#line 460
    _s_diff_ctx_15._S1133[int(1)] = false;

#line 460
    _s_diff_ctx_15._S1133[int(2)] = false;

#line 460
    _s_diff_ctx_15._S1135 = 0.0;

#line 460
    _s_diff_ctx_15._S1136.rng_0 = _S1984;

#line 460
    UniformSampleGenerator_0 _S2031 = sg_27;

#line 460
    PathData_0 _S2032 = s_bwd_primal_PathData_x24init_0();

#line 460
    _s_diff_ctx_15._S1137 = _S2032;

#line 460
    UniformSampleGenerator_0 _S2033 = _S2031;

#line 460
    float _S2034 = 0.0;

#line 460
    float2 _S2035 = s_bwd_primal_reparameterizeScreenSample_0(dpsceneQuery_3, dppixel_0, frameDim_2, globalPixel_6, _S2033, _S2034, _s_diff_ctx_15._S1134);

#line 460
    _s_diff_ctx_15._S1138 = _S2035;

#line 460
    _s_diff_ctx_15._S1135 = _S2034;

#line 460
    _s_diff_ctx_15._S1136 = _S2033;

#line 460
    float _S2036 = _S2034;

#line 460
    UniformSampleGenerator_0 _S2037 = _S2033;

#line 460
    float _S2038 = s_bwd_primal_evalGaussian_0(_S2035 - uPixel_0, 0.5, 2.0);

#line 460
    _s_diff_ctx_15._S1139 = _S2038;

#line 460
    float3 _S2039 = _S2032.thp_1 * (_S2038 / _S2038);

#line 460
    PathData_0 pathData_0 = _S2032;

#line 460
    pathData_0.thp_1 = _S2039;

#line 460
    if(isEdgePath_0)
    {

#line 460
        pathData_0.thp_1 = _S2039 * s_bwd_dot_1(dporientation_0, _S1987);

#line 460
    }
    else
    {

#line 460
        if(!CB_0.gDisableDivergence_0)
        {

#line 460
            pathData_0.thp_1 = _S2039 * _S2036;

#line 460
        }
        else
        {

#line 460
        }

#line 460
    }

#line 460
    DiffRay_0 _S2040 = s_bwd_primal_DiffRay_x24init_0(Camera_getPosition_0(gScene_0.camera_0), s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(dpsceneQuery_3, _S2035, float2(frameDim_2)), globalPixel_6);

#line 460
    IntersectionInfo_0 _S2041;

#line 460
    _S2041.triangleID_2 = 0U;

#line 460
    _S2041.instanceID_7 = _S2018;

#line 460
    _S2041.barycentrics_2 = _S1980;

#line 460
    _S2041.normalW_2 = _S1980;

#line 460
    _S2041.posW_5 = _S1980;

#line 460
    _S2041.hitT_5 = 0.0;

#line 460
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S2042;

#line 460
    _S2042._S1548 = _S2030;

#line 460
    _S2042.isHit_1 = false;

#line 460
    bool _S2043 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(dpsceneQuery_3, _S2040, _S2041, int(0), _S2042);

#line 460
    IntersectionInfo_0 _S2044 = _S2041;

#line 511
    bool _S2045 = !_S2043;

#line 511
    float3 _S2046;

#line 511
    if(_S2045)
    {

#line 511
        _S2046 = pathData_0.radiance_1;

#line 511
    }
    else
    {

#line 511
    }

#line 511
    bool _S2047 = !_S2045;

#line 511
    UniformSampleGenerator_0 _S2048;

#line 511
    if(_S2047)
    {

#line 511
        bool _bflag_4 = true;

#line 511
        IntersectionInfo_0 isectInfo_1 = _S2044;

#line 511
        _S2048 = _S2037;

#line 511
        DiffRay_0 currentRay_0 = _S2040;

#line 511
        int _pc_2 = int(0);

#line 511
        for(;;)
        {

#line 511
            _s_diff_ctx_15._S1131 = _pc_2;

#line 511
            _s_diff_ctx_15._S1132[_pc_2] = isectInfo_1;

#line 511
            _s_diff_ctx_15._S1133[_pc_2] = _bflag_4;

#line 511
            if(!pathData_0.terminated_0 && _bflag_4)
            {
            }
            else
            {

#line 511
                break;
            }

#line 511
            UniformSampleGenerator_0 _S2049 = _S2048;

#line 511
            PathData_0 _S2050 = pathData_0;

#line 511
            DiffRay_0 _S2051 = currentRay_0;

#line 511
            s_bwd_handleHit_Intermediates_0 _S2052;

#line 511
            _S2052._S1089 = false;

#line 511
            _S2052._S1090 = _S2005;

#line 511
            _S2052._S1091 = _S1986;

#line 511
            _S2052._S1092 = _S1982;

#line 511
            _S2052._S1093 = _S1985;

#line 511
            _S2052._S1094 = _S2006;

#line 511
            _S2052._S1095 = _S1986;

#line 511
            _S2052._S1096 = _S1985;

#line 511
            _S2052._S1097 = false;

#line 511
            _S2052._S1098 = false;

#line 511
            _S2052._S1099 = _S2007;

#line 511
            _S2052._S1100 = _S1988;

#line 511
            _S2052._S1101 = _S1986;

#line 511
            _S2052._S1102 = _S1982;

#line 511
            _S2052.sd_8 = _S2010;

#line 511
            _S2052._S1103 = _S2012;

#line 511
            s_bwd_primal_handleHit_0(dpsceneQuery_3, isectInfo_1, _S2050, _S2051, _S2049, true, _S2052);

#line 511
            _s_diff_ctx_15._S1127[_pc_2] = _S2052;

#line 511
            _s_diff_ctx_15._S1128[_pc_2] = _S2051;

#line 511
            _s_diff_ctx_15._S1129[_pc_2] = _S2050;

#line 511
            _s_diff_ctx_15._S1130[_pc_2] = _S2049;

#line 511
            PathData_0 _S2053 = _S2050;

#line 511
            DiffRay_0 _S2054 = _S2051;

#line 511
            UniformSampleGenerator_0 _S2055 = _S2049;

#line 511
            bool _bflag_5;

#line 511
            if(_S2050.terminated_0)
            {

#line 511
                _bflag_5 = false;

#line 511
            }
            else
            {

#line 511
                _bflag_5 = _bflag_4;

#line 511
            }

#line 511
            if(_bflag_5)
            {

#line 511
                IntersectionInfo_0 _S2056;

#line 511
                _S2056.triangleID_2 = 0U;

#line 511
                _S2056.instanceID_7 = _S2018;

#line 511
                _S2056.barycentrics_2 = _S1980;

#line 511
                _S2056.normalW_2 = _S1980;

#line 511
                _S2056.posW_5 = _S1980;

#line 511
                _S2056.hitT_5 = 0.0;

#line 511
                s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S2057;

#line 511
                _S2057._S1548 = _S2030;

#line 511
                _S2057.isHit_1 = false;

#line 511
                bool _S2058 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(dpsceneQuery_3, _S2054, _S2056, int(0), _S2057);

#line 511
                IntersectionInfo_0 _S2059 = _S2056;

#line 511
                bool _bflag_6;

#line 511
                if(!_S2058)
                {

#line 511
                    _bflag_6 = false;

#line 511
                }
                else
                {

#line 511
                    _bflag_6 = _bflag_5;

#line 511
                }

#line 511
                _bflag_4 = _bflag_6;

#line 511
                isectInfo_1 = _S2059;

#line 511
            }
            else
            {

#line 511
                _bflag_4 = _bflag_5;

#line 511
            }

#line 511
            int _S2060 = _pc_2 + int(1);

#line 511
            pathData_0 = _S2053;

#line 511
            _S2048 = _S2055;

#line 511
            currentRay_0 = _S2054;

#line 511
            _pc_2 = _S2060;

#line 511
        }

#line 511
        _S2046 = pathData_0.radiance_1;

#line 511
    }
    else
    {

#line 511
        _S2048 = _S2037;

#line 511
    }

#line 511
    sg_27 = _S2048;

#line 511
    return _S2046;
}


#line 511
float3 s_bwd_primal_tracePaths_0(DifferentiableSceneQuery_0 dpsceneQuery_4, uint2 pixel_9, uint2 frameDim_3, uint2 globalPixel_7, out s_bwd_tracePaths_Intermediates_0 _s_diff_ctx_16)
{

#line 542
    float3 _S2061 = (float3)0.0;

#line 542
    uint  _S2062[int(4)] = { 0U, 0U, 0U, 0U };

#line 542
    Xoshiro128StarStar_0 _S2063 = { _S2062 };

#line 542
    UniformSampleGenerator_0 _S2064 = { _S2063 };

#line 542
    float2 _S2065 = (float2)0.0;

#line 542
    BSDFProperties_0 _S2066 = { _S2061, 0.0, _S2061, 0U, _S2061, _S2061, _S2061, _S2061, _S2061 };

#line 542
    s_bwd_temporaryBsdfEval_Intermediates_0 _S2067 = { _S2066 };

#line 542
    uint2 _S2068 = (uint2)0U;

#line 542
    DiffRay_0 _S2069 = { _S2061, _S2061, _S2068 };

#line 542
    DiffPair_float_0 _S2070 = { 0.0, 0.0 };

#line 542
    DiffPair_float_0  _S2071[int(18)] = { _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070, _S2070 };

#line 542
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S2072 = { 0.0 };

#line 542
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S2073[int(18)] = { _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072, _S2072 };

#line 542
    float3  _S2074[int(18)] = { _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061, _S2061 };

#line 542
    int  _S2075[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 542
    float3  _S2076[int(3)] = { _S2061, _S2061, _S2061 };

#line 542
    float  _S2077[int(3)] = { 0.0, 0.0, 0.0 };

#line 542
    float  _S2078[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 542
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S2079 = { _S2071, _S2073, _S2071, _S2073, _S2071, _S2073, _S2074, _S2074, int(0), _S2075, _S2076, _S2076, _S2077, _S2077, int(0), _S2078, _S2075 };

#line 542
    DiffPair_array_float3_0 _S2080 = { _S2076, _S2076 };

#line 542
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S2081 = { _S2079, _S2080, _S2064, false };

#line 542
    s_diff_s_diff_SceneDerivativeFlags_0 _S2082 = { int(0) };

#line 542
    s_bwd_reparameterizeRay_Intermediates_0 _S2083 = { _S2081, _S2080, _S2064, _S2082 };

#line 542
    BSDFSample_0 _S2084 = { _S2061, 0.0, _S2061, 0U };

#line 542
    PathData_0 _S2085 = { _S2061, _S2061, 0U, false };

#line 542
    s_bwd_generateScatterRay_Intermediates_0 _S2086 = { _S2061, _S2067, _S2069, _S2083, 0.0, _S2064, _S2084, _S2069, _S2085, false };

#line 542
    s_bwd_computeNEE_Intermediates_0 _S2087 = { _S2067, _S2069, _S2083, 0.0, _S2064, _S2085, _S2061 };

#line 542
    LightSample_0 _S2088 = { _S2061, 0.0, _S2061, 0.0, _S2061, _S2061, _S2061 };

#line 542
    ShadingFrame_0 _S2089 = { _S2061, _S2061, _S2061 };

#line 542
    MaterialHeader_0 _S2090 = { _S2068 };

#line 542
    ShadingData_0 _S2091 = { _S2061, _S2061, _S2065, _S2089, _S2061, (float4)0.0, false, 0.0, 0.0, _S2090, 0U, 0.0, 0.0, 0U, 0U, 0U };

#line 542
    AnyValue128 _S2092 = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U };

#line 542
    Tuple_0 _S2093 = { _S2068, _S2068, _S2092 };

#line 542
    s_bwd_handleHit_Intermediates_0 _S2094 = { false, _S2086, _S2085, _S2069, _S2064, _S2087, _S2085, _S2064, false, false, _S2088, _S2066, _S2085, _S2069, _S2091, _S2093 };

#line 542
    s_bwd_handleHit_Intermediates_0  _S2095[int(3)] = { _S2094, _S2094, _S2094 };

#line 542
    DiffRay_0  _S2096[int(3)] = { _S2069, _S2069, _S2069 };

#line 542
    PathData_0  _S2097[int(3)] = { _S2085, _S2085, _S2085 };

#line 542
    UniformSampleGenerator_0  _S2098[int(3)] = { _S2064, _S2064, _S2064 };

#line 542
    GeometryInstanceID_0 _S2099 = { 0U };

#line 542
    IntersectionInfo_0 _S2100 = { 0U, _S2099, _S2061, _S2061, _S2061, 0.0 };

#line 542
    IntersectionInfo_0  _S2101[int(3)] = { _S2100, _S2100, _S2100 };

#line 542
    bool  _S2102[int(3)] = { false, false, false };

#line 542
    float3  _S2103[int(2)] = { _S2061, _S2061 };

#line 542
    float  _S2104[int(2)] = { 0.0, 0.0 };

#line 542
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S2105 = { _S2071, _S2073, _S2071, _S2073, _S2074, _S2074, int(0), _S2075, _S2103, _S2103, _S2104, _S2104, int(0), _S2078, _S2075 };

#line 542
    DiffPair_array_float3_1 _S2106 = { _S2103, _S2103 };

#line 542
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _S2107 = { _S2105, _S2106, _S2064, false };

#line 542
    float2  _S2108[int(2)] = { _S2065, _S2065 };

#line 542
    DiffPair_array_float2_0 _S2109 = { _S2108, _S2108 };

#line 542
    s_bwd_reparameterizeScreenSample_Intermediates_0 _S2110 = { _S2107, _S2109, _S2064, _S2082 };

#line 542
    s_bwd_tracePath_Intermediates_0 _S2111 = { _S2095, _S2096, _S2097, _S2098, int(0), _S2101, _S2102, _S2110, 0.0, _S2064, _S2085, _S2065, 0.0 };

#line 542
    GeometryHit_0 _S2112 = { _S2099, 0U, _S2065 };

#line 542
    TriangleHit_0 _S2113 = { _S2112 };

#line 542
    _s_diff_ctx_16._S1140 = _S2111;

#line 542
    _s_diff_ctx_16._S1141 = _S2064;

#line 542
    _s_diff_ctx_16._S1142 = _S2061;

#line 542
    _s_diff_ctx_16._S1143 = _S2113;

#line 542
    _s_diff_ctx_16._S1144 = _S2064;

#line 542
    _s_diff_ctx_16._S1145 = _S2065;

#line 542
    _s_diff_ctx_16._S1146 = false;

#line 542
    _s_diff_ctx_16._S1141.rng_0 = _S2063;

#line 542
    _s_diff_ctx_16._S1142 = _S2061;

#line 542
    _s_diff_ctx_16._S1143._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit = _S2112;

#line 542
    float3 _S2114 = s_bwd_primal_DifferentiableSceneQuery_loadCameraPosition_0(dpsceneQuery_4);

#line 542
    uint _S2115 = CB_0.gFrameCount_0;

#line 542
    uint _S2116 = CB_0.gFixedSeed_0;

#line 542
    uint frameSeed_0;

#line 542
    if(CB_0.gUseFixedSeed_0)
    {

#line 542
        frameSeed_0 = _S2116;

#line 542
    }
    else
    {

#line 542
        frameSeed_0 = _S2115;

#line 542
    }

#line 542
    UniformSampleGenerator_0 _S2117 = UniformSampleGenerator_x24init_0(globalPixel_7, frameSeed_0 / 2U);

#line 542
    _s_diff_ctx_16._S1144 = _S2117;

#line 542
    UniformSampleGenerator_0 _S2118 = _S2117;

#line 542
    float2 _S2119 = sampleNext2D_0(_S2118);

#line 542
    UniformSampleGenerator_0 _S2120 = _S2118;

#line 542
    float2 _S2121 = sampleNext2D_0(_S2120);

#line 542
    UniformSampleGenerator_0 _S2122 = _S2120;

#line 542
    float2 _S2123 = sampleNext2D_0(_S2122);

#line 542
    float2 pixelf_0 = float2(pixel_9) + float2(0.5, 0.5);

#line 542
    UniformSampleGenerator_0 _S2124 = _S2122;

#line 542
    float2 uniform2D_0 = sampleNext2D_0(_S2124);

#line 542
    UniformSampleGenerator_0 sg_28 = _S2124;

#line 542
    float2 _S2125 = s_bwd_primal_sampleGaussian_0(uniform2D_0, 0.5, 2.0);

#line 542
    _s_diff_ctx_16._S1145 = _S2125;

#line 542
    float2 jitter2D_0;

#line 542
    if(frameSeed_0 % 2U == 0U)
    {

#line 542
        jitter2D_0 = - _S2125;

#line 542
    }
    else
    {

#line 542
        jitter2D_0 = _S2125;

#line 542
    }

#line 542
    float2 _S2126 = pixelf_0 + jitter2D_0;

#line 542
    float3 _S2127 = s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(dpsceneQuery_4, _S2126, float2(frameDim_3));

#line 542
    HitInfo_0 _S2128 = HitInfo_x24init_0();

#line 542
    DiffRay_0 _S2129 = s_bwd_primal_DiffRay_x24init_0(_S2114, _S2127, globalPixel_7);

#line 542
    HitInfo_0 _S2130 = _S2128;

#line 542
    bool _S2131 = traceRayInline_0(_S2129, _S2130);

#line 542
    _s_diff_ctx_16._S1146 = _S2131;

#line 542
    HitInfo_0 hitInfo_4 = _S2130;

#line 542
    if(_S2131)
    {

#line 542
        TriangleHit_0 triHit_1 = HitInfo_getTriangleHit_0(hitInfo_4);

#line 542
        _s_diff_ctx_16._S1143 = triHit_1;

#line 542
        IntersectionInfo_0 _S2132 = s_bwd_primal_IntersectionInfo_x24init_0();

#line 542
        _S2132.triangleID_2 = triHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 542
        _S2132.instanceID_7 = triHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 542
        float3 _S2133 = GeometryHit_getBarycentricWeights_0(triHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit);

#line 542
        _s_diff_ctx_16._S1142 = _S2133;

#line 542
        _S2132.barycentrics_2 = _S2133;

#line 542
        _S2132.normalW_2 = s_bwd_primal_DifferentiableSceneQuery_computeShadingNormal_0(dpsceneQuery_4, triHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, triHit_1._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S2133);

#line 542
        gBoundaryTerm_0[globalPixel_7] = (float4)computeBoundaryTermMitsuba_0(_S2132, _S2114, _S2127);

#line 542
    }
    else
    {

#line 542
    }

#line 542
    float2 _S2134 = float2(0.0, 0.0);

#line 542
    UniformSampleGenerator_0 _S2135 = sg_28;

#line 542
    float3 _S2136 = s_bwd_primal_tracePath_0(dpsceneQuery_4, _S2126, _S2134, pixelf_0, frameDim_3, globalPixel_7, _S2135, false, _s_diff_ctx_16._S1140);

#line 542
    _s_diff_ctx_16._S1141 = _S2135;

#line 542
    return _S2136;
}


#line 542
void s_bwd_FalcorSceneIO_loadVertexNormalsW_1(inout DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2137, GeometryInstanceID_0 _S2138, uint _S2139, float3 _S2140, float3 _S2141, float3 _S2142)
{

#line 542
    FalcorSceneIO_bwd_loadVertexNormalsW_0(_S2137, _S2138, _S2139, _S2140, _S2141, _S2142);

#line 542
    return;
}


#line 542
void s_bwd_DifferentiableSceneQuery_computeShadingNormal_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_7, GeometryInstanceID_0 instanceID_18, uint primitiveIndex_5, inout DiffPair_float3_0 dpbarycentrics_3, float3 s_diff_normal_T_0)
{

#line 241 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2143 = (float3)0.0;

#line 241
    float _S2144 = dpbarycentrics_3.primal_0.x;

#line 241
    float _S2145 = dpbarycentrics_3.primal_0.y;

#line 241
    float _S2146 = dpbarycentrics_3.primal_0.z;

#line 241
    float3 _S2147 = _S2143;

#line 241
    float3 _S2148 = _S2143;

#line 241
    float3 _S2149 = _S2143;

#line 241
    s_bwd_FalcorSceneIO_loadVertexNormalsW_0(dpthis_7.primal_0.gradientFlags_1, instanceID_18, primitiveIndex_5, _S2147, _S2148, _S2149);

#line 241
    float3 _S2150 = _S2149 * s_diff_normal_T_0;

#line 241
    float3 _S2151 = (float3)_S2146 * s_diff_normal_T_0;

#line 483 "core.meta.slang"
    float _S2152 = _S2150[int(0)] + _S2150[int(1)] + _S2150[int(2)];

#line 483
    float3 _S2153 = _S2148 * s_diff_normal_T_0;

#line 483
    float3 _S2154 = (float3)_S2145 * s_diff_normal_T_0;

#line 483
    float _S2155 = _S2153[int(0)] + _S2153[int(1)] + _S2153[int(2)];

#line 483
    float3 _S2156 = _S2147 * s_diff_normal_T_0;

#line 483
    float3 _S2157 = (float3)_S2144 * s_diff_normal_T_0;

#line 483
    float _S2158 = _S2156[int(0)] + _S2156[int(1)] + _S2156[int(2)];

#line 483
    s_diff_s_diff_SceneDerivativeFlags_0 _S2159 = SceneDerivativeFlags_dzero_0();

#line 483
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2160;

#line 483
    _S2160.primal_0 = dpthis_7.primal_0.gradientFlags_1;

#line 483
    _S2160.differential_0 = _S2159;

#line 483
    s_bwd_FalcorSceneIO_loadVertexNormalsW_1(_S2160, instanceID_18, primitiveIndex_5, _S2157, _S2154, _S2151);

#line 1189
    float3 _S2161 = float3(0.0, 0.0, _S2152) + float3(0.0, _S2155, 0.0) + float3(_S2158, 0.0, 0.0);

#line 1189
    dpbarycentrics_3.primal_0 = dpbarycentrics_3.primal_0;

#line 1189
    dpbarycentrics_3.differential_0 = _S2161;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2162 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    _S2162.gradientFlags_0 = _S2160.differential_0;

#line 1189
    dpthis_7.primal_0 = dpthis_7.primal_0;

#line 1189
    dpthis_7.differential_0 = _S2162;

#line 1189
    return;
}


#line 1247 "diff.meta.slang"
void s_bwd_length_impl_0(inout DiffPair_float3_0 dpx_6, float _s_dOut_2)
{

#line 1247
    float _S2163 = dpx_6.primal_0[int(0)];

#line 1247
    float _S2164 = dpx_6.primal_0[int(1)];

#line 1247
    float _S2165 = dpx_6.primal_0[int(2)];

#line 1247
    DiffPair_float_0 _S2166;

#line 1247
    _S2166.primal_0 = _S2163 * _S2163 + _S2164 * _S2164 + _S2165 * _S2165;

#line 1247
    _S2166.differential_0 = 0.0;

#line 1247
    s_bwd_sqrt_1(_S2166, _s_dOut_2);

#line 1247
    float _S2167 = dpx_6.primal_0[int(2)] * _S2166.differential_0;

#line 483 "core.meta.slang"
    float _S2168 = _S2167 + _S2167;

#line 483
    float _S2169 = dpx_6.primal_0[int(1)] * _S2166.differential_0;

#line 483
    float _S2170 = _S2169 + _S2169;

#line 483
    float _S2171 = dpx_6.primal_0[int(0)] * _S2166.differential_0;

#line 483
    float _S2172 = _S2171 + _S2171;

#line 483
    float3 _S2173 = (float3)0.0;

#line 483
    _S2173[int(2)] = _S2168;

#line 483
    _S2173[int(1)] = _S2170;

#line 483
    _S2173[int(0)] = _S2172;

#line 483
    dpx_6.primal_0 = dpx_6.primal_0;

#line 483
    dpx_6.differential_0 = _S2173;

#line 483
    return;
}


#line 483
void s_bwd_length_impl_1(inout DiffPair_float3_0 _S2174, float _S2175)
{

#line 483
    s_bwd_length_impl_0(_S2174, _S2175);

#line 483
    return;
}


#line 483
void s_bwd_length_1(inout DiffPair_float3_0 _S2176, float _S2177)
{

#line 1249 "diff.meta.slang"
    s_bwd_length_impl_1(_S2176, _S2177);

#line 1249
    return;
}


#line 1303
void s_bwd_normalize_impl_0(inout DiffPair_float3_0 dpx_7, float3 _s_dOut_3)
{

#line 1303
    float _S2178 = s_bwd_length_0(dpx_7.primal_0);

#line 1303
    float3 _S2179 = dpx_7.primal_0 * _s_dOut_3;

#line 1303
    float3 _S2180 = (float3)(1.0 / _S2178) * _s_dOut_3;

#line 1303
    float _S2181 = - ((_S2179[int(0)] + _S2179[int(1)] + _S2179[int(2)]) / (_S2178 * _S2178));

#line 1182 "core.meta.slang"
    float3 _S2182 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2183;

#line 1182
    _S2183.primal_0 = dpx_7.primal_0;

#line 1182
    _S2183.differential_0 = _S2182;

#line 1182
    s_bwd_length_1(_S2183, _S2181);

#line 1189
    float3 _S2184 = _S2180 + _S2183.differential_0;

#line 1189
    dpx_7.primal_0 = dpx_7.primal_0;

#line 1189
    dpx_7.differential_0 = _S2184;

#line 1189
    return;
}


#line 1189
void s_bwd_normalize_impl_1(inout DiffPair_float3_0 _S2185, float3 _S2186)
{

#line 1189
    s_bwd_normalize_impl_0(_S2185, _S2186);

#line 1189
    return;
}


#line 1189
void s_bwd_normalize_1(inout DiffPair_float3_0 _S2187, float3 _S2188)
{

#line 1305 "diff.meta.slang"
    s_bwd_normalize_impl_1(_S2187, _S2188);

#line 1305
    return;
}


#line 1305
void s_bwd_cross_1(inout DiffPair_float3_0 _S2189, inout DiffPair_float3_0 _S2190, float3 _S2191)
{

#line 1305
    _d_cross_0(_S2189, _S2190, _S2191);

#line 1305
    return;
}


#line 1305
void s_bwd_FalcorSceneIO_loadVertexPositionsW_1(inout DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2192, GeometryInstanceID_0 _S2193, uint _S2194, float3 _S2195, float3 _S2196, float3 _S2197, uint2 _S2198)
{

#line 1305
    FalcorSceneIO_bwd_loadVertexPositionsW_0(_S2192, _S2193, _S2194, _S2195, _S2196, _S2197, _S2198);

#line 1305
    return;
}


#line 1305
void s_bwd_DifferentiableSceneQuery_loadVertexPosW_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_8, GeometryInstanceID_0 instanceID_19, uint triangleID_11, float3 barycentrics_8, float3 dpfaceNormalW_2, uint2 pixel_10, float3 s_diff_posW_T_0)
{

#line 254 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2199 = (float3)0.0;

#line 254
    float _S2200 = barycentrics_8.x;

#line 254
    float _S2201 = barycentrics_8.y;

#line 254
    float _S2202 = barycentrics_8.z;

#line 254
    float3 _S2203 = _S2199;

#line 254
    float3 _S2204 = _S2199;

#line 254
    float3 _S2205 = _S2199;

#line 254
    s_bwd_FalcorSceneIO_loadVertexPositionsW_0(dpthis_8.primal_0.gradientFlags_1, instanceID_19, triangleID_11, _S2203, _S2204, _S2205, pixel_10);

#line 254
    float3 _S2206 = (float3)_S2200;

#line 254
    float3 _S2207 = (float3)_S2201;

#line 254
    float3 _S2208 = (float3)_S2202;

#line 254
    float3 _S2209 = _S2204 - _S2203;

#line 254
    float3 _S2210 = _S2205 - _S2203;

#line 254
    DiffPair_float3_0 _S2211;

#line 254
    _S2211.primal_0 = s_bwd_cross_0(_S2209, _S2210);

#line 254
    _S2211.differential_0 = _S2199;

#line 254
    s_bwd_normalize_1(_S2211, dpfaceNormalW_2);

#line 254
    DiffPair_float3_0 _S2212;

#line 254
    _S2212.primal_0 = _S2209;

#line 254
    _S2212.differential_0 = _S2199;

#line 254
    DiffPair_float3_0 _S2213;

#line 254
    _S2213.primal_0 = _S2210;

#line 254
    _S2213.differential_0 = _S2199;

#line 254
    s_bwd_cross_1(_S2212, _S2213, _S2211.differential_0);

#line 1189 "core.meta.slang"
    float3 _S2214 = _S2213.differential_0 + _S2208 * s_diff_posW_T_0;

#line 1189
    float3 _S2215 = _S2212.differential_0 + _S2207 * s_diff_posW_T_0;

#line 1189
    float3 _S2216 = - _S2213.differential_0 + - _S2212.differential_0 + _S2206 * s_diff_posW_T_0;

#line 1189
    s_diff_s_diff_SceneDerivativeFlags_0 _S2217 = SceneDerivativeFlags_dzero_0();

#line 1189
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2218;

#line 1189
    _S2218.primal_0 = dpthis_8.primal_0.gradientFlags_1;

#line 1189
    _S2218.differential_0 = _S2217;

#line 1189
    s_bwd_FalcorSceneIO_loadVertexPositionsW_1(_S2218, instanceID_19, triangleID_11, _S2216, _S2215, _S2214, pixel_10);

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2219 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    _S2219.gradientFlags_0 = _S2218.differential_0;

#line 1189
    dpthis_8.primal_0 = dpthis_8.primal_0;

#line 1189
    dpthis_8.differential_0 = _S2219;

#line 1189
    return;
}


#line 1189
void s_bwd_computeBarycentrics_0(inout DiffPair_float3_0 dpv0_3, inout DiffPair_float3_0 dpv1_3, inout DiffPair_float3_0 dpv2_3, inout DiffPair_float3_0 dporigin_4, inout DiffPair_float3_0 dpdirection_4, inout DiffPair_float_0 dpt_2, float3 dpbarycentrics_4)
{

#line 1189
    float3 p_6 = dporigin_4.primal_0 + dpdirection_4.primal_0 * dpt_2.primal_0;

#line 1189
    float3 edgep0_1 = dpv0_3.primal_0 - p_6;

#line 1189
    float3 edgep1_1 = dpv1_3.primal_0 - p_6;

#line 1189
    float3 edgep2_1 = dpv2_3.primal_0 - p_6;

#line 1189
    float3 _S2220 = (float3)dpt_2.primal_0;

#line 1189
    float3 _S2221 = s_bwd_cross_0(edgep1_1, edgep2_1);

#line 1189
    float _S2222 = s_bwd_length_0(_S2221);

#line 1189
    float3 _S2223 = s_bwd_cross_0(edgep2_1, edgep0_1);

#line 1189
    float _S2224 = s_bwd_length_0(_S2223);

#line 1189
    float3 _S2225 = s_bwd_cross_0(edgep0_1, edgep1_1);

#line 1189
    float _S2226 = s_bwd_length_0(_S2225);

#line 1189
    float area_4 = _S2222 + _S2224 + _S2226;

#line 1189
    float _S2227 = area_4 * area_4;

#line 1182
    float3 _S2228 = (float3)0.0;

#line 1182
    float _S2229 = dpbarycentrics_4[int(2)] / _S2227;

#line 1182
    float _S2230 = dpbarycentrics_4[int(1)] / _S2227;

#line 1182
    float _S2231 = area_4 * _S2230;

#line 1182
    float _S2232 = dpbarycentrics_4[int(0)] / _S2227;

#line 1182
    float _S2233 = area_4 * _S2232;

#line 483
    float _S2234 = _S2226 * - _S2229 + _S2224 * - _S2230 + _S2222 * - _S2232;

#line 483
    float _S2235 = area_4 * _S2229 + _S2234;

#line 483
    DiffPair_float3_0 _S2236;

#line 483
    _S2236.primal_0 = _S2225;

#line 483
    _S2236.differential_0 = _S2228;

#line 483
    s_bwd_length_1(_S2236, _S2235);

#line 483
    DiffPair_float3_0 _S2237;

#line 483
    _S2237.primal_0 = edgep0_1;

#line 483
    _S2237.differential_0 = _S2228;

#line 483
    DiffPair_float3_0 _S2238;

#line 483
    _S2238.primal_0 = edgep1_1;

#line 483
    _S2238.differential_0 = _S2228;

#line 483
    s_bwd_cross_1(_S2237, _S2238, _S2236.differential_0);

#line 483
    float _S2239 = _S2231 + _S2234;

#line 483
    DiffPair_float3_0 _S2240;

#line 483
    _S2240.primal_0 = _S2223;

#line 483
    _S2240.differential_0 = _S2228;

#line 483
    s_bwd_length_1(_S2240, _S2239);

#line 483
    DiffPair_float3_0 _S2241;

#line 483
    _S2241.primal_0 = edgep2_1;

#line 483
    _S2241.differential_0 = _S2228;

#line 483
    DiffPair_float3_0 _S2242;

#line 483
    _S2242.primal_0 = edgep0_1;

#line 483
    _S2242.differential_0 = _S2228;

#line 483
    s_bwd_cross_1(_S2241, _S2242, _S2240.differential_0);

#line 483
    float _S2243 = _S2233 + _S2234;

#line 483
    DiffPair_float3_0 _S2244;

#line 483
    _S2244.primal_0 = _S2221;

#line 483
    _S2244.differential_0 = _S2228;

#line 483
    s_bwd_length_1(_S2244, _S2243);

#line 483
    DiffPair_float3_0 _S2245;

#line 483
    _S2245.primal_0 = edgep1_1;

#line 483
    _S2245.differential_0 = _S2228;

#line 483
    DiffPair_float3_0 _S2246;

#line 483
    _S2246.primal_0 = edgep2_1;

#line 483
    _S2246.differential_0 = _S2228;

#line 483
    s_bwd_cross_1(_S2245, _S2246, _S2244.differential_0);

#line 1189
    float3 _S2247 = _S2241.differential_0 + _S2246.differential_0;

#line 1189
    float3 _S2248 = _S2238.differential_0 + _S2245.differential_0;

#line 1189
    float3 _S2249 = _S2237.differential_0 + _S2242.differential_0;

#line 1189
    float3 _S2250 = - _S2247 + - _S2248 + - _S2249;

#line 1189
    float3 _S2251 = dpdirection_4.primal_0 * _S2250;

#line 1189
    float3 _S2252 = _S2220 * _S2250;

#line 483
    float _S2253 = _S2251[int(0)] + _S2251[int(1)] + _S2251[int(2)];

#line 483
    dpt_2.primal_0 = dpt_2.primal_0;

#line 483
    dpt_2.differential_0 = _S2253;

#line 483
    dpdirection_4.primal_0 = dpdirection_4.primal_0;

#line 483
    dpdirection_4.differential_0 = _S2252;

#line 483
    dporigin_4.primal_0 = dporigin_4.primal_0;

#line 483
    dporigin_4.differential_0 = _S2250;

#line 483
    dpv2_3.primal_0 = dpv2_3.primal_0;

#line 483
    dpv2_3.differential_0 = _S2247;

#line 483
    dpv1_3.primal_0 = dpv1_3.primal_0;

#line 483
    dpv1_3.differential_0 = _S2248;

#line 483
    dpv0_3.primal_0 = dpv0_3.primal_0;

#line 483
    dpv0_3.differential_0 = _S2249;

#line 483
    return;
}


#line 483
void s_bwd_dot_2(inout DiffPair_float3_0 _S2254, inout DiffPair_float3_0 _S2255, float _S2256)
{

#line 483
    _d_dot_0(_S2254, _S2255, _S2256);

#line 483
    return;
}


#line 483
void s_bwd_computeDistanceToTriangle_0(inout DiffPair_float3_0 dpv0_4, inout DiffPair_float3_0 dpv1_4, inout DiffPair_float3_0 dpv2_4, inout DiffPair_float3_0 dporigin_5, inout DiffPair_float3_0 dpdirection_5, float s_diff_t_T_0)
{

#line 483
    float3 edge1_1 = dpv1_4.primal_0 - dpv0_4.primal_0;

#line 483
    float3 edge2_1 = dpv2_4.primal_0 - dpv0_4.primal_0;

#line 483
    float3 tvec_0 = dporigin_5.primal_0 - dpv0_4.primal_0;

#line 483
    float3 _S2257 = s_bwd_cross_0(dpdirection_5.primal_0, edge2_1);

#line 483
    float _S2258 = s_bwd_dot_0(edge1_1, _S2257);

#line 483
    float3 _S2259 = s_bwd_cross_0(tvec_0, edge1_1);

#line 483
    float _S2260 = s_diff_t_T_0 / (_S2258 * _S2258);

#line 483
    float _S2261 = s_bwd_dot_0(edge2_1, _S2259) * - _S2260;

#line 483
    float _S2262 = _S2258 * _S2260;

#line 1182
    float3 _S2263 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2264;

#line 1182
    _S2264.primal_0 = edge2_1;

#line 1182
    _S2264.differential_0 = _S2263;

#line 1182
    DiffPair_float3_0 _S2265;

#line 1182
    _S2265.primal_0 = _S2259;

#line 1182
    _S2265.differential_0 = _S2263;

#line 1182
    s_bwd_dot_2(_S2264, _S2265, _S2262);

#line 1182
    DiffPair_float3_0 _S2266;

#line 1182
    _S2266.primal_0 = tvec_0;

#line 1182
    _S2266.differential_0 = _S2263;

#line 1182
    DiffPair_float3_0 _S2267;

#line 1182
    _S2267.primal_0 = edge1_1;

#line 1182
    _S2267.differential_0 = _S2263;

#line 1182
    s_bwd_cross_1(_S2266, _S2267, _S2265.differential_0);

#line 1182
    float3 _S2268 = - _S2266.differential_0;

#line 1182
    DiffPair_float3_0 _S2269;

#line 1182
    _S2269.primal_0 = edge1_1;

#line 1182
    _S2269.differential_0 = _S2263;

#line 1182
    DiffPair_float3_0 _S2270;

#line 1182
    _S2270.primal_0 = _S2257;

#line 1182
    _S2270.differential_0 = _S2263;

#line 1182
    s_bwd_dot_2(_S2269, _S2270, _S2261);

#line 1182
    DiffPair_float3_0 _S2271;

#line 1182
    _S2271.primal_0 = dpdirection_5.primal_0;

#line 1182
    _S2271.differential_0 = _S2263;

#line 1182
    DiffPair_float3_0 _S2272;

#line 1182
    _S2272.primal_0 = edge2_1;

#line 1182
    _S2272.differential_0 = _S2263;

#line 1182
    s_bwd_cross_1(_S2271, _S2272, _S2270.differential_0);

#line 1189
    float3 _S2273 = _S2264.differential_0 + _S2272.differential_0;

#line 1189
    float3 _S2274 = - _S2273;

#line 1189
    float3 _S2275 = _S2267.differential_0 + _S2269.differential_0;

#line 1189
    float3 _S2276 = - _S2275;

#line 1189
    dpdirection_5.primal_0 = dpdirection_5.primal_0;

#line 1189
    dpdirection_5.differential_0 = _S2271.differential_0;

#line 1189
    dporigin_5.primal_0 = dporigin_5.primal_0;

#line 1189
    dporigin_5.differential_0 = _S2266.differential_0;

#line 1189
    dpv2_4.primal_0 = dpv2_4.primal_0;

#line 1189
    dpv2_4.differential_0 = _S2273;

#line 1189
    dpv1_4.primal_0 = dpv1_4.primal_0;

#line 1189
    dpv1_4.differential_0 = _S2275;

#line 1189
    float3 _S2277 = _S2268 + _S2274 + _S2276;

#line 1189
    dpv0_4.primal_0 = dpv0_4.primal_0;

#line 1189
    dpv0_4.differential_0 = _S2277;

#line 1189
    return;
}


#line 1189
void s_bwd_DifferentiableSceneQuery_loadVertexPosW_1(inout DiffPair_DifferentiableSceneQuery_0 dpthis_9, GeometryInstanceID_0 instanceID_20, uint triangleID_12, inout DiffPair_DiffRay_0 dpray_5, float dpt_3, float3 dpbarycentrics_5, float3 dpfaceNormalW_3, float3 s_diff_posW_T_1)
{

#line 269 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2278 = (float3)0.0;

#line 269
    float3 _S2279 = _S2278;

#line 269
    float3 _S2280 = _S2278;

#line 269
    float3 _S2281 = _S2278;

#line 269
    s_bwd_FalcorSceneIO_loadVertexPositionsW_0(dpthis_9.primal_0.gradientFlags_1, instanceID_20, triangleID_12, _S2279, _S2280, _S2281, dpray_5.primal_0.pixel_1);

#line 269
    float _S2282 = s_bwd_primal_computeDistanceToTriangle_0(_S2279, _S2280, _S2281, dpray_5.primal_0.origin_2, dpray_5.primal_0.direction_1);

#line 269
    float3 _S2283 = _S2278;

#line 269
    s_bwd_primal_computeBarycentrics_0(_S2279, _S2280, _S2281, dpray_5.primal_0.origin_2, dpray_5.primal_0.direction_1, _S2282, _S2283);

#line 269
    float3 _S2284 = (float3)_S2283.x;

#line 269
    float3 _S2285 = (float3)_S2283.y;

#line 269
    float3 _S2286 = (float3)_S2283.z;

#line 269
    float3 _S2287 = _S2280 - _S2279;

#line 269
    float3 _S2288 = _S2281 - _S2279;

#line 269
    DiffPair_float3_0 _S2289;

#line 269
    _S2289.primal_0 = s_bwd_cross_0(_S2287, _S2288);

#line 269
    _S2289.differential_0 = _S2278;

#line 269
    s_bwd_normalize_1(_S2289, dpfaceNormalW_3);

#line 269
    DiffPair_float3_0 _S2290;

#line 269
    _S2290.primal_0 = _S2287;

#line 269
    _S2290.differential_0 = _S2278;

#line 269
    DiffPair_float3_0 _S2291;

#line 269
    _S2291.primal_0 = _S2288;

#line 269
    _S2291.differential_0 = _S2278;

#line 269
    s_bwd_cross_1(_S2290, _S2291, _S2289.differential_0);

#line 269
    float3 _S2292 = - _S2291.differential_0;

#line 269
    float3 _S2293 = - _S2290.differential_0;

#line 269
    float3 _S2294 = _S2281 * s_diff_posW_T_1;

#line 269
    float3 _S2295 = _S2286 * s_diff_posW_T_1;

#line 269
    float3 _S2296 = _S2280 * s_diff_posW_T_1;

#line 269
    float3 _S2297 = _S2285 * s_diff_posW_T_1;

#line 269
    float3 _S2298 = _S2279 * s_diff_posW_T_1;

#line 269
    float3 _S2299 = _S2284 * s_diff_posW_T_1;

#line 1189 "core.meta.slang"
    float3 _S2300 = dpbarycentrics_5 + (float3(0.0, 0.0, _S2294[int(0)] + _S2294[int(1)] + _S2294[int(2)]) + float3(0.0, _S2296[int(0)] + _S2296[int(1)] + _S2296[int(2)], 0.0) + float3(_S2298[int(0)] + _S2298[int(1)] + _S2298[int(2)], 0.0, 0.0));

#line 1189
    DiffPair_float3_0 _S2301;

#line 1189
    _S2301.primal_0 = _S2279;

#line 1189
    _S2301.differential_0 = _S2278;

#line 1189
    DiffPair_float3_0 _S2302;

#line 1189
    _S2302.primal_0 = _S2280;

#line 1189
    _S2302.differential_0 = _S2278;

#line 1189
    DiffPair_float3_0 _S2303;

#line 1189
    _S2303.primal_0 = _S2281;

#line 1189
    _S2303.differential_0 = _S2278;

#line 1189
    DiffPair_float3_0 _S2304;

#line 1189
    _S2304.primal_0 = dpray_5.primal_0.origin_2;

#line 1189
    _S2304.differential_0 = _S2278;

#line 1189
    DiffPair_float3_0 _S2305;

#line 1189
    _S2305.primal_0 = dpray_5.primal_0.direction_1;

#line 1189
    _S2305.differential_0 = _S2278;

#line 1189
    DiffPair_float_0 _S2306;

#line 1189
    _S2306.primal_0 = _S2282;

#line 1189
    _S2306.differential_0 = 0.0;

#line 1189
    s_bwd_computeBarycentrics_0(_S2301, _S2302, _S2303, _S2304, _S2305, _S2306, _S2300);

#line 483
    float _S2307 = dpt_3 + _S2306.differential_0;

#line 483
    DiffPair_float3_0 _S2308;

#line 483
    _S2308.primal_0 = _S2279;

#line 483
    _S2308.differential_0 = _S2278;

#line 483
    DiffPair_float3_0 _S2309;

#line 483
    _S2309.primal_0 = _S2280;

#line 483
    _S2309.differential_0 = _S2278;

#line 483
    DiffPair_float3_0 _S2310;

#line 483
    _S2310.primal_0 = _S2281;

#line 483
    _S2310.differential_0 = _S2278;

#line 483
    DiffPair_float3_0 _S2311;

#line 483
    _S2311.primal_0 = dpray_5.primal_0.origin_2;

#line 483
    _S2311.differential_0 = _S2278;

#line 483
    DiffPair_float3_0 _S2312;

#line 483
    _S2312.primal_0 = dpray_5.primal_0.direction_1;

#line 483
    _S2312.differential_0 = _S2278;

#line 483
    s_bwd_computeDistanceToTriangle_0(_S2308, _S2309, _S2310, _S2311, _S2312, _S2307);

#line 1189
    float3 _S2313 = _S2305.differential_0 + _S2312.differential_0;

#line 1189
    float3 _S2314 = _S2304.differential_0 + _S2311.differential_0;

#line 1189
    float3 _S2315 = _S2291.differential_0 + _S2295 + _S2303.differential_0 + _S2310.differential_0;

#line 1189
    float3 _S2316 = _S2290.differential_0 + _S2297 + _S2302.differential_0 + _S2309.differential_0;

#line 1189
    float3 _S2317 = _S2292 + _S2293 + _S2299 + _S2301.differential_0 + _S2308.differential_0;

#line 1189
    s_diff_s_diff_SceneDerivativeFlags_0 _S2318 = SceneDerivativeFlags_dzero_0();

#line 1189
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2319;

#line 1189
    _S2319.primal_0 = dpthis_9.primal_0.gradientFlags_1;

#line 1189
    _S2319.differential_0 = _S2318;

#line 1189
    s_bwd_FalcorSceneIO_loadVertexPositionsW_1(_S2319, instanceID_20, triangleID_12, _S2317, _S2316, _S2315, dpray_5.primal_0.pixel_1);

#line 1189
    s_diff_s_diff_DiffRay_0 _S2320 = DiffRay_x24_syn_dzero_0();

#line 1189
    _S2320.direction_0 = _S2313;

#line 1189
    _S2320.origin_0 = _S2314;

#line 1189
    dpray_5.primal_0 = dpray_5.primal_0;

#line 1189
    dpray_5.differential_0 = _S2320;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2321 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    _S2321.gradientFlags_0 = _S2319.differential_0;

#line 1189
    dpthis_9.primal_0 = dpthis_9.primal_0;

#line 1189
    dpthis_9.differential_0 = _S2321;

#line 1189
    return;
}


#line 1189
void s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_10, HitInfo_0 hitInfo_5, inout DiffPair_DiffRay_0 dpray_6, int mode_5, s_diff_s_diff_IntersectionInfo_0 _s_dOut_4, s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _s_diff_ctx_17)
{

#line 198 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2322 = (float3)0.0;

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S2323 = dpthis_10;

#line 198
    DiffPair_DiffRay_0 _S2324 = dpray_6;

#line 198
    bool _S2325 = mode_5 == int(0);

#line 198
    uint2 _S2326 = (uint2)0U;

#line 198
    IntersectionInfo_0 info_3 = s_bwd_primal_IntersectionInfo_x24init_0();

#line 198
    info_3.triangleID_2 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
    info_3.instanceID_7 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
    float3 _S2327;

#line 198
    uint2 _S2328;

#line 198
    bool _S2329;

#line 198
    if(_S2325)
    {

#line 198
        float _S2330 = 0.0;

#line 198
        float3 _S2331 = _S2322;

#line 198
        float3 _S2332 = _S2322;

#line 198
        float3 _S2333 = s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_1(_S2323.primal_0, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S2324.primal_0, _S2330, _S2331, _S2332);

#line 198
        info_3.triangleID_2 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
        info_3.instanceID_7 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
        info_3.barycentrics_2 = _S2331;

#line 198
        info_3.normalW_2 = _S2332;

#line 198
        info_3.posW_5 = _S2333;

#line 198
        info_3.hitT_5 = _S2330;

#line 198
        _S2329 = false;

#line 198
        _S2327 = _S2322;

#line 198
        _S2328 = _S2326;

#line 198
    }
    else
    {

#line 198
        bool _S2334 = mode_5 == int(1);

#line 198
        if(_S2334)
        {

#line 198
            float3 _S2335 = _S2322;

#line 198
            float3 _S2336 = s_bwd_primal_DifferentiableSceneQuery_loadVertexPosW_0(_S2323.primal_0, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _s_diff_ctx_17._S1549, _S2335, _S2324.primal_0.pixel_1);

#line 198
            float3 _S2337 = _S2336 - _S2324.primal_0.origin_2;

#line 198
            float _S2338 = s_bwd_length_0(_S2337);

#line 198
            info_3.triangleID_2 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
            info_3.instanceID_7 = _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
            info_3.barycentrics_2 = _s_diff_ctx_17._S1549;

#line 198
            info_3.normalW_2 = _S2335;

#line 198
            info_3.posW_5 = _S2336;

#line 198
            info_3.hitT_5 = _S2338;

#line 198
            _S2327 = _S2337;

#line 198
            _S2328 = _S2324.primal_0.pixel_1;

#line 198
        }
        else
        {

#line 198
            _S2327 = _S2322;

#line 198
            _S2328 = _S2326;

#line 198
        }

#line 198
        _S2329 = _S2334;

#line 198
    }

#line 198
    IntersectionInfo_0 _S2339 = info_3;

#line 198
    IntersectionInfo_0 _S2340 = info_3;

#line 198
    IntersectionInfo_0 _S2341 = info_3;

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S2342 = IntersectionInfo_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_DiffRay_0 _S2343 = DiffRay_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2344 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S2345 = _s_dOut_4;

#line 198
    _S2345.normalW_0 = _S2322;

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S2346;

#line 198
    _S2346.primal_0 = _S2323.primal_0;

#line 198
    _S2346.differential_0 = _S2344;

#line 198
    DiffPair_float3_0 _S2347;

#line 198
    _S2347.primal_0 = _S2341.barycentrics_2;

#line 198
    _S2347.differential_0 = _S2322;

#line 198
    s_bwd_DifferentiableSceneQuery_computeShadingNormal_0(_S2346, _S2339.instanceID_7, _S2340.triangleID_2, _S2347, _s_dOut_4.normalW_0);

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S2348 = _S2342;

#line 198
    _S2348.barycentrics_0 = _S2347.differential_0;

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S2349 = IntersectionInfo_x24_syn_dadd_0(_S2345, _S2348);

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2350 = DifferentiableSceneQuery_x24_syn_dadd_0(_S2346.differential_0, _S2344);

#line 198
    s_diff_s_diff_DiffRay_0 _S2351;

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2352;

#line 198
    if(_S2325)
    {

#line 198
        DiffPair_DifferentiableSceneQuery_0 _S2353;

#line 198
        _S2353.primal_0 = _S2323.primal_0;

#line 198
        _S2353.differential_0 = _S2344;

#line 198
        DiffPair_DiffRay_0 _S2354;

#line 198
        _S2354.primal_0 = _S2324.primal_0;

#line 198
        _S2354.differential_0 = _S2343;

#line 198
        s_bwd_DifferentiableSceneQuery_loadVertexPosW_1(_S2353, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S2354, _S2349.hitT_0, _S2349.barycentrics_0, _S2349.normalW_0, _S2349.posW_2);

#line 198
        s_diff_s_diff_DifferentiableSceneQuery_0 _S2355 = DifferentiableSceneQuery_x24_syn_dadd_0(_S2353.differential_0, _S2350);

#line 198
        _S2351 = DiffRay_x24_syn_dadd_0(_S2354.differential_0, _S2343);

#line 198
        _S2352 = _S2355;

#line 198
    }
    else
    {

#line 198
        if(_S2329)
        {

#line 198
            DiffPair_float3_0 _S2356;

#line 198
            _S2356.primal_0 = _S2327;

#line 198
            _S2356.differential_0 = _S2322;

#line 198
            s_bwd_length_1(_S2356, _S2349.hitT_0);

#line 198
            float3 _S2357 = - _S2356.differential_0;

#line 1189 "core.meta.slang"
            float3 _S2358 = _S2349.posW_2 + _S2356.differential_0;

#line 1189
            DiffPair_DifferentiableSceneQuery_0 _S2359;

#line 1189
            _S2359.primal_0 = _S2323.primal_0;

#line 1189
            _S2359.differential_0 = _S2344;

#line 1189
            s_bwd_DifferentiableSceneQuery_loadVertexPosW_0(_S2359, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_17.hit_10._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _s_diff_ctx_17._S1549, _S2349.normalW_0, _S2328, _S2358);

#line 1189
            s_diff_s_diff_DiffRay_0 _S2360 = _S2343;

#line 1189
            _S2360.origin_0 = _S2357;

#line 1189
            s_diff_s_diff_DifferentiableSceneQuery_0 _S2361 = DifferentiableSceneQuery_x24_syn_dadd_0(_S2359.differential_0, _S2350);

#line 1189
            _S2351 = DiffRay_x24_syn_dadd_0(_S2343, _S2360);

#line 1189
            _S2352 = _S2361;

#line 1189
        }
        else
        {

#line 1189
            _S2351 = _S2343;

#line 1189
            _S2352 = _S2350;

#line 1189
        }

#line 1189
    }

#line 1189
    dpray_6.primal_0 = dpray_6.primal_0;

#line 1189
    dpray_6.differential_0 = _S2351;

#line 1189
    dpthis_10.primal_0 = dpthis_10.primal_0;

#line 1189
    dpthis_10.differential_0 = _S2352;

#line 1189
    return;
}


#line 1189
void s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_11, inout DiffPair_DiffRay_0 dprayData_1, s_diff_s_diff_IntersectionInfo_0 dpisectInfo_4, int mode_6, s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _s_diff_ctx_18)
{

#line 144 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2362 = (float3)0.0;

#line 144
    GeometryInstanceID_0 _S2363 = { 0U };

#line 144
    GeometryHit_0 _S2364 = { _S2363, 0U, (float2)0.0 };

#line 144
    TriangleHit_0 _S2365 = { _S2364 };

#line 144
    s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _S2366;

#line 144
    _S2366._S1549 = _S2362;

#line 144
    _S2366.hit_10 = _S2365;

#line 144
    DiffPair_DifferentiableSceneQuery_0 _S2367 = dpthis_11;

#line 144
    DiffPair_DiffRay_0 _S2368 = dprayData_1;

#line 144
    bool _S2369 = !!_s_diff_ctx_18.isHit_1;

#line 144
    if(_S2369)
    {

#line 144
        IntersectionInfo_0 _S2370 = s_bwd_primal_DifferentiableSceneQuery_loadIntersectionInfo_0(_S2367.primal_0, _s_diff_ctx_18._S1548, _S2368.primal_0, mode_6, _S2366);

#line 144
    }
    else
    {

#line 144
    }

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S2371 = IntersectionInfo_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_DiffRay_0 _S2372 = DiffRay_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2373 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S2374 = IntersectionInfo_x24_syn_dadd_0(IntersectionInfo_x24_syn_dadd_0(dpisectInfo_4, _S2371), _S2371);

#line 144
    s_diff_s_diff_DiffRay_0 _S2375;

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2376;

#line 144
    if(_S2369)
    {

#line 144
        DiffPair_DifferentiableSceneQuery_0 _S2377;

#line 144
        _S2377.primal_0 = _S2367.primal_0;

#line 144
        _S2377.differential_0 = _S2373;

#line 144
        DiffPair_DiffRay_0 _S2378;

#line 144
        _S2378.primal_0 = _S2368.primal_0;

#line 144
        _S2378.differential_0 = _S2372;

#line 144
        s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_0(_S2377, _s_diff_ctx_18._S1548, _S2378, mode_6, _S2374, _S2366);

#line 144
        s_diff_s_diff_DifferentiableSceneQuery_0 _S2379 = DifferentiableSceneQuery_x24_syn_dadd_0(_S2377.differential_0, _S2373);

#line 144
        _S2375 = DiffRay_x24_syn_dadd_0(_S2378.differential_0, _S2372);

#line 144
        _S2376 = _S2379;

#line 144
    }
    else
    {

#line 144
        _S2375 = _S2372;

#line 144
        _S2376 = _S2373;

#line 144
    }

#line 144
    s_diff_s_diff_DiffRay_0 _S2380 = _S2372;

#line 144
    _S2380.direction_0 = _S2362;

#line 144
    _S2380.origin_0 = _S2362;

#line 144
    s_diff_s_diff_DiffRay_0 _S2381 = DiffRay_x24_syn_dadd_0(_S2375, _S2380);

#line 144
    dprayData_1.primal_0 = dprayData_1.primal_0;

#line 144
    dprayData_1.differential_0 = _S2381;

#line 144
    dpthis_11.primal_0 = dpthis_11.primal_0;

#line 144
    dpthis_11.differential_0 = _S2376;

#line 144
    return;
}


#line 144
void s_bwd_DiffRay_x24init_0(inout DiffPair_float3_0 dporigin_6, inout DiffPair_float3_0 dpdirection_6, uint2 pixel_11, s_diff_s_diff_DiffRay_0 _s_dOut_5)
{

#line 29
    dpdirection_6.primal_0 = dpdirection_6.primal_0;

#line 29
    dpdirection_6.differential_0 = _s_dOut_5.direction_0;

#line 29
    dporigin_6.primal_0 = dporigin_6.primal_0;

#line 29
    dporigin_6.differential_0 = _s_dOut_5.origin_0;

#line 29
    return;
}


#line 29
void s_bwd_safeNormalize_0(inout DiffPair_float3_0 dpv_1, float3 _s_dOut_6)
{

#line 29
    DiffPair_float3_0 _S2382 = dpv_1;

#line 29
    float3 _S2383 = (float3)0.0;

#line 29
    float _S2384 = s_bwd_length_0(dpv_1.primal_0);

#line 29
    float3 _S2385 = (float3)_S2384;

#line 29
    bool _S2386 = _S2384 > 0.0;

#line 29
    float3 _S2387;

#line 29
    if(_S2386)
    {

#line 29
        _S2387 = (float3)(_S2384 * _S2384);

#line 29
    }
    else
    {

#line 29
        _S2387 = _S2383;

#line 29
    }

#line 29
    float3 _S2388;

#line 29
    if(_S2386)
    {

#line 29
        float3 _S2389 = _s_dOut_6 / _S2387;

#line 29
        float3 _S2390 = _S2385 * _S2389;

#line 29
        _S2387 = _S2382.primal_0 * - _S2389;

#line 29
        _S2388 = _S2390;

#line 29
    }
    else
    {

#line 29
        _S2387 = _S2383;

#line 29
        _S2388 = _S2383;

#line 29
    }

#line 483 "core.meta.slang"
    float _S2391 = _S2387[int(0)] + _S2387[int(1)] + _S2387[int(2)];

#line 483
    DiffPair_float3_0 _S2392;

#line 483
    _S2392.primal_0 = _S2382.primal_0;

#line 483
    _S2392.differential_0 = _S2383;

#line 483
    s_bwd_length_1(_S2392, _S2391);

#line 1189
    float3 _S2393 = _S2392.differential_0 + _S2388;

#line 1189
    dpv_1.primal_0 = dpv_1.primal_0;

#line 1189
    dpv_1.differential_0 = _S2393;

#line 1189
    return;
}


#line 1189
void s_bwd_DifferentiableSceneQuery_computeCameraRayDirection_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_12, inout DiffPair_float2_0 dpposS_2, inout DiffPair_float2_0 dpframeDim_1, float3 _s_dOut_7)
{

#line 1189
    float2 _S2394 = dpposS_2.primal_0 + float2(0.5, 0.5);

#line 1189
    float2 _S2395 = float2(2.0, -2.0);

#line 1189
    float2 ndc_2 = _S2395 * (_S2394 / dpframeDim_1.primal_0) + float2(-1.0, 1.0);

#line 1189
    Scene_0 _S2396 = gScene_0;

#line 1189
    float2 _S2397 = dpframeDim_1.primal_0 * dpframeDim_1.primal_0;

#line 1182
    float3 _S2398 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2399;

#line 1182
    _S2399.primal_0 = ndc_2.x * gScene_0.camera_0.data_1.cameraU_0 + ndc_2.y * gScene_0.camera_0.data_1.cameraV_0 + gScene_0.camera_0.data_1.cameraW_0;

#line 1182
    _S2399.differential_0 = _S2398;

#line 1182
    s_bwd_safeNormalize_0(_S2399, _s_dOut_7);

#line 1182
    float3 _S2400 = _S2396.camera_0.data_1.cameraV_0 * _S2399.differential_0;

#line 1182
    float3 _S2401 = _S2396.camera_0.data_1.cameraU_0 * _S2399.differential_0;

#line 1182
    float2 _S2402 = _S2395 * (float2(0.0, _S2400[int(0)] + _S2400[int(1)] + _S2400[int(2)]) + float2(_S2401[int(0)] + _S2401[int(1)] + _S2401[int(2)], 0.0)) / _S2397;

#line 1182
    float2 _S2403 = _S2394 * - _S2402;

#line 1182
    float2 _S2404 = dpframeDim_1.primal_0 * _S2402;

#line 1182
    dpframeDim_1.primal_0 = dpframeDim_1.primal_0;

#line 1182
    dpframeDim_1.differential_0 = _S2403;

#line 1182
    dpposS_2.primal_0 = dpposS_2.primal_0;

#line 1182
    dpposS_2.differential_0 = _S2404;

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2405 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1182
    dpthis_12.primal_0 = dpthis_12.primal_0;

#line 1182
    dpthis_12.differential_0 = _S2405;

#line 1182
    return;
}


#line 1182
void s_bwd_dot_3(inout DiffPair_float2_0 _S2406, inout DiffPair_float2_0 _S2407, float _S2408)
{

#line 1182
    _d_dot_1(_S2406, _S2407, _S2408);

#line 1182
    return;
}


#line 1182
void s_bwd_evalGaussian_0(inout DiffPair_float2_0 dpxy_2, float sigma_1, float radius_2, float _s_dOut_8)
{

#line 439 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float alpha_10 = -1.0 / (2.0 * sigma_1 * sigma_1);

#line 439
    float _S2409 = 1.0 / (6.28318548202514648438 * sigma_1 * sigma_1) * _s_dOut_8;

#line 439
    DiffPair_float_0 _S2410;

#line 439
    _S2410.primal_0 = alpha_10 * s_bwd_dot_1(dpxy_2.primal_0, dpxy_2.primal_0);

#line 439
    _S2410.differential_0 = 0.0;

#line 439
    s_bwd_exp_1(_S2410, _S2409);

#line 439
    float _S2411 = alpha_10 * _S2410.differential_0;

#line 1182 "core.meta.slang"
    float2 _S2412 = (float2)0.0;

#line 1182
    DiffPair_float2_0 _S2413;

#line 1182
    _S2413.primal_0 = dpxy_2.primal_0;

#line 1182
    _S2413.differential_0 = _S2412;

#line 1182
    DiffPair_float2_0 _S2414;

#line 1182
    _S2414.primal_0 = dpxy_2.primal_0;

#line 1182
    _S2414.differential_0 = _S2412;

#line 1182
    s_bwd_dot_3(_S2413, _S2414, _S2411);

#line 1189
    float2 _S2415 = _S2414.differential_0 + _S2413.differential_0;

#line 1189
    dpxy_2.primal_0 = dpxy_2.primal_0;

#line 1189
    dpxy_2.differential_0 = _S2415;

#line 1189
    return;
}


#line 1189
struct DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0
{
    s_diff_s_diff_DifferentiableSceneQuery_0 primal_0;
    s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};


#line 1189
struct DiffPair_0
{
    DiffPair_DifferentiableSceneQuery_0 primal_0;
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};


#line 1189
struct DiffPair_1
{
    DiffPair_float2_0 primal_0;
    DiffPair_float2_0 differential_0;
};


#line 1189
struct DiffPair_2
{
    DiffPair_array_float2_0 primal_0;
    DiffPair_array_float2_0 differential_0;
};


#line 206 "core"
DiffPair_float3_0 _S2416()
{

#line 1182 "core.meta.slang"
    float3 _S2417 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2418 = { _S2417, _S2417 };

#line 1182
    return _S2418;
}


#line 1182
struct DiffPair_3
{
    DiffPair_float3_0 primal_0;
    DiffPair_float3_0 differential_0;
};


#line 1182
void s_bwd_d_dot_0(inout DiffPair_3 dpdpx_5, inout DiffPair_3 dpdpy_2, DiffPair_float_0 _s_dOut_9)
{

#line 1182
    float _S2419 = dpdpy_2.primal_0.primal_0[int(2)] * _s_dOut_9.differential_0;

#line 1182
    float _S2420 = dpdpx_5.primal_0.differential_0[int(2)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2421 = (float3)0.0;

#line 1182
    float3 _S2422 = _S2421;

#line 1182
    _S2422[int(2)] = _S2419;

#line 1182
    float3 _S2423 = _S2421;

#line 1182
    _S2423[int(2)] = _S2420;

#line 1182
    float _S2424 = dpdpx_5.primal_0.primal_0[int(2)] * _s_dOut_9.differential_0;

#line 1182
    float _S2425 = dpdpy_2.primal_0.differential_0[int(2)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2426 = _S2421;

#line 1182
    _S2426[int(2)] = _S2424;

#line 1182
    float3 _S2427 = _S2421;

#line 1182
    _S2427[int(2)] = _S2425;

#line 1182
    float _S2428 = dpdpx_5.primal_0.primal_0[int(2)] * _s_dOut_9.primal_0;

#line 1182
    float _S2429 = dpdpy_2.primal_0.primal_0[int(2)] * _s_dOut_9.primal_0;

#line 1182
    float3 _S2430 = _S2421;

#line 1182
    _S2430[int(2)] = _S2428;

#line 1182
    float3 _S2431 = _S2421;

#line 1182
    _S2431[int(2)] = _S2429;

#line 1182
    float _S2432 = dpdpy_2.primal_0.primal_0[int(1)] * _s_dOut_9.differential_0;

#line 1182
    float _S2433 = dpdpx_5.primal_0.differential_0[int(1)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2434 = _S2421;

#line 1182
    _S2434[int(1)] = _S2432;

#line 1182
    float3 _S2435 = _S2421;

#line 1182
    _S2435[int(1)] = _S2433;

#line 1182
    float _S2436 = dpdpx_5.primal_0.primal_0[int(1)] * _s_dOut_9.differential_0;

#line 1182
    float _S2437 = dpdpy_2.primal_0.differential_0[int(1)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2438 = _S2421;

#line 1182
    _S2438[int(1)] = _S2436;

#line 1182
    float3 _S2439 = _S2421;

#line 1182
    _S2439[int(1)] = _S2437;

#line 1182
    float _S2440 = dpdpx_5.primal_0.primal_0[int(1)] * _s_dOut_9.primal_0;

#line 1182
    float _S2441 = dpdpy_2.primal_0.primal_0[int(1)] * _s_dOut_9.primal_0;

#line 1182
    float3 _S2442 = _S2421;

#line 1182
    _S2442[int(1)] = _S2440;

#line 1182
    float3 _S2443 = _S2421;

#line 1182
    _S2443[int(1)] = _S2441;

#line 1182
    float _S2444 = dpdpy_2.primal_0.primal_0[int(0)] * _s_dOut_9.differential_0;

#line 1182
    float _S2445 = dpdpx_5.primal_0.differential_0[int(0)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2446 = _S2421;

#line 1182
    _S2446[int(0)] = _S2444;

#line 1182
    float3 _S2447 = _S2421;

#line 1182
    _S2447[int(0)] = _S2445;

#line 1182
    float _S2448 = dpdpx_5.primal_0.primal_0[int(0)] * _s_dOut_9.differential_0;

#line 1182
    float _S2449 = dpdpy_2.primal_0.differential_0[int(0)] * _s_dOut_9.differential_0;

#line 1182
    float3 _S2450 = _S2421;

#line 1182
    _S2450[int(0)] = _S2448;

#line 1182
    float3 _S2451 = _S2421;

#line 1182
    _S2451[int(0)] = _S2449;

#line 1182
    float _S2452 = dpdpx_5.primal_0.primal_0[int(0)] * _s_dOut_9.primal_0;

#line 1182
    float _S2453 = dpdpy_2.primal_0.primal_0[int(0)] * _s_dOut_9.primal_0;

#line 1182
    float3 _S2454 = _S2421;

#line 1182
    _S2454[int(0)] = _S2452;

#line 1182
    float3 _S2455 = _S2421;

#line 1182
    _S2455[int(0)] = _S2453;

#line 1182
    DiffPair_float3_0 _S2456 = { _S2423 + _S2430 + _S2435 + _S2442 + _S2447 + _S2454, _S2426 + _S2438 + _S2450 };

#line 1182
    dpdpy_2.primal_0 = dpdpy_2.primal_0;

#line 1182
    dpdpy_2.differential_0 = _S2456;

#line 1182
    DiffPair_float3_0 _S2457 = { _S2427 + _S2431 + _S2439 + _S2443 + _S2451 + _S2455, _S2422 + _S2434 + _S2446 };

#line 1182
    dpdpx_5.primal_0 = dpdpx_5.primal_0;

#line 1182
    dpdpx_5.differential_0 = _S2457;

#line 1182
    return;
}


#line 206 "core"
DiffPair_float_0 _S2458()
{

#line 206
    DiffPair_float_0 _S2459 = { 0.0, 0.0 };

#line 206
    return _S2459;
}


#line 206
struct DiffPair_4
{
    DiffPair_float_0 primal_0;
    DiffPair_float_0 differential_0;
};


#line 206
void s_bwd_d_sqrt_0(inout DiffPair_4 dpdpx_6, DiffPair_float_0 _s_dOut_10)
{

#line 206
    float _S2460 = s_bwd_max_0(0.00000010000000116861, dpdpx_6.primal_0.primal_0);

#line 206
    float _S2461 = s_bwd_sqrt_0(_S2460);

#line 206
    float _S2462 = 0.5 / _S2461 * _s_dOut_10.differential_0;

#line 206
    float _S2463 = 0.5 * - (dpdpx_6.primal_0.differential_0 * _s_dOut_10.differential_0 / (_S2461 * _S2461));

#line 206
    DiffPair_float_0 _S2464;

#line 206
    _S2464.primal_0 = _S2460;

#line 206
    _S2464.differential_0 = 0.0;

#line 206
    s_bwd_sqrt_1(_S2464, _S2463);

#line 206
    DiffPair_float_0 _S2465;

#line 206
    _S2465.primal_0 = 0.00000010000000116861;

#line 206
    _S2465.differential_0 = 0.0;

#line 206
    DiffPair_float_0 _S2466;

#line 206
    _S2466.primal_0 = dpdpx_6.primal_0.primal_0;

#line 206
    _S2466.differential_0 = 0.0;

#line 206
    s_bwd_max_1(_S2465, _S2466, _S2464.differential_0);

#line 206
    DiffPair_float_0 _S2467;

#line 206
    _S2467.primal_0 = dpdpx_6.primal_0.primal_0;

#line 206
    _S2467.differential_0 = 0.0;

#line 206
    s_bwd_sqrt_1(_S2467, _s_dOut_10.primal_0);

#line 206
    DiffPair_float_0 _S2468 = { _S2466.differential_0 + _S2467.differential_0, _S2462 };

#line 206
    dpdpx_6.primal_0 = dpdpx_6.primal_0;

#line 206
    dpdpx_6.differential_0 = _S2468;

#line 206
    return;
}


#line 206
void s_bwd_s_fwd_length_impl_0(inout DiffPair_3 dpdpx_7, DiffPair_float_0 _s_dOut_11)
{

#line 206
    float _S2469 = dpdpx_7.primal_0.primal_0[int(0)];

#line 206
    float _S2470 = dpdpx_7.primal_0.differential_0[int(0)] * dpdpx_7.primal_0.primal_0[int(0)];

#line 206
    float _S2471 = dpdpx_7.primal_0.primal_0[int(1)];

#line 206
    float _S2472 = dpdpx_7.primal_0.differential_0[int(1)] * dpdpx_7.primal_0.primal_0[int(1)];

#line 206
    float _S2473 = dpdpx_7.primal_0.primal_0[int(2)];

#line 206
    float _S2474 = dpdpx_7.primal_0.differential_0[int(2)] * dpdpx_7.primal_0.primal_0[int(2)];

#line 206
    DiffPair_float_0 _S2475 = { _S2469 * _S2469 + _S2471 * _S2471 + _S2473 * _S2473, _S2470 + _S2470 + (_S2472 + _S2472) + (_S2474 + _S2474) };

#line 206
    DiffPair_float_0 _S2476 = { _s_dOut_11.primal_0, _s_dOut_11.differential_0 };

#line 206
    DiffPair_float_0 _S2477 = _S2458();

#line 206
    DiffPair_4 _S2478;

#line 206
    _S2478.primal_0 = _S2475;

#line 206
    _S2478.differential_0 = _S2477;

#line 206
    s_bwd_d_sqrt_0(_S2478, _S2476);

#line 206
    float _S2479 = _S2478.differential_0.differential_0;

#line 483 "core.meta.slang"
    float _S2480 = _S2479 + _S2479;

#line 483
    float _S2481 = dpdpx_7.primal_0.primal_0[int(2)] * _S2480;

#line 483
    float _S2482 = dpdpx_7.primal_0.primal_0[int(2)] * _S2478.differential_0.primal_0;

#line 483
    float _S2483 = dpdpx_7.primal_0.differential_0[int(2)] * _S2480 + _S2482 + _S2482;

#line 483
    float _S2484 = dpdpx_7.primal_0.primal_0[int(1)] * _S2480;

#line 483
    float _S2485 = dpdpx_7.primal_0.primal_0[int(1)] * _S2478.differential_0.primal_0;

#line 483
    float _S2486 = dpdpx_7.primal_0.differential_0[int(1)] * _S2480 + _S2485 + _S2485;

#line 483
    float _S2487 = dpdpx_7.primal_0.primal_0[int(0)] * _S2480;

#line 483
    float _S2488 = dpdpx_7.primal_0.primal_0[int(0)] * _S2478.differential_0.primal_0;

#line 483
    float _S2489 = dpdpx_7.primal_0.differential_0[int(0)] * _S2480 + _S2488 + _S2488;

#line 1182
    float3 _S2490 = (float3)0.0;

#line 1182
    float3 _S2491 = _S2490;

#line 1182
    _S2491[int(2)] = _S2483;

#line 1182
    _S2491[int(1)] = _S2486;

#line 1182
    _S2491[int(0)] = _S2489;

#line 1182
    float3 _S2492 = _S2490;

#line 1182
    _S2492[int(2)] = _S2481;

#line 1182
    _S2492[int(1)] = _S2484;

#line 1182
    _S2492[int(0)] = _S2487;

#line 1182
    DiffPair_float3_0 _S2493 = { _S2491, _S2492 };

#line 1182
    dpdpx_7.primal_0 = dpdpx_7.primal_0;

#line 1182
    dpdpx_7.differential_0 = _S2493;

#line 1182
    return;
}


#line 1182
void s_bwd_s_fwd_safeNormalize_0(inout DiffPair_3 dpdpv_1, DiffPair_float3_0 _s_dOut_12)
{

#line 1182
    float3 _S2494;

#line 1182
    DiffPair_3 _S2495 = dpdpv_1;

#line 1182
    DiffPair_float3_0 _S2496 = { dpdpv_1.primal_0.primal_0, dpdpv_1.primal_0.differential_0 };

#line 1182
    float3 _S2497 = (float3)0.0;

#line 1182
    DiffPair_float_0 _S2498 = s_bwd_primal_s_fwd_length_impl_0(_S2496);

#line 1182
    float3 _S2499 = (float3)_S2498.primal_0;

#line 1182
    float3 _S2500 = (float3)_S2498.differential_0;

#line 1182
    bool _S2501 = _S2498.primal_0 > 0.0;

#line 1182
    float3 _S2502;

#line 1182
    float3 _S2503;

#line 1182
    float3 _S2504;

#line 1182
    if(_S2501)
    {

#line 1182
        float _S2505 = _S2498.primal_0 * _S2498.primal_0;

#line 1182
        float3 _S2506 = (float3)_S2505;

#line 1182
        _S2494 = _S2506;

#line 1182
        float3 _S2507 = _S2495.primal_0.differential_0 * _S2498.primal_0 - _S2495.primal_0.primal_0 * _S2498.differential_0;

#line 1182
        _S2502 = (float3)(_S2505 * _S2505);

#line 1182
        _S2503 = _S2507;

#line 1182
        _S2504 = _S2506;

#line 1182
    }
    else
    {

#line 1182
        _S2502 = _S2497;

#line 1182
        _S2503 = _S2497;

#line 1182
        _S2504 = _S2497;

#line 1182
    }

#line 1182
    float3 _S2508;

#line 1182
    float3 _S2509;

#line 1182
    float _S2510;

#line 1182
    if(_S2501)
    {

#line 1182
        float3 _S2511 = _s_dOut_12.differential_0 / _S2502;

#line 1182
        float3 _S2512 = _S2503 * - _S2511;

#line 1182
        float3 _S2513 = _S2504 * _S2511;

#line 1182
        float _S2514 = _S2498.primal_0 * (_S2512[int(0)] + _S2512[int(1)] + _S2512[int(2)]);

#line 1182
        float3 _S2515 = - _S2513;

#line 1182
        float3 _S2516 = _S2495.primal_0.differential_0 * _S2513;

#line 1182
        float3 _S2517 = _S2499 * _S2513;

#line 1182
        float3 _S2518 = _s_dOut_12.primal_0 / _S2494;

#line 1182
        float3 _S2519 = _S2495.primal_0.primal_0 * - _S2518;

#line 483
        float _S2520 = _S2514 + _S2514;

#line 1189
        float3 _S2521 = _S2500 * _S2515 + _S2499 * _S2518;

#line 1189
        _S2502 = _S2495.primal_0.primal_0 * _S2515;

#line 1189
        _S2503 = _S2516;

#line 1189
        _S2504 = _S2519;

#line 1189
        _S2510 = _S2520;

#line 1189
        _S2508 = _S2521;

#line 1189
        _S2509 = _S2517;

#line 1189
    }
    else
    {

#line 1189
        _S2502 = _S2497;

#line 1189
        _S2503 = _S2497;

#line 1189
        _S2504 = _S2497;

#line 1189
        _S2510 = 0.0;

#line 1189
        _S2508 = _S2497;

#line 1189
        _S2509 = _S2497;

#line 1189
    }

#line 1189
    DiffPair_float_0 _S2522 = { _S2503[int(0)] + _S2503[int(1)] + _S2503[int(2)] + _S2504[int(0)] + _S2504[int(1)] + _S2504[int(2)] + _S2510, _S2502[int(0)] + _S2502[int(1)] + _S2502[int(2)] };

#line 1189
    DiffPair_float3_0 _S2523 = { _S2497, _S2497 };

#line 1189
    DiffPair_3 _S2524;

#line 1189
    _S2524.primal_0 = _S2496;

#line 1189
    _S2524.differential_0 = _S2523;

#line 1189
    s_bwd_s_fwd_length_impl_0(_S2524, _S2522);

#line 1189
    DiffPair_float3_0 _S2525 = { _S2524.differential_0.primal_0 + _S2508, _S2524.differential_0.differential_0 + _S2509 };

#line 1189
    dpdpv_1.primal_0 = dpdpv_1.primal_0;

#line 1189
    dpdpv_1.differential_0 = _S2525;

#line 1189
    return;
}


#line 1189
void s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(inout DiffPair_0 dpdpthis_8, inout DiffPair_3 dpdpdirection_7, uint2 frameDim_4, DiffPair_float2_0 _s_dOut_13)
{

#line 297 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_float3_0 _S2526 = { dpdpdirection_7.primal_0.primal_0, dpdpdirection_7.primal_0.differential_0 };

#line 297
    float3 _S2527 = (float3)0.0;

#line 297
    DiffPair_float3_0 _S2528 = { gScene_0.camera_0.data_1.cameraW_0, _S2527 };

#line 297
    DiffPair_float3_0 _S2529 = { gScene_0.camera_0.data_1.cameraU_0, _S2527 };

#line 297
    DiffPair_float3_0 _S2530 = { gScene_0.camera_0.data_1.cameraV_0, _S2527 };

#line 297
    float2 _S2531 = float2(2.0, -2.0);

#line 297
    float2 _S2532 = _S2531 * _S2531;

#line 321
    float2 _S2533 = float2(frameDim_4);

#line 321
    DiffPair_float3_0 _S2534 = s_bwd_primal_s_fwd_safeNormalize_0(_S2526);

#line 321
    DiffPair_float_0 _S2535 = s_bwd_primal_d_dot_0(_S2528, _S2528);

#line 321
    float3 _S2536 = (float3)_S2535.primal_0;

#line 321
    float3 _S2537 = (float3)_S2535.differential_0;

#line 321
    float3 _S2538 = _S2534.primal_0 * _S2535.primal_0;

#line 321
    float3 _S2539 = _S2534.differential_0 * _S2535.primal_0 + _S2535.differential_0 * _S2534.primal_0;

#line 321
    DiffPair_float3_0 _S2540 = { _S2534.primal_0, _S2534.differential_0 };

#line 321
    DiffPair_float_0 _S2541 = s_bwd_primal_d_dot_0(_S2528, _S2540);

#line 321
    float3 _S2542 = (float3)_S2541.primal_0;

#line 321
    float3 _S2543 = (float3)_S2541.differential_0;

#line 321
    float _S2544 = _S2541.primal_0 * _S2541.primal_0;

#line 321
    float3 _S2545 = (float3)_S2544;

#line 321
    float3 _S2546 = _S2539 * _S2541.primal_0 - _S2538 * _S2541.differential_0;

#line 321
    float3 _S2547 = (float3)(_S2544 * _S2544);

#line 321
    DiffPair_float3_0 _S2548 = { _S2538 / _S2541.primal_0 - gScene_0.camera_0.data_1.cameraW_0, _S2546 / _S2544 };

#line 321
    DiffPair_float_0 _S2549 = s_bwd_primal_d_dot_0(_S2529, _S2529);

#line 321
    DiffPair_float_0 _S2550 = s_bwd_primal_d_dot_0(_S2530, _S2530);

#line 321
    float2 _S2551 = float2(_S2549.primal_0, _S2550.primal_0);

#line 321
    float2 _S2552 = _S2551 * _S2551;

#line 321
    float2 _S2553 = _S2552 * (_S2531 * (_S2532 * (_S2533 * _s_dOut_13.differential_0 / (_S2532 * _S2532))) / (_S2552 * _S2552));

#line 321
    float2 _S2554 = _S2551 * _S2553;

#line 321
    DiffPair_float3_0 _S2555 = { _S2527, _S2527 };

#line 1189 "core.meta.slang"
    float2 _S2556 = float2(_S2549.differential_0, _S2550.differential_0) * - _S2553 + _S2551 * (_S2531 * (_S2533 * _s_dOut_13.primal_0 / _S2532) / _S2552);

#line 1189
    DiffPair_float_0 _S2557 = { _S2556[int(1)], _S2554[int(1)] };

#line 1189
    DiffPair_3 _S2558;

#line 1189
    _S2558.primal_0 = _S2548;

#line 1189
    _S2558.differential_0 = _S2555;

#line 1189
    DiffPair_3 _S2559;

#line 1189
    _S2559.primal_0 = _S2530;

#line 1189
    _S2559.differential_0 = _S2555;

#line 1189
    s_bwd_d_dot_0(_S2558, _S2559, _S2557);

#line 1189
    DiffPair_float_0 _S2560 = { _S2556[int(0)], _S2554[int(0)] };

#line 1189
    DiffPair_3 _S2561;

#line 1189
    _S2561.primal_0 = _S2548;

#line 1189
    _S2561.differential_0 = _S2555;

#line 1189
    DiffPair_3 _S2562;

#line 1189
    _S2562.primal_0 = _S2529;

#line 1189
    _S2562.differential_0 = _S2555;

#line 1189
    s_bwd_d_dot_0(_S2561, _S2562, _S2560);

#line 1189
    float3 _S2563 = (_S2558.differential_0.differential_0 + _S2561.differential_0.differential_0) / _S2547;

#line 1189
    float3 _S2564 = _S2546 * - _S2563;

#line 1189
    float3 _S2565 = _S2545 * _S2563;

#line 1189
    float _S2566 = _S2541.primal_0 * (_S2564[int(0)] + _S2564[int(1)] + _S2564[int(2)]);

#line 1189
    float3 _S2567 = - _S2565;

#line 1189
    float3 _S2568 = _S2538 * _S2567;

#line 1189
    float3 _S2569 = _S2543 * _S2567;

#line 1189
    float3 _S2570 = _S2539 * _S2565;

#line 1189
    float3 _S2571 = _S2542 * _S2565;

#line 1189
    float3 _S2572 = (_S2558.differential_0.primal_0 + _S2561.differential_0.primal_0) / _S2545;

#line 1189
    float3 _S2573 = _S2538 * - _S2572;

#line 1189
    float3 _S2574 = _S2542 * _S2572;

#line 1189
    DiffPair_float_0 _S2575 = { _S2566 + _S2566 + _S2570[int(0)] + _S2570[int(1)] + _S2570[int(2)] + _S2573[int(0)] + _S2573[int(1)] + _S2573[int(2)], _S2568[int(0)] + _S2568[int(1)] + _S2568[int(2)] };

#line 1189
    DiffPair_3 _S2576;

#line 1189
    _S2576.primal_0 = _S2528;

#line 1189
    _S2576.differential_0 = _S2555;

#line 1189
    DiffPair_3 _S2577;

#line 1189
    _S2577.primal_0 = _S2540;

#line 1189
    _S2577.differential_0 = _S2555;

#line 1189
    s_bwd_d_dot_0(_S2576, _S2577, _S2575);

#line 1189
    DiffPair_float3_0 _S2578 = { _S2577.differential_0.primal_0 + _S2537 * _S2571 + _S2536 * (_S2569 + _S2574), _S2577.differential_0.differential_0 + _S2536 * _S2571 };

#line 1189
    DiffPair_3 _S2579;

#line 1189
    _S2579.primal_0 = _S2526;

#line 1189
    _S2579.differential_0 = _S2555;

#line 1189
    s_bwd_s_fwd_safeNormalize_0(_S2579, _S2578);

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2580 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2581 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 1189
    DiffPair_float3_0 _S2582 = { _S2579.differential_0.primal_0, _S2579.differential_0.differential_0 };

#line 1189
    dpdpdirection_7.primal_0 = dpdpdirection_7.primal_0;

#line 1189
    dpdpdirection_7.differential_0 = _S2582;

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S2583 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S2580, _S2581), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S2581, _S2581) };

#line 1189
    dpdpthis_8.primal_0 = dpdpthis_8.primal_0;

#line 1189
    dpdpthis_8.differential_0 = _S2583;

#line 1189
    return;
}


#line 1189
void s_bwd_s_fwd_normalize_impl_0(inout DiffPair_3 dpdpx_8, DiffPair_float3_0 _s_dOut_14)
{

#line 1189
    DiffPair_float3_0 _S2584 = { dpdpx_8.primal_0.primal_0, dpdpx_8.primal_0.differential_0 };

#line 1189
    DiffPair_float_0 _S2585 = s_bwd_primal_s_fwd_length_impl_0(_S2584);

#line 1189
    float3 _S2586 = (float3)(1.0 / _S2585.primal_0);

#line 1189
    float _S2587 = _S2585.primal_0 * _S2585.primal_0;

#line 1189
    float _S2588 = 0.0 - _S2585.differential_0;

#line 1189
    float3 _S2589 = (float3)(_S2588 / _S2587) * _s_dOut_14.differential_0;

#line 1189
    float3 _S2590 = dpdpx_8.primal_0.primal_0 * _s_dOut_14.differential_0;

#line 1189
    float3 _S2591 = dpdpx_8.primal_0.differential_0 * _s_dOut_14.differential_0;

#line 1189
    float3 _S2592 = _S2586 * _s_dOut_14.differential_0;

#line 1189
    float3 _S2593 = dpdpx_8.primal_0.primal_0 * _s_dOut_14.primal_0;

#line 1189
    float3 _S2594 = _S2586 * _s_dOut_14.primal_0;

#line 1189
    float _S2595 = (_S2590[int(0)] + _S2590[int(1)] + _S2590[int(2)]) / (_S2587 * _S2587);

#line 1189
    float _S2596 = _S2585.primal_0 * (_S2588 * - _S2595);

#line 1189
    DiffPair_float_0 _S2597 = { _S2596 + _S2596 + - ((_S2591[int(0)] + _S2591[int(1)] + _S2591[int(2)] + _S2593[int(0)] + _S2593[int(1)] + _S2593[int(2)]) / _S2587), - (_S2587 * _S2595) };

#line 208 "core"
    float3 _S2598 = (float3)0.0;

#line 208
    DiffPair_float3_0 _S2599 = { _S2598, _S2598 };

#line 208
    DiffPair_3 _S2600;

#line 208
    _S2600.primal_0 = _S2584;

#line 208
    _S2600.differential_0 = _S2599;

#line 208
    s_bwd_s_fwd_length_impl_0(_S2600, _S2597);

#line 208
    DiffPair_float3_0 _S2601 = { _S2589 + _S2594 + _S2600.differential_0.primal_0, _S2592 + _S2600.differential_0.differential_0 };

#line 208
    dpdpx_8.primal_0 = dpdpx_8.primal_0;

#line 208
    dpdpx_8.differential_0 = _S2601;

#line 208
    return;
}


#line 208
DiffPair_array_float3_1 _S2602()
{

#line 364 "diff.meta.slang"
    float3  _S2603[int(2)] = { (float3)0.0, (float3)0.0 };

#line 364
    DiffPair_array_float3_1 _S2604 = { _S2603, _S2603 };

#line 364
    return _S2604;
}


#line 364
struct DiffPair_5
{
    DiffPair_array_float3_1 primal_0;
    DiffPair_array_float3_1 differential_0;
};


#line 364
struct DiffPair_s_diff_s_diff_DiffRay_0
{
    s_diff_s_diff_DiffRay_0 primal_0;
    s_diff_s_diff_DiffRay_0 differential_0;
};


#line 364
DiffPair_s_diff_s_diff_DiffRay_0 _S2605()
{

#line 364
    s_diff_s_diff_DiffRay_0 _S2606 = DiffRay_x24_syn_dzero_0();

#line 364
    DiffPair_s_diff_s_diff_DiffRay_0 _S2607 = { _S2606, _S2606 };

#line 364
    return _S2607;
}


#line 364
void s_bwd_d_max_0(inout DiffPair_4 dpdpx_9, inout DiffPair_4 dpdpy_3, DiffPair_float_0 _s_dOut_15)
{

#line 364
    DiffPair_4 _S2608 = dpdpx_9;

#line 364
    DiffPair_4 _S2609 = dpdpy_3;

#line 364
    DiffPair_float_0 _S2610;

#line 364
    DiffPair_float_0 _S2611;

#line 364
    if(dpdpx_9.primal_0.primal_0 > dpdpy_3.primal_0.primal_0)
    {

#line 364
        _S2610.primal_0 = 0.0;

#line 364
        _S2610.differential_0 = 0.0;

#line 364
        _S2611.primal_0 = 0.0;

#line 364
        _S2611.differential_0 = _s_dOut_15.differential_0;

#line 364
    }
    else
    {

#line 364
        _S2610.primal_0 = 0.0;

#line 364
        _S2610.differential_0 = _s_dOut_15.differential_0;

#line 364
        _S2611.primal_0 = 0.0;

#line 364
        _S2611.differential_0 = 0.0;

#line 364
    }

#line 364
    DiffPair_float_0 _S2612;

#line 364
    _S2612.primal_0 = _S2608.primal_0.primal_0;

#line 364
    _S2612.differential_0 = 0.0;

#line 364
    DiffPair_float_0 _S2613;

#line 364
    _S2613.primal_0 = _S2609.primal_0.primal_0;

#line 364
    _S2613.differential_0 = 0.0;

#line 364
    s_bwd_max_1(_S2612, _S2613, _s_dOut_15.primal_0);

#line 364
    DiffPair_float_0 _S2614 = { _S2610.primal_0 + _S2613.differential_0, _S2610.differential_0 };

#line 364
    dpdpy_3.primal_0 = dpdpy_3.primal_0;

#line 364
    dpdpy_3.differential_0 = _S2614;

#line 364
    DiffPair_float_0 _S2615 = { _S2611.primal_0 + _S2612.differential_0, _S2611.differential_0 };

#line 364
    dpdpx_9.primal_0 = dpdpx_9.primal_0;

#line 364
    dpdpx_9.differential_0 = _S2615;

#line 364
    return;
}


#line 364
void s_bwd_clamp_1(inout DiffPair_float_0 _S2616, inout DiffPair_float_0 _S2617, inout DiffPair_float_0 _S2618, float _S2619)
{

#line 364
    _d_clamp_0(_S2616, _S2617, _S2618, _S2619);

#line 364
    return;
}


#line 364
void s_bwd_fwd_computeHarmonicWeightMisuba_0(inout DiffPair_IntersectionInfo_0 dpinfo_1, inout DiffPair_float3_0 dporigin_7, inout DiffPair_float3_0 dpauxDirection_1, inout DiffPair_float_0 dpauxSampleY_1, inout DiffPair_float_0 dpkappa_1, inout DiffPair_3 dpdirection_7, DiffPair_float_0 _s_dOut_16, s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _s_diff_ctx_19)
{

#line 364
    float _S2620 = -2.0 * dpkappa_1.primal_0;

#line 364
    float _S2621 = ReparamCB_0.gVMFConcentration_0;

#line 364
    float _S2622 = s_bwd_exp_0(_S2620);

#line 364
    float _S2623 = dpauxSampleY_1.primal_0 * _S2622 + (1.0 - dpauxSampleY_1.primal_0);

#line 364
    float invVMFDensity_1 = 1.0 / _S2623;

#line 364
    float _S2624 = _S2623 * _S2623;

#line 364
    float wDenom_1 = invVMFDensity_1 - 1.0 + _s_diff_ctx_19.boundaryTerm_0;

#line 364
    bool _S2625 = wDenom_1 > 0.00009999999747378752;

#line 364
    float _S2626 = wDenom_1 * wDenom_1;

#line 364
    float wDenomRCP_1 = _S2625 ? 1.0 / wDenom_1 : 0.0;

#line 364
    float _S2627 = wDenomRCP_1 * wDenomRCP_1;

#line 364
    float _S2628 = _S2627 * wDenomRCP_1;

#line 364
    float w_1 = _S2628 * invVMFDensity_1;

#line 364
    float _S2629 = invVMFDensity_1 * w_1;

#line 364
    float tmp1_0 = _S2629 * wDenomRCP_1 * _S2621 * 3.0;

#line 364
    float3 _S2630 = s_bwd_cross_0(dpdirection_7.primal_0.primal_0, dpdirection_7.primal_0.differential_0);

#line 364
    float3 tmp2_0 = - s_bwd_cross_0(dpdirection_7.primal_0.primal_0, _S2630);

#line 364
    float _S2631 = s_bwd_dot_0(tmp2_0, dpauxDirection_1.primal_0);

#line 364
    DiffPair_float_0 _S2632;

#line 364
    _S2632.primal_0 = tmp1_0 * _S2631;

#line 364
    _S2632.differential_0 = 0.0;

#line 364
    DiffPair_float_0 _S2633;

#line 364
    _S2633.primal_0 = -10000000000.0;

#line 364
    _S2633.differential_0 = 0.0;

#line 364
    DiffPair_float_0 _S2634;

#line 364
    _S2634.primal_0 = 10000000000.0;

#line 364
    _S2634.differential_0 = 0.0;

#line 364
    s_bwd_clamp_1(_S2632, _S2633, _S2634, _s_dOut_16.differential_0);

#line 364
    float _S2635 = tmp1_0 * _S2632.differential_0;

#line 364
    float s_diff_tmp1_T_0 = _S2631 * _S2632.differential_0;

#line 1182 "core.meta.slang"
    float3 _S2636 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2637;

#line 1182
    _S2637.primal_0 = tmp2_0;

#line 1182
    _S2637.differential_0 = _S2636;

#line 1182
    DiffPair_float3_0 _S2638;

#line 1182
    _S2638.primal_0 = dpauxDirection_1.primal_0;

#line 1182
    _S2638.differential_0 = _S2636;

#line 1182
    s_bwd_dot_2(_S2637, _S2638, _S2635);

#line 1182
    float3 _S2639 = - _S2637.differential_0;

#line 1182
    DiffPair_float3_0 _S2640;

#line 1182
    _S2640.primal_0 = dpdirection_7.primal_0.primal_0;

#line 1182
    _S2640.differential_0 = _S2636;

#line 1182
    DiffPair_float3_0 _S2641;

#line 1182
    _S2641.primal_0 = _S2630;

#line 1182
    _S2641.differential_0 = _S2636;

#line 1182
    s_bwd_cross_1(_S2640, _S2641, _S2639);

#line 1182
    DiffPair_float3_0 _S2642;

#line 1182
    _S2642.primal_0 = dpdirection_7.primal_0.primal_0;

#line 1182
    _S2642.differential_0 = _S2636;

#line 1182
    DiffPair_float3_0 _S2643;

#line 1182
    _S2643.primal_0 = dpdirection_7.primal_0.differential_0;

#line 1182
    _S2643.differential_0 = _S2636;

#line 1182
    s_bwd_cross_1(_S2642, _S2643, _S2641.differential_0);

#line 1182
    float _S2644 = _S2621 * (3.0 * s_diff_tmp1_T_0);

#line 1182
    float _S2645 = wDenomRCP_1 * _S2644;

#line 483
    float _S2646 = _s_dOut_16.primal_0 + invVMFDensity_1 * _S2645;

#line 483
    float _S2647 = invVMFDensity_1 * _S2646;

#line 483
    float _S2648 = wDenomRCP_1 * (wDenomRCP_1 * _S2647);

#line 483
    float _S2649 = - ((w_1 * _S2645 + _S2628 * _S2646 + - ((_S2625 ? _S2629 * _S2644 + _S2627 * _S2647 + _S2648 + _S2648 : 0.0) / _S2626)) / _S2624);

#line 483
    float _S2650 = - _S2649;

#line 483
    float _S2651 = dpauxSampleY_1.primal_0 * _S2649;

#line 483
    float _S2652 = _S2622 * _S2649;

#line 483
    DiffPair_float_0 _S2653;

#line 483
    _S2653.primal_0 = _S2620;

#line 483
    _S2653.differential_0 = 0.0;

#line 483
    s_bwd_exp_1(_S2653, _S2651);

#line 483
    float _S2654 = -2.0 * _S2653.differential_0;

#line 483
    DiffPair_float3_0 _S2655 = { _S2642.differential_0 + _S2640.differential_0, _S2643.differential_0 };

#line 483
    dpdirection_7.primal_0 = dpdirection_7.primal_0;

#line 483
    dpdirection_7.differential_0 = _S2655;

#line 483
    dpkappa_1.primal_0 = dpkappa_1.primal_0;

#line 483
    dpkappa_1.differential_0 = _S2654;

#line 483
    float _S2656 = _S2650 + _S2652;

#line 483
    dpauxSampleY_1.primal_0 = dpauxSampleY_1.primal_0;

#line 483
    dpauxSampleY_1.differential_0 = _S2656;

#line 483
    dpauxDirection_1.primal_0 = dpauxDirection_1.primal_0;

#line 483
    dpauxDirection_1.differential_0 = _S2638.differential_0;

#line 483
    dporigin_7.primal_0 = dporigin_7.primal_0;

#line 483
    dporigin_7.differential_0 = _S2636;

#line 483
    s_diff_s_diff_IntersectionInfo_0 _S2657 = IntersectionInfo_x24_syn_dzero_0();

#line 483
    dpinfo_1.primal_0 = dpinfo_1.primal_0;

#line 483
    dpinfo_1.differential_0 = _S2657;

#line 483
    return;
}


#line 483
struct DiffPair_s_diff_s_diff_IntersectionInfo_0
{
    s_diff_s_diff_IntersectionInfo_0 primal_0;
    s_diff_s_diff_IntersectionInfo_0 differential_0;
};


#line 483
struct DiffPair_6
{
    DiffPair_DiffRay_0 primal_0;
    DiffPair_s_diff_s_diff_DiffRay_0 differential_0;
};


#line 206 "core"
DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2658()
{

#line 206
    s_diff_s_diff_SceneDerivativeFlags_0 _S2659 = SceneDerivativeFlags_dzero_0();

#line 206
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2660 = { _S2659, _S2659 };

#line 206
    return _S2660;
}


#line 206
struct DiffPair_7
{
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 primal_0;
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 differential_0;
};


#line 206
void s_bwd_FalcorSceneIO_fwd_loadVertexNormalsW_0(inout DiffPair_7 dpflags_2, GeometryInstanceID_0 instanceID_21, uint triangleID_13, DiffPair_float3_0 dpn0_1, DiffPair_float3_0 dpn1_1, DiffPair_float3_0 dpn2_1)
{

#line 38 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
    s_diff_s_diff_SceneDerivativeFlags_0 _S2661 = SceneDerivativeFlags_dzero_0();

#line 38
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2662;

#line 38
    _S2662.primal_0 = dpflags_2.primal_0.primal_0;

#line 38
    _S2662.differential_0 = _S2661;

#line 38
    s_bwd_FalcorSceneIO_loadVertexNormalsW_1(_S2662, instanceID_21, triangleID_13, dpn0_1.primal_0, dpn1_1.primal_0, dpn2_1.primal_0);

#line 38
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2663 = { SceneDerivativeFlags_dadd_0(_S2661, _S2662.differential_0), SceneDerivativeFlags_dadd_0(_S2661, _S2661) };

#line 38
    dpflags_2.primal_0 = dpflags_2.primal_0;

#line 38
    dpflags_2.differential_0 = _S2663;

#line 38
    return;
}


#line 38
void s_bwd_s_fwd_DifferentiableSceneQuery_computeShadingNormal_0(inout DiffPair_0 dpdpthis_9, GeometryInstanceID_0 instanceID_22, uint primitiveIndex_6, inout DiffPair_3 dpdpbarycentrics_3, DiffPair_float3_0 _s_dOut_17)
{

#line 241 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2664 = { dpdpthis_9.primal_0.primal_0.gradientFlags_1, dpdpthis_9.primal_0.differential_0.gradientFlags_0 };

#line 241
    float3 _S2665 = (float3)0.0;

#line 241
    float _S2666 = dpdpbarycentrics_3.primal_0.primal_0.x;

#line 241
    float _S2667 = dpdpbarycentrics_3.primal_0.differential_0.x;

#line 241
    float _S2668 = dpdpbarycentrics_3.primal_0.primal_0.y;

#line 241
    float _S2669 = dpdpbarycentrics_3.primal_0.differential_0.y;

#line 241
    float _S2670 = dpdpbarycentrics_3.primal_0.primal_0.z;

#line 241
    float _S2671 = dpdpbarycentrics_3.primal_0.differential_0.z;

#line 241
    DiffPair_float3_0 _S2672;

#line 241
    _S2672.primal_0 = _S2665;

#line 241
    _S2672.differential_0 = _S2665;

#line 241
    DiffPair_float3_0 _S2673;

#line 241
    _S2673.primal_0 = _S2665;

#line 241
    _S2673.differential_0 = _S2665;

#line 241
    DiffPair_float3_0 _S2674;

#line 241
    _S2674.primal_0 = _S2665;

#line 241
    _S2674.differential_0 = _S2665;

#line 241
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexNormalsW_0(_S2664, instanceID_22, primitiveIndex_6, _S2672, _S2673, _S2674);

#line 241
    float3 _S2675 = (float3)_S2666;

#line 241
    float3 _S2676 = (float3)_S2668;

#line 241
    float3 _S2677 = (float3)_S2670;

#line 241
    float3 _S2678 = _S2674.primal_0 * _s_dOut_17.differential_0;

#line 241
    float3 _S2679 = _S2674.differential_0 * _s_dOut_17.differential_0;

#line 241
    float3 _S2680 = _S2674.primal_0 * _s_dOut_17.primal_0;

#line 483 "core.meta.slang"
    float _S2681 = _S2678[int(0)] + _S2678[int(1)] + _S2678[int(2)];

#line 483
    float _S2682 = _S2679[int(0)] + _S2679[int(1)] + _S2679[int(2)] + _S2680[int(0)] + _S2680[int(1)] + _S2680[int(2)];

#line 483
    float3 _S2683 = _S2673.primal_0 * _s_dOut_17.differential_0;

#line 483
    float3 _S2684 = _S2673.differential_0 * _s_dOut_17.differential_0;

#line 483
    float3 _S2685 = _S2673.primal_0 * _s_dOut_17.primal_0;

#line 483
    float _S2686 = _S2683[int(0)] + _S2683[int(1)] + _S2683[int(2)];

#line 483
    float _S2687 = _S2684[int(0)] + _S2684[int(1)] + _S2684[int(2)] + _S2685[int(0)] + _S2685[int(1)] + _S2685[int(2)];

#line 483
    float3 _S2688 = _S2672.primal_0 * _s_dOut_17.differential_0;

#line 483
    float3 _S2689 = _S2672.differential_0 * _s_dOut_17.differential_0;

#line 483
    float3 _S2690 = _S2672.primal_0 * _s_dOut_17.primal_0;

#line 483
    float _S2691 = _S2688[int(0)] + _S2688[int(1)] + _S2688[int(2)];

#line 483
    float _S2692 = _S2689[int(0)] + _S2689[int(1)] + _S2689[int(2)] + _S2690[int(0)] + _S2690[int(1)] + _S2690[int(2)];

#line 483
    DiffPair_float3_0 _S2693 = { (float3)_S2671 * _s_dOut_17.differential_0 + _S2677 * _s_dOut_17.primal_0, _S2677 * _s_dOut_17.differential_0 };

#line 483
    DiffPair_float3_0 _S2694 = { (float3)_S2669 * _s_dOut_17.differential_0 + _S2676 * _s_dOut_17.primal_0, _S2676 * _s_dOut_17.differential_0 };

#line 483
    DiffPair_float3_0 _S2695 = { (float3)_S2667 * _s_dOut_17.differential_0 + _S2675 * _s_dOut_17.primal_0, _S2675 * _s_dOut_17.differential_0 };

#line 483
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2696 = _S2658();

#line 483
    DiffPair_7 _S2697;

#line 483
    _S2697.primal_0 = _S2664;

#line 483
    _S2697.differential_0 = _S2696;

#line 483
    s_bwd_FalcorSceneIO_fwd_loadVertexNormalsW_0(_S2697, instanceID_22, primitiveIndex_6, _S2695, _S2694, _S2693);

#line 1189
    float3 _S2698 = float3(0.0, 0.0, _S2682) + float3(0.0, _S2687, 0.0) + float3(_S2692, 0.0, 0.0);

#line 1189
    float3 _S2699 = float3(0.0, 0.0, _S2681) + float3(0.0, _S2686, 0.0) + float3(_S2691, 0.0, 0.0);

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2700 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    _S2700.gradientFlags_0 = _S2697.differential_0.primal_0;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2701 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2702 = _S2701;

#line 1189
    _S2702.gradientFlags_0 = _S2697.differential_0.differential_0;

#line 1189
    DiffPair_float3_0 _S2703 = { _S2698, _S2699 };

#line 1189
    dpdpbarycentrics_3.primal_0 = dpdpbarycentrics_3.primal_0;

#line 1189
    dpdpbarycentrics_3.differential_0 = _S2703;

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S2704 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S2700, _S2701), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S2701, _S2702) };

#line 1189
    dpdpthis_9.primal_0 = dpdpthis_9.primal_0;

#line 1189
    dpdpthis_9.differential_0 = _S2704;

#line 1189
    return;
}


#line 1189
void s_bwd_d_cross_0(inout DiffPair_3 dpa_1, inout DiffPair_3 dpb_1, DiffPair_float3_0 _s_dOut_18)
{

#line 1189
    float _S2705 = dpa_1.primal_0.primal_0.y;

#line 1189
    float _S2706 = dpb_1.primal_0.primal_0.z;

#line 1189
    float aybz_1 = _S2705 * _S2706;

#line 1189
    float _S2707 = dpa_1.primal_0.primal_0.z;

#line 1189
    float _S2708 = dpb_1.primal_0.primal_0.y;

#line 1189
    float azby_1 = _S2707 * _S2708;

#line 1189
    float _S2709 = dpa_1.primal_0.differential_0.y;

#line 1189
    float _S2710 = dpb_1.primal_0.differential_0.z;

#line 1189
    float _S2711 = dpa_1.primal_0.differential_0.z;

#line 1189
    float _S2712 = dpb_1.primal_0.differential_0.y;

#line 1189
    float _S2713 = dpb_1.primal_0.primal_0.x;

#line 1189
    float azbx_1 = _S2707 * _S2713;

#line 1189
    float _S2714 = dpa_1.primal_0.primal_0.x;

#line 1189
    float axbz_1 = _S2714 * _S2706;

#line 1189
    float _S2715 = dpb_1.primal_0.differential_0.x;

#line 1189
    float _S2716 = dpa_1.primal_0.differential_0.x;

#line 1189
    float axby_1 = _S2714 * _S2708;

#line 1189
    float aybx_1 = _S2705 * _S2713;

#line 1189
    float _S2717 = _S2715 * _s_dOut_18.differential_0[int(2)];

#line 1189
    float3 _S2718 = float3(0.0, - _S2717, 0.0);

#line 1189
    float _S2719 = _S2709 * _s_dOut_18.differential_0[int(2)];

#line 1189
    float3 _S2720 = float3(0.0, (axby_1 - _S2713) * _s_dOut_18.differential_0[int(2)], 0.0);

#line 1189
    float _S2721 = _S2712 * _s_dOut_18.differential_0[int(2)];

#line 1189
    float3 _S2722 = float3(_S2721, 0.0, 0.0);

#line 1189
    float _S2723 = _S2716 * _s_dOut_18.differential_0[int(2)];

#line 1189
    float3 _S2724 = float3((_S2708 - aybx_1) * _s_dOut_18.differential_0[int(2)], 0.0, 0.0);

#line 483
    float _S2725 = - _S2721 + - _S2723 + - _s_dOut_18.primal_0[int(2)];

#line 483
    float3 _S2726 = float3(0.0, _S2713 * _S2725, 0.0);

#line 483
    float _S2727 = _S2717 + _S2719 + _s_dOut_18.primal_0[int(2)];

#line 483
    float3 _S2728 = float3(_S2708 * _S2727, 0.0, 0.0);

#line 483
    float _S2729 = _S2710 * _s_dOut_18.differential_0[int(1)];

#line 483
    float3 _S2730 = float3(- _S2729, 0.0, 0.0);

#line 483
    float _S2731 = _S2716 * _s_dOut_18.differential_0[int(1)];

#line 483
    float3 _S2732 = float3((azbx_1 - _S2706) * _s_dOut_18.differential_0[int(1)], 0.0, 0.0);

#line 483
    float _S2733 = _S2715 * _s_dOut_18.differential_0[int(1)];

#line 483
    float3 _S2734 = float3(0.0, 0.0, _S2733);

#line 483
    float _S2735 = _S2711 * _s_dOut_18.differential_0[int(1)];

#line 483
    float3 _S2736 = float3(0.0, 0.0, (_S2713 - axbz_1) * _s_dOut_18.differential_0[int(1)]);

#line 483
    float _S2737 = - _S2733 + - _S2735 + - _s_dOut_18.primal_0[int(1)];

#line 483
    float3 _S2738 = float3(_S2706 * _S2737, 0.0, 0.0);

#line 483
    float _S2739 = _S2729 + _S2731 + _s_dOut_18.primal_0[int(1)];

#line 483
    float3 _S2740 = float3(0.0, 0.0, _S2713 * _S2739);

#line 483
    float _S2741 = _S2712 * _s_dOut_18.differential_0[int(0)];

#line 483
    float3 _S2742 = float3(0.0, 0.0, - _S2741);

#line 483
    float _S2743 = _S2711 * _s_dOut_18.differential_0[int(0)];

#line 483
    float3 _S2744 = float3(0.0, 0.0, (aybz_1 - _S2708) * _s_dOut_18.differential_0[int(0)]);

#line 483
    float _S2745 = _S2710 * _s_dOut_18.differential_0[int(0)];

#line 483
    float3 _S2746 = float3(0.0, _S2745, 0.0);

#line 483
    float _S2747 = _S2709 * _s_dOut_18.differential_0[int(0)];

#line 483
    float3 _S2748 = float3(0.0, (_S2706 - azby_1) * _s_dOut_18.differential_0[int(0)], 0.0);

#line 483
    float _S2749 = - _S2745 + - _S2747 + - _s_dOut_18.primal_0[int(0)];

#line 483
    float3 _S2750 = float3(0.0, 0.0, _S2708 * _S2749);

#line 483
    float _S2751 = _S2741 + _S2743 + _s_dOut_18.primal_0[int(0)];

#line 483
    float3 _S2752 = float3(0.0, _S2706 * _S2751, 0.0);

#line 483
    DiffPair_float3_0 _S2753 = { float3(- _S2719, 0.0, 0.0) + float3(0.0, _S2723, 0.0) + float3(_S2705 * _S2725, 0.0, 0.0) + float3(0.0, _S2714 * _S2727, 0.0) + float3(0.0, 0.0, - _S2731) + float3(_S2735, 0.0, 0.0) + float3(0.0, 0.0, _S2714 * _S2737) + float3(_S2707 * _S2739, 0.0, 0.0) + float3(0.0, - _S2743, 0.0) + float3(0.0, 0.0, _S2747) + float3(0.0, _S2707 * _S2749, 0.0) + float3(0.0, 0.0, _S2705 * _S2751), float3((axby_1 - _S2705) * _s_dOut_18.differential_0[int(2)], 0.0, 0.0) + float3(0.0, (_S2714 - aybx_1) * _s_dOut_18.differential_0[int(2)], 0.0) + float3(0.0, 0.0, (azbx_1 - _S2714) * _s_dOut_18.differential_0[int(1)]) + float3((_S2707 - axbz_1) * _s_dOut_18.differential_0[int(1)], 0.0, 0.0) + float3(0.0, (aybz_1 - _S2707) * _s_dOut_18.differential_0[int(0)], 0.0) + float3(0.0, 0.0, (_S2705 - azby_1) * _s_dOut_18.differential_0[int(0)]) };

#line 483
    dpb_1.primal_0 = dpb_1.primal_0;

#line 483
    dpb_1.differential_0 = _S2753;

#line 483
    DiffPair_float3_0 _S2754 = { _S2718 + _S2722 + _S2726 + _S2728 + _S2730 + _S2734 + _S2738 + _S2740 + _S2742 + _S2746 + _S2750 + _S2752, _S2720 + _S2724 + _S2732 + _S2736 + _S2744 + _S2748 };

#line 483
    dpa_1.primal_0 = dpa_1.primal_0;

#line 483
    dpa_1.differential_0 = _S2754;

#line 483
    return;
}


#line 483
void s_bwd_FalcorSceneIO_fwd_loadVertexPositionsW_0(inout DiffPair_7 dpflags_3, GeometryInstanceID_0 instanceID_23, uint triangleID_14, DiffPair_float3_0 dpv0_5, DiffPair_float3_0 dpv1_5, DiffPair_float3_0 dpv2_5, uint2 pixel_12)
{

#line 106 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/FalcorSceneIO.slang"
    s_diff_s_diff_SceneDerivativeFlags_0 _S2755 = SceneDerivativeFlags_dzero_0();

#line 106
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2756;

#line 106
    _S2756.primal_0 = dpflags_3.primal_0.primal_0;

#line 106
    _S2756.differential_0 = _S2755;

#line 106
    s_bwd_FalcorSceneIO_loadVertexPositionsW_1(_S2756, instanceID_23, triangleID_14, dpv0_5.primal_0, dpv1_5.primal_0, dpv2_5.primal_0, pixel_12);

#line 106
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2757 = { SceneDerivativeFlags_dadd_0(_S2755, _S2756.differential_0), SceneDerivativeFlags_dadd_0(_S2755, _S2755) };

#line 106
    dpflags_3.primal_0 = dpflags_3.primal_0;

#line 106
    dpflags_3.differential_0 = _S2757;

#line 106
    return;
}


#line 106
void s_bwd_s_fwd_DifferentiableSceneQuery_loadVertexPosW_0(inout DiffPair_0 dpdpthis_10, GeometryInstanceID_0 instanceID_24, uint triangleID_15, float3 barycentrics_9, DiffPair_float3_0 dpdpfaceNormalW_2, uint2 pixel_13, DiffPair_float3_0 _s_dOut_19)
{

#line 254 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2758 = { dpdpthis_10.primal_0.primal_0.gradientFlags_1, dpdpthis_10.primal_0.differential_0.gradientFlags_0 };

#line 254
    float3 _S2759 = (float3)0.0;

#line 254
    DiffPair_float3_0 _S2760 = { _S2759, _S2759 };

#line 254
    float _S2761 = barycentrics_9.x;

#line 254
    float _S2762 = barycentrics_9.y;

#line 254
    float _S2763 = barycentrics_9.z;

#line 254
    DiffPair_float3_0 _S2764;

#line 254
    _S2764.primal_0 = _S2759;

#line 254
    _S2764.differential_0 = _S2759;

#line 254
    DiffPair_float3_0 _S2765;

#line 254
    _S2765.primal_0 = _S2759;

#line 254
    _S2765.differential_0 = _S2759;

#line 254
    DiffPair_float3_0 _S2766;

#line 254
    _S2766.primal_0 = _S2759;

#line 254
    _S2766.differential_0 = _S2759;

#line 254
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S2758, instanceID_24, triangleID_15, _S2764, _S2765, _S2766, pixel_13);

#line 254
    float3 _S2767 = (float3)_S2761;

#line 254
    float3 _S2768 = (float3)_S2762;

#line 254
    float3 _S2769 = (float3)_S2763;

#line 254
    DiffPair_float3_0 _S2770 = { _S2765.primal_0 - _S2764.primal_0, _S2765.differential_0 - _S2764.differential_0 };

#line 254
    DiffPair_float3_0 _S2771 = { _S2766.primal_0 - _S2764.primal_0, _S2766.differential_0 - _S2764.differential_0 };

#line 254
    DiffPair_float3_0 _S2772 = s_bwd_primal_d_cross_0(_S2770, _S2771);

#line 254
    DiffPair_float3_0 _S2773 = { _S2772.primal_0, _S2772.differential_0 };

#line 254
    DiffPair_float3_0 _S2774 = { dpdpfaceNormalW_2.primal_0, dpdpfaceNormalW_2.differential_0 };

#line 254
    DiffPair_3 _S2775;

#line 254
    _S2775.primal_0 = _S2773;

#line 254
    _S2775.differential_0 = _S2760;

#line 254
    s_bwd_s_fwd_normalize_impl_0(_S2775, _S2774);

#line 254
    DiffPair_float3_0 _S2776 = { _S2775.differential_0.primal_0, _S2775.differential_0.differential_0 };

#line 254
    DiffPair_3 _S2777;

#line 254
    _S2777.primal_0 = _S2770;

#line 254
    _S2777.differential_0 = _S2760;

#line 254
    DiffPair_3 _S2778;

#line 254
    _S2778.primal_0 = _S2771;

#line 254
    _S2778.differential_0 = _S2760;

#line 254
    s_bwd_d_cross_0(_S2777, _S2778, _S2776);

#line 254
    DiffPair_float3_0 _S2779 = { _S2778.differential_0.primal_0 + _S2769 * _s_dOut_19.primal_0, _S2778.differential_0.differential_0 + _S2769 * _s_dOut_19.differential_0 };

#line 254
    DiffPair_float3_0 _S2780 = { _S2777.differential_0.primal_0 + _S2768 * _s_dOut_19.primal_0, _S2777.differential_0.differential_0 + _S2768 * _s_dOut_19.differential_0 };

#line 254
    DiffPair_float3_0 _S2781 = { - _S2778.differential_0.primal_0 + - _S2777.differential_0.primal_0 + _S2767 * _s_dOut_19.primal_0, - _S2778.differential_0.differential_0 + - _S2777.differential_0.differential_0 + _S2767 * _s_dOut_19.differential_0 };

#line 254
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2782 = _S2658();

#line 254
    DiffPair_7 _S2783;

#line 254
    _S2783.primal_0 = _S2758;

#line 254
    _S2783.differential_0 = _S2782;

#line 254
    s_bwd_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S2783, instanceID_24, triangleID_15, _S2781, _S2780, _S2779, pixel_13);

#line 254
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2784 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 254
    _S2784.gradientFlags_0 = _S2783.differential_0.primal_0;

#line 254
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2785 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 254
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2786 = _S2785;

#line 254
    _S2786.gradientFlags_0 = _S2783.differential_0.differential_0;

#line 254
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S2787 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S2784, _S2785), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S2785, _S2786) };

#line 254
    dpdpthis_10.primal_0 = dpdpthis_10.primal_0;

#line 254
    dpdpthis_10.differential_0 = _S2787;

#line 254
    return;
}


#line 254
void s_bwd_s_fwd_computeBarycentrics_0(inout DiffPair_3 dpdpv0_2, inout DiffPair_3 dpdpv1_2, inout DiffPair_3 dpdpv2_2, inout DiffPair_3 dpdporigin_6, inout DiffPair_3 dpdpdirection_8, inout DiffPair_4 dpdpt_2, DiffPair_float3_0 dpdpbarycentrics_4)
{

#line 254
    float3 p_7 = dpdporigin_6.primal_0.primal_0 + dpdpdirection_8.primal_0.primal_0 * dpdpt_2.primal_0.primal_0;

#line 254
    float3 s_diff_p_1 = dpdporigin_6.primal_0.differential_0 + (dpdpdirection_8.primal_0.differential_0 * dpdpt_2.primal_0.primal_0 + dpdpt_2.primal_0.differential_0 * dpdpdirection_8.primal_0.primal_0);

#line 254
    DiffPair_float3_0 _S2788 = { dpdpv1_2.primal_0.primal_0 - p_7, dpdpv1_2.primal_0.differential_0 - s_diff_p_1 };

#line 254
    DiffPair_float3_0 _S2789 = { dpdpv2_2.primal_0.primal_0 - p_7, dpdpv2_2.primal_0.differential_0 - s_diff_p_1 };

#line 254
    DiffPair_float3_0 _S2790 = { dpdpv0_2.primal_0.primal_0 - p_7, dpdpv0_2.primal_0.differential_0 - s_diff_p_1 };

#line 254
    float3 _S2791 = (float3)dpdpt_2.primal_0.differential_0;

#line 254
    float3 _S2792 = (float3)dpdpt_2.primal_0.primal_0;

#line 254
    DiffPair_float3_0 _S2793 = s_bwd_primal_d_cross_0(_S2788, _S2789);

#line 254
    DiffPair_float3_0 _S2794 = { _S2793.primal_0, _S2793.differential_0 };

#line 254
    DiffPair_float_0 _S2795 = s_bwd_primal_s_fwd_length_impl_0(_S2794);

#line 254
    DiffPair_float3_0 _S2796 = s_bwd_primal_d_cross_0(_S2789, _S2790);

#line 254
    DiffPair_float3_0 _S2797 = { _S2796.primal_0, _S2796.differential_0 };

#line 254
    DiffPair_float_0 _S2798 = s_bwd_primal_s_fwd_length_impl_0(_S2797);

#line 254
    DiffPair_float3_0 _S2799 = s_bwd_primal_d_cross_0(_S2790, _S2788);

#line 254
    DiffPair_float3_0 _S2800 = { _S2799.primal_0, _S2799.differential_0 };

#line 254
    DiffPair_float_0 _S2801 = s_bwd_primal_s_fwd_length_impl_0(_S2800);

#line 254
    float area_5 = _S2795.primal_0 + _S2798.primal_0 + _S2801.primal_0;

#line 254
    float s_diff_area_1 = _S2795.differential_0 + _S2798.differential_0 + _S2801.differential_0;

#line 254
    float _S2802 = area_5 * area_5;

#line 254
    float _S2803 = _S2802 * _S2802;

#line 1182 "core.meta.slang"
    float3 _S2804 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S2805 = { _S2804, _S2804 };

#line 1182
    float _S2806 = dpdpbarycentrics_4.differential_0[int(2)] / _S2803;

#line 1182
    float _S2807 = _S2802 * _S2806;

#line 1182
    float _S2808 = - _S2807;

#line 1182
    float _S2809 = dpdpbarycentrics_4.primal_0[int(2)] / _S2802;

#line 1182
    float _S2810 = dpdpbarycentrics_4.differential_0[int(1)] / _S2803;

#line 1182
    float _S2811 = _S2802 * _S2810;

#line 1182
    float _S2812 = - _S2811;

#line 1182
    float _S2813 = s_diff_area_1 * _S2812;

#line 1182
    float _S2814 = area_5 * _S2811;

#line 1182
    float _S2815 = dpdpbarycentrics_4.primal_0[int(1)] / _S2802;

#line 1182
    float _S2816 = area_5 * _S2815;

#line 1182
    float _S2817 = dpdpbarycentrics_4.differential_0[int(0)] / _S2803;

#line 1182
    float _S2818 = _S2802 * _S2817;

#line 1182
    float _S2819 = area_5 * ((_S2801.differential_0 * area_5 - _S2801.primal_0 * s_diff_area_1) * - _S2806 + (_S2798.differential_0 * area_5 - _S2798.primal_0 * s_diff_area_1) * - _S2810 + (_S2795.differential_0 * area_5 - _S2795.primal_0 * s_diff_area_1) * - _S2817);

#line 1182
    float _S2820 = - _S2818;

#line 1182
    float _S2821 = s_diff_area_1 * _S2820;

#line 1182
    float _S2822 = area_5 * _S2818;

#line 1182
    float _S2823 = dpdpbarycentrics_4.primal_0[int(0)] / _S2802;

#line 1182
    float _S2824 = area_5 * _S2823;

#line 483
    float _S2825 = _S2801.primal_0 * _S2808 + _S2798.primal_0 * _S2812 + _S2795.primal_0 * _S2820;

#line 483
    float _S2826 = _S2801.differential_0 * _S2807 + _S2801.primal_0 * - _S2809 + _S2798.differential_0 * _S2811 + _S2798.primal_0 * - _S2815 + _S2819 + _S2819 + _S2795.differential_0 * _S2818 + _S2795.primal_0 * - _S2823;

#line 483
    DiffPair_float_0 _S2827 = { s_diff_area_1 * _S2808 + area_5 * _S2809 + _S2826, area_5 * _S2807 + _S2825 };

#line 483
    DiffPair_3 _S2828;

#line 483
    _S2828.primal_0 = _S2800;

#line 483
    _S2828.differential_0 = _S2805;

#line 483
    s_bwd_s_fwd_length_impl_0(_S2828, _S2827);

#line 483
    DiffPair_float3_0 _S2829 = { _S2828.differential_0.primal_0, _S2828.differential_0.differential_0 };

#line 483
    DiffPair_3 _S2830;

#line 483
    _S2830.primal_0 = _S2790;

#line 483
    _S2830.differential_0 = _S2805;

#line 483
    DiffPair_3 _S2831;

#line 483
    _S2831.primal_0 = _S2788;

#line 483
    _S2831.differential_0 = _S2805;

#line 483
    s_bwd_d_cross_0(_S2830, _S2831, _S2829);

#line 483
    DiffPair_float_0 _S2832 = { _S2813 + _S2816 + _S2826, _S2814 + _S2825 };

#line 483
    DiffPair_3 _S2833;

#line 483
    _S2833.primal_0 = _S2797;

#line 483
    _S2833.differential_0 = _S2805;

#line 483
    s_bwd_s_fwd_length_impl_0(_S2833, _S2832);

#line 483
    DiffPair_float3_0 _S2834 = { _S2833.differential_0.primal_0, _S2833.differential_0.differential_0 };

#line 483
    DiffPair_3 _S2835;

#line 483
    _S2835.primal_0 = _S2789;

#line 483
    _S2835.differential_0 = _S2805;

#line 483
    DiffPair_3 _S2836;

#line 483
    _S2836.primal_0 = _S2790;

#line 483
    _S2836.differential_0 = _S2805;

#line 483
    s_bwd_d_cross_0(_S2835, _S2836, _S2834);

#line 483
    DiffPair_float_0 _S2837 = { _S2821 + _S2824 + _S2826, _S2822 + _S2825 };

#line 483
    DiffPair_3 _S2838;

#line 483
    _S2838.primal_0 = _S2794;

#line 483
    _S2838.differential_0 = _S2805;

#line 483
    s_bwd_s_fwd_length_impl_0(_S2838, _S2837);

#line 483
    DiffPair_float3_0 _S2839 = { _S2838.differential_0.primal_0, _S2838.differential_0.differential_0 };

#line 483
    DiffPair_3 _S2840;

#line 483
    _S2840.primal_0 = _S2788;

#line 483
    _S2840.differential_0 = _S2805;

#line 483
    DiffPair_3 _S2841;

#line 483
    _S2841.primal_0 = _S2789;

#line 483
    _S2841.differential_0 = _S2805;

#line 483
    s_bwd_d_cross_0(_S2840, _S2841, _S2839);

#line 1189
    float3 _S2842 = _S2835.differential_0.differential_0 + _S2841.differential_0.differential_0;

#line 1189
    float3 _S2843 = _S2835.differential_0.primal_0 + _S2841.differential_0.primal_0;

#line 1189
    float3 _S2844 = _S2831.differential_0.differential_0 + _S2840.differential_0.differential_0;

#line 1189
    float3 _S2845 = _S2831.differential_0.primal_0 + _S2840.differential_0.primal_0;

#line 1189
    float3 _S2846 = _S2830.differential_0.differential_0 + _S2836.differential_0.differential_0;

#line 1189
    float3 _S2847 = _S2830.differential_0.primal_0 + _S2836.differential_0.primal_0;

#line 1189
    float3 _S2848 = - _S2842 + - _S2844 + - _S2846;

#line 1189
    float3 _S2849 = - _S2843 + - _S2845 + - _S2847;

#line 1189
    float3 _S2850 = dpdpdirection_8.primal_0.primal_0 * _S2848;

#line 1189
    float3 _S2851 = dpdpdirection_8.primal_0.differential_0 * _S2848;

#line 1189
    float3 _S2852 = _S2792 * _S2848;

#line 1189
    float3 _S2853 = dpdpdirection_8.primal_0.primal_0 * _S2849;

#line 1189
    float3 _S2854 = _S2791 * _S2848 + _S2792 * _S2849;

#line 1189
    DiffPair_float_0 _S2855 = { _S2851[int(0)] + _S2851[int(1)] + _S2851[int(2)] + _S2853[int(0)] + _S2853[int(1)] + _S2853[int(2)], _S2850[int(0)] + _S2850[int(1)] + _S2850[int(2)] };

#line 1189
    dpdpt_2.primal_0 = dpdpt_2.primal_0;

#line 1189
    dpdpt_2.differential_0 = _S2855;

#line 1189
    DiffPair_float3_0 _S2856 = { _S2854, _S2852 };

#line 1189
    dpdpdirection_8.primal_0 = dpdpdirection_8.primal_0;

#line 1189
    dpdpdirection_8.differential_0 = _S2856;

#line 1189
    DiffPair_float3_0 _S2857 = { _S2849, _S2848 };

#line 1189
    dpdporigin_6.primal_0 = dpdporigin_6.primal_0;

#line 1189
    dpdporigin_6.differential_0 = _S2857;

#line 1189
    DiffPair_float3_0 _S2858 = { _S2843, _S2842 };

#line 1189
    dpdpv2_2.primal_0 = dpdpv2_2.primal_0;

#line 1189
    dpdpv2_2.differential_0 = _S2858;

#line 1189
    DiffPair_float3_0 _S2859 = { _S2845, _S2844 };

#line 1189
    dpdpv1_2.primal_0 = dpdpv1_2.primal_0;

#line 1189
    dpdpv1_2.differential_0 = _S2859;

#line 1189
    DiffPair_float3_0 _S2860 = { _S2847, _S2846 };

#line 1189
    dpdpv0_2.primal_0 = dpdpv0_2.primal_0;

#line 1189
    dpdpv0_2.differential_0 = _S2860;

#line 1189
    return;
}


#line 1189
void s_bwd_s_fwd_computeDistanceToTriangle_0(inout DiffPair_3 dpdpv0_3, inout DiffPair_3 dpdpv1_3, inout DiffPair_3 dpdpv2_3, inout DiffPair_3 dpdporigin_7, inout DiffPair_3 dpdpdirection_9, DiffPair_float_0 _s_dOut_20)
{

#line 1189
    DiffPair_float3_0 _S2861 = { dpdpdirection_9.primal_0.primal_0, dpdpdirection_9.primal_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2862 = { dpdpv2_3.primal_0.primal_0 - dpdpv0_3.primal_0.primal_0, dpdpv2_3.primal_0.differential_0 - dpdpv0_3.primal_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2863 = { dpdpv1_3.primal_0.primal_0 - dpdpv0_3.primal_0.primal_0, dpdpv1_3.primal_0.differential_0 - dpdpv0_3.primal_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2864 = { dpdporigin_7.primal_0.primal_0 - dpdpv0_3.primal_0.primal_0, dpdporigin_7.primal_0.differential_0 - dpdpv0_3.primal_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2865 = s_bwd_primal_d_cross_0(_S2861, _S2862);

#line 1189
    DiffPair_float3_0 _S2866 = { _S2865.primal_0, _S2865.differential_0 };

#line 1189
    DiffPair_float_0 _S2867 = s_bwd_primal_d_dot_0(_S2863, _S2866);

#line 1189
    DiffPair_float3_0 _S2868 = s_bwd_primal_d_cross_0(_S2864, _S2863);

#line 1189
    DiffPair_float3_0 _S2869 = { _S2868.primal_0, _S2868.differential_0 };

#line 1189
    DiffPair_float_0 _S2870 = s_bwd_primal_d_dot_0(_S2862, _S2869);

#line 1189
    float _S2871 = _S2867.primal_0 * _S2867.primal_0;

#line 1189
    float _S2872 = _s_dOut_20.differential_0 / (_S2871 * _S2871);

#line 1189
    float _S2873 = _S2871 * _S2872;

#line 1189
    float _S2874 = _S2867.primal_0 * ((_S2870.differential_0 * _S2867.primal_0 - _S2870.primal_0 * _S2867.differential_0) * - _S2872);

#line 1189
    float _S2875 = - _S2873;

#line 1189
    float _S2876 = _S2870.primal_0 * _S2875;

#line 1189
    float _S2877 = _S2870.differential_0 * _S2873;

#line 1189
    float _S2878 = _s_dOut_20.primal_0 / _S2871;

#line 1189
    float _S2879 = _S2870.primal_0 * - _S2878;

#line 1189
    DiffPair_float_0 _S2880 = { _S2867.differential_0 * _S2875 + _S2867.primal_0 * _S2878, _S2867.primal_0 * _S2873 };

#line 208 "core"
    float3 _S2881 = (float3)0.0;

#line 208
    DiffPair_float3_0 _S2882 = { _S2881, _S2881 };

#line 208
    DiffPair_3 _S2883;

#line 208
    _S2883.primal_0 = _S2862;

#line 208
    _S2883.differential_0 = _S2882;

#line 208
    DiffPair_3 _S2884;

#line 208
    _S2884.primal_0 = _S2869;

#line 208
    _S2884.differential_0 = _S2882;

#line 208
    s_bwd_d_dot_0(_S2883, _S2884, _S2880);

#line 208
    DiffPair_float3_0 _S2885 = { _S2884.differential_0.primal_0, _S2884.differential_0.differential_0 };

#line 208
    DiffPair_3 _S2886;

#line 208
    _S2886.primal_0 = _S2864;

#line 208
    _S2886.differential_0 = _S2882;

#line 208
    DiffPair_3 _S2887;

#line 208
    _S2887.primal_0 = _S2863;

#line 208
    _S2887.differential_0 = _S2882;

#line 208
    s_bwd_d_cross_0(_S2886, _S2887, _S2885);

#line 208
    float3 _S2888 = - _S2886.differential_0.differential_0;

#line 208
    float3 _S2889 = - _S2886.differential_0.primal_0;

#line 208
    DiffPair_float_0 _S2890 = { _S2874 + _S2874 + _S2877 + _S2879, _S2876 };

#line 208
    DiffPair_3 _S2891;

#line 208
    _S2891.primal_0 = _S2863;

#line 208
    _S2891.differential_0 = _S2882;

#line 208
    DiffPair_3 _S2892;

#line 208
    _S2892.primal_0 = _S2866;

#line 208
    _S2892.differential_0 = _S2882;

#line 208
    s_bwd_d_dot_0(_S2891, _S2892, _S2890);

#line 208
    DiffPair_float3_0 _S2893 = { _S2892.differential_0.primal_0, _S2892.differential_0.differential_0 };

#line 208
    DiffPair_3 _S2894;

#line 208
    _S2894.primal_0 = _S2861;

#line 208
    _S2894.differential_0 = _S2882;

#line 208
    DiffPair_3 _S2895;

#line 208
    _S2895.primal_0 = _S2862;

#line 208
    _S2895.differential_0 = _S2882;

#line 208
    s_bwd_d_cross_0(_S2894, _S2895, _S2893);

#line 1189 "core.meta.slang"
    float3 _S2896 = _S2883.differential_0.differential_0 + _S2895.differential_0.differential_0;

#line 1189
    float3 _S2897 = _S2883.differential_0.primal_0 + _S2895.differential_0.primal_0;

#line 1189
    float3 _S2898 = _S2887.differential_0.differential_0 + _S2891.differential_0.differential_0;

#line 1189
    float3 _S2899 = _S2887.differential_0.primal_0 + _S2891.differential_0.primal_0;

#line 1189
    float3 _S2900 = _S2889 + - _S2897 + - _S2899;

#line 1189
    float3 _S2901 = _S2888 + - _S2896 + - _S2898;

#line 1189
    DiffPair_float3_0 _S2902 = { _S2894.differential_0.primal_0, _S2894.differential_0.differential_0 };

#line 1189
    dpdpdirection_9.primal_0 = dpdpdirection_9.primal_0;

#line 1189
    dpdpdirection_9.differential_0 = _S2902;

#line 1189
    DiffPair_float3_0 _S2903 = { _S2886.differential_0.primal_0, _S2886.differential_0.differential_0 };

#line 1189
    dpdporigin_7.primal_0 = dpdporigin_7.primal_0;

#line 1189
    dpdporigin_7.differential_0 = _S2903;

#line 1189
    DiffPair_float3_0 _S2904 = { _S2897, _S2896 };

#line 1189
    dpdpv2_3.primal_0 = dpdpv2_3.primal_0;

#line 1189
    dpdpv2_3.differential_0 = _S2904;

#line 1189
    DiffPair_float3_0 _S2905 = { _S2899, _S2898 };

#line 1189
    dpdpv1_3.primal_0 = dpdpv1_3.primal_0;

#line 1189
    dpdpv1_3.differential_0 = _S2905;

#line 1189
    DiffPair_float3_0 _S2906 = { _S2900, _S2901 };

#line 1189
    dpdpv0_3.primal_0 = dpdpv0_3.primal_0;

#line 1189
    dpdpv0_3.differential_0 = _S2906;

#line 1189
    return;
}


#line 1189
void s_bwd_s_fwd_DifferentiableSceneQuery_loadVertexPosW_1(inout DiffPair_0 dpdpthis_11, GeometryInstanceID_0 instanceID_25, uint triangleID_16, inout DiffPair_6 dpdpray_2, DiffPair_float_0 dpdpt_3, DiffPair_float3_0 dpdpbarycentrics_5, DiffPair_float3_0 dpdpfaceNormalW_3, DiffPair_float3_0 _s_dOut_21)
{

#line 269 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2907 = { dpdpthis_11.primal_0.primal_0.gradientFlags_1, dpdpthis_11.primal_0.differential_0.gradientFlags_0 };

#line 269
    float3 _S2908 = (float3)0.0;

#line 269
    DiffPair_float3_0 _S2909 = { _S2908, _S2908 };

#line 269
    DiffPair_float3_0 _S2910 = { dpdpray_2.primal_0.primal_0.origin_2, dpdpray_2.primal_0.differential_0.origin_0 };

#line 269
    DiffPair_float3_0 _S2911 = { dpdpray_2.primal_0.primal_0.direction_1, dpdpray_2.primal_0.differential_0.direction_0 };

#line 269
    DiffPair_float3_0 _S2912;

#line 269
    _S2912.primal_0 = _S2908;

#line 269
    _S2912.differential_0 = _S2908;

#line 269
    DiffPair_float3_0 _S2913;

#line 269
    _S2913.primal_0 = _S2908;

#line 269
    _S2913.differential_0 = _S2908;

#line 269
    DiffPair_float3_0 _S2914;

#line 269
    _S2914.primal_0 = _S2908;

#line 269
    _S2914.differential_0 = _S2908;

#line 269
    s_bwd_primal_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S2907, instanceID_25, triangleID_16, _S2912, _S2913, _S2914, dpdpray_2.primal_0.primal_0.pixel_1);

#line 269
    DiffPair_float3_0 _S2915 = { _S2912.primal_0, _S2912.differential_0 };

#line 269
    DiffPair_float3_0 _S2916 = { _S2913.primal_0, _S2913.differential_0 };

#line 269
    DiffPair_float3_0 _S2917 = { _S2914.primal_0, _S2914.differential_0 };

#line 269
    DiffPair_float_0 _S2918 = s_bwd_primal_s_fwd_computeDistanceToTriangle_0(_S2915, _S2916, _S2917, _S2910, _S2911);

#line 269
    DiffPair_float_0 _S2919 = { _S2918.primal_0, _S2918.differential_0 };

#line 269
    DiffPair_float3_0 _S2920;

#line 269
    _S2920.primal_0 = _S2908;

#line 269
    _S2920.differential_0 = _S2908;

#line 269
    s_bwd_primal_s_fwd_computeBarycentrics_0(_S2915, _S2916, _S2917, _S2910, _S2911, _S2919, _S2920);

#line 269
    float3 _S2921 = (float3)_S2920.primal_0.x;

#line 269
    float3 _S2922 = (float3)_S2920.differential_0.x;

#line 269
    float3 _S2923 = (float3)_S2920.primal_0.y;

#line 269
    float3 _S2924 = (float3)_S2920.differential_0.y;

#line 269
    float3 _S2925 = (float3)_S2920.primal_0.z;

#line 269
    float3 _S2926 = (float3)_S2920.differential_0.z;

#line 269
    DiffPair_float3_0 _S2927 = { _S2913.primal_0 - _S2912.primal_0, _S2913.differential_0 - _S2912.differential_0 };

#line 269
    DiffPair_float3_0 _S2928 = { _S2914.primal_0 - _S2912.primal_0, _S2914.differential_0 - _S2912.differential_0 };

#line 269
    DiffPair_float3_0 _S2929 = s_bwd_primal_d_cross_0(_S2927, _S2928);

#line 269
    DiffPair_float3_0 _S2930 = { _S2929.primal_0, _S2929.differential_0 };

#line 269
    DiffPair_float_0 _S2931 = { 0.0, 0.0 };

#line 269
    DiffPair_float3_0 _S2932 = { dpdpfaceNormalW_3.primal_0, dpdpfaceNormalW_3.differential_0 };

#line 269
    DiffPair_3 _S2933;

#line 269
    _S2933.primal_0 = _S2930;

#line 269
    _S2933.differential_0 = _S2909;

#line 269
    s_bwd_s_fwd_normalize_impl_0(_S2933, _S2932);

#line 269
    DiffPair_float3_0 _S2934 = { _S2933.differential_0.primal_0, _S2933.differential_0.differential_0 };

#line 269
    DiffPair_3 _S2935;

#line 269
    _S2935.primal_0 = _S2927;

#line 269
    _S2935.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2936;

#line 269
    _S2936.primal_0 = _S2928;

#line 269
    _S2936.differential_0 = _S2909;

#line 269
    s_bwd_d_cross_0(_S2935, _S2936, _S2934);

#line 269
    float3 _S2937 = - _S2936.differential_0.differential_0;

#line 269
    float3 _S2938 = - _S2936.differential_0.primal_0;

#line 269
    float3 _S2939 = - _S2935.differential_0.differential_0;

#line 269
    float3 _S2940 = - _S2935.differential_0.primal_0;

#line 269
    float3 _S2941 = _S2926 * _s_dOut_21.differential_0;

#line 269
    float3 _S2942 = _S2914.primal_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2943 = _S2914.differential_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2944 = _S2925 * _s_dOut_21.differential_0;

#line 269
    float3 _S2945 = _S2914.primal_0 * _s_dOut_21.primal_0;

#line 269
    float3 _S2946 = _S2925 * _s_dOut_21.primal_0;

#line 269
    float3 _S2947 = _S2924 * _s_dOut_21.differential_0;

#line 269
    float3 _S2948 = _S2913.primal_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2949 = _S2913.differential_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2950 = _S2923 * _s_dOut_21.differential_0;

#line 269
    float3 _S2951 = _S2913.primal_0 * _s_dOut_21.primal_0;

#line 269
    float3 _S2952 = _S2923 * _s_dOut_21.primal_0;

#line 269
    float3 _S2953 = _S2922 * _s_dOut_21.differential_0;

#line 269
    float3 _S2954 = _S2912.primal_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2955 = _S2912.differential_0 * _s_dOut_21.differential_0;

#line 269
    float3 _S2956 = _S2921 * _s_dOut_21.differential_0;

#line 269
    float3 _S2957 = _S2912.primal_0 * _s_dOut_21.primal_0;

#line 269
    float3 _S2958 = _S2921 * _s_dOut_21.primal_0;

#line 269
    DiffPair_float3_0 _S2959 = { dpdpbarycentrics_5.primal_0 + (float3(0.0, 0.0, _S2943[int(0)] + _S2943[int(1)] + _S2943[int(2)] + _S2945[int(0)] + _S2945[int(1)] + _S2945[int(2)]) + float3(0.0, _S2949[int(0)] + _S2949[int(1)] + _S2949[int(2)] + _S2951[int(0)] + _S2951[int(1)] + _S2951[int(2)], 0.0) + float3(_S2955[int(0)] + _S2955[int(1)] + _S2955[int(2)] + _S2957[int(0)] + _S2957[int(1)] + _S2957[int(2)], 0.0, 0.0)), dpdpbarycentrics_5.differential_0 + (float3(0.0, 0.0, _S2942[int(0)] + _S2942[int(1)] + _S2942[int(2)]) + float3(0.0, _S2948[int(0)] + _S2948[int(1)] + _S2948[int(2)], 0.0) + float3(_S2954[int(0)] + _S2954[int(1)] + _S2954[int(2)], 0.0, 0.0)) };

#line 269
    DiffPair_3 _S2960;

#line 269
    _S2960.primal_0 = _S2915;

#line 269
    _S2960.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2961;

#line 269
    _S2961.primal_0 = _S2916;

#line 269
    _S2961.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2962;

#line 269
    _S2962.primal_0 = _S2917;

#line 269
    _S2962.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2963;

#line 269
    _S2963.primal_0 = _S2910;

#line 269
    _S2963.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2964;

#line 269
    _S2964.primal_0 = _S2911;

#line 269
    _S2964.differential_0 = _S2909;

#line 269
    DiffPair_4 _S2965;

#line 269
    _S2965.primal_0 = _S2919;

#line 269
    _S2965.differential_0 = _S2931;

#line 269
    s_bwd_s_fwd_computeBarycentrics_0(_S2960, _S2961, _S2962, _S2963, _S2964, _S2965, _S2959);

#line 269
    DiffPair_float_0 _S2966 = { dpdpt_3.primal_0 + _S2965.differential_0.primal_0, dpdpt_3.differential_0 + _S2965.differential_0.differential_0 };

#line 269
    DiffPair_3 _S2967;

#line 269
    _S2967.primal_0 = _S2915;

#line 269
    _S2967.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2968;

#line 269
    _S2968.primal_0 = _S2916;

#line 269
    _S2968.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2969;

#line 269
    _S2969.primal_0 = _S2917;

#line 269
    _S2969.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2970;

#line 269
    _S2970.primal_0 = _S2910;

#line 269
    _S2970.differential_0 = _S2909;

#line 269
    DiffPair_3 _S2971;

#line 269
    _S2971.primal_0 = _S2911;

#line 269
    _S2971.differential_0 = _S2909;

#line 269
    s_bwd_s_fwd_computeDistanceToTriangle_0(_S2967, _S2968, _S2969, _S2970, _S2971, _S2966);

#line 1189 "core.meta.slang"
    float3 _S2972 = _S2964.differential_0.differential_0 + _S2971.differential_0.differential_0;

#line 1189
    float3 _S2973 = _S2964.differential_0.primal_0 + _S2971.differential_0.primal_0;

#line 1189
    float3 _S2974 = _S2963.differential_0.differential_0 + _S2970.differential_0.differential_0;

#line 1189
    float3 _S2975 = _S2963.differential_0.primal_0 + _S2970.differential_0.primal_0;

#line 1189
    DiffPair_float3_0 _S2976 = { _S2936.differential_0.primal_0 + _S2941 + _S2946 + _S2962.differential_0.primal_0 + _S2969.differential_0.primal_0, _S2936.differential_0.differential_0 + _S2944 + _S2962.differential_0.differential_0 + _S2969.differential_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2977 = { _S2935.differential_0.primal_0 + _S2947 + _S2952 + _S2961.differential_0.primal_0 + _S2968.differential_0.primal_0, _S2935.differential_0.differential_0 + _S2950 + _S2961.differential_0.differential_0 + _S2968.differential_0.differential_0 };

#line 1189
    DiffPair_float3_0 _S2978 = { _S2938 + _S2940 + _S2953 + _S2958 + _S2960.differential_0.primal_0 + _S2967.differential_0.primal_0, _S2937 + _S2939 + _S2956 + _S2960.differential_0.differential_0 + _S2967.differential_0.differential_0 };

#line 208 "core"
    s_diff_s_diff_SceneDerivativeFlags_0 _S2979 = SceneDerivativeFlags_dzero_0();

#line 208
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S2980 = { _S2979, _S2979 };

#line 208
    DiffPair_7 _S2981;

#line 208
    _S2981.primal_0 = _S2907;

#line 208
    _S2981.differential_0 = _S2980;

#line 208
    s_bwd_FalcorSceneIO_fwd_loadVertexPositionsW_0(_S2981, instanceID_25, triangleID_16, _S2978, _S2977, _S2976, dpdpray_2.primal_0.primal_0.pixel_1);

#line 208
    s_diff_s_diff_DiffRay_0 _S2982 = DiffRay_x24_syn_dzero_0();

#line 208
    s_diff_s_diff_DiffRay_0 _S2983 = _S2982;

#line 208
    _S2983.direction_0 = _S2973;

#line 208
    _S2983.origin_0 = _S2975;

#line 208
    s_diff_s_diff_DiffRay_0 _S2984 = _S2982;

#line 208
    _S2984.direction_0 = _S2972;

#line 208
    _S2984.origin_0 = _S2974;

#line 208
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2985 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 208
    _S2985.gradientFlags_0 = _S2981.differential_0.primal_0;

#line 208
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2986 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 208
    s_diff_s_diff_DifferentiableSceneQuery_0 _S2987 = _S2986;

#line 208
    _S2987.gradientFlags_0 = _S2981.differential_0.differential_0;

#line 208
    DiffPair_s_diff_s_diff_DiffRay_0 _S2988 = { DiffRay_x24_syn_dadd_0(_S2983, _S2982), DiffRay_x24_syn_dadd_0(_S2982, _S2984) };

#line 208
    dpdpray_2.primal_0 = dpdpray_2.primal_0;

#line 208
    dpdpray_2.differential_0 = _S2988;

#line 208
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S2989 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S2985, _S2986), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S2986, _S2987) };

#line 208
    dpdpthis_11.primal_0 = dpdpthis_11.primal_0;

#line 208
    dpdpthis_11.differential_0 = _S2989;

#line 208
    return;
}


#line 208
void s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_0(inout DiffPair_0 dpdpthis_12, HitInfo_0 hitInfo_6, inout DiffPair_6 dpdpray_3, int mode_7, DiffPair_s_diff_s_diff_IntersectionInfo_0 _s_dOut_22, s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _s_diff_ctx_20)
{

#line 198 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/DifferentiableSceneQuery.slang"
    float3 _S2990 = (float3)0.0;

#line 198
    DiffPair_0 _S2991 = dpdpthis_12;

#line 198
    DiffPair_6 _S2992 = dpdpray_3;

#line 198
    bool _S2993 = mode_7 == int(0);

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S2994 = { dpdpthis_12.primal_0.primal_0, dpdpthis_12.primal_0.differential_0 };

#line 198
    uint2 _S2995 = (uint2)0U;

#line 198
    DiffRay_0 _S2996 = { _S2990, _S2990, _S2995 };

#line 198
    s_diff_s_diff_DiffRay_0 _S2997 = { _S2990, _S2990 };

#line 198
    s_diff_s_diff_SceneDerivativeFlags_0 _S2998 = { int(0) };

#line 198
    DifferentiableSceneQuery_0 _S2999 = { _S2998 };

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3000 = { _S2998 };

#line 198
    DiffPair_float3_0 _S3001 = { _S2990, _S2990 };

#line 198
    DiffPair_IntersectionInfo_0 _S3002 = s_bwd_primal_s_fwd_IntersectionInfo_x24init_0();

#line 198
    IntersectionInfo_0 info_4 = _S3002.primal_0;

#line 198
    info_4.triangleID_2 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
    info_4.instanceID_7 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
    s_diff_s_diff_IntersectionInfo_0 s_diff_info_1;

#line 198
    DiffPair_float3_0 _S3003;

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S3004;

#line 198
    DiffPair_DifferentiableSceneQuery_0 _S3005;

#line 198
    uint2 _S3006;

#line 198
    bool _S3007;

#line 198
    DiffPair_DiffRay_0 _S3008;

#line 198
    if(_S2993)
    {

#line 198
        DiffPair_DiffRay_0 _S3009 = { _S2992.primal_0.primal_0, _S2992.primal_0.differential_0 };

#line 198
        DiffPair_float_0 _S3010;

#line 198
        _S3010.primal_0 = 0.0;

#line 198
        _S3010.differential_0 = 0.0;

#line 198
        DiffPair_float3_0 _S3011;

#line 198
        _S3011.primal_0 = _S2990;

#line 198
        _S3011.differential_0 = _S2990;

#line 198
        DiffPair_float3_0 _S3012;

#line 198
        _S3012.primal_0 = _S2990;

#line 198
        _S3012.differential_0 = _S2990;

#line 198
        DiffPair_float3_0 _S3013 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_1(_S2994, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S3009, _S3010, _S3011, _S3012);

#line 198
        info_4.triangleID_2 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
        info_4.instanceID_7 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
        info_4.barycentrics_2 = _S3011.primal_0;

#line 198
        info_4.normalW_2 = _S3012.primal_0;

#line 198
        info_4.posW_5 = _S3013.primal_0;

#line 198
        info_4.hitT_5 = _S3010.primal_0;

#line 198
        s_diff_info_1.barycentrics_0 = _S3011.differential_0;

#line 198
        s_diff_info_1.normalW_0 = _S3012.differential_0;

#line 198
        s_diff_info_1.posW_2 = _S3013.differential_0;

#line 198
        s_diff_info_1.hitT_0 = _S3010.differential_0;

#line 198
        _S3007 = false;

#line 198
        _S3003.primal_0 = _S2990;

#line 198
        _S3003.differential_0 = _S2990;

#line 198
        _S3004.primal_0 = _S2999;

#line 198
        _S3004.differential_0 = _S3000;

#line 198
        _S3006 = _S2995;

#line 198
        _S3005.primal_0 = _S2991.primal_0.primal_0;

#line 198
        _S3005.differential_0 = _S2991.primal_0.differential_0;

#line 198
        _S3008.primal_0 = _S2992.primal_0.primal_0;

#line 198
        _S3008.differential_0 = _S2992.primal_0.differential_0;

#line 198
    }
    else
    {

#line 198
        bool _S3014 = mode_7 == int(1);

#line 198
        if(_S3014)
        {

#line 198
            DiffPair_float3_0 _S3015;

#line 198
            _S3015.primal_0 = _S2990;

#line 198
            _S3015.differential_0 = _S2990;

#line 198
            DiffPair_float3_0 _S3016 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadVertexPosW_0(_S2994, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _s_diff_ctx_20._S1205, _S3015, _S2992.primal_0.primal_0.pixel_1);

#line 198
            float3 _S3017 = _S3016.primal_0 - _S2992.primal_0.primal_0.origin_2;

#line 198
            float3 _S3018 = _S3016.differential_0 - _S2992.primal_0.differential_0.origin_0;

#line 198
            DiffPair_float3_0 _S3019 = { _S3017, _S3018 };

#line 198
            DiffPair_float_0 _S3020 = s_bwd_primal_s_fwd_length_impl_0(_S3019);

#line 198
            info_4.triangleID_2 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 198
            info_4.instanceID_7 = _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 198
            info_4.barycentrics_2 = _s_diff_ctx_20._S1205;

#line 198
            info_4.normalW_2 = _S3015.primal_0;

#line 198
            info_4.posW_5 = _S3016.primal_0;

#line 198
            info_4.hitT_5 = _S3020.primal_0;

#line 198
            s_diff_info_1.barycentrics_0 = _S2990;

#line 198
            s_diff_info_1.normalW_0 = _S3015.differential_0;

#line 198
            s_diff_info_1.posW_2 = _S3016.differential_0;

#line 198
            s_diff_info_1.hitT_0 = _S3020.differential_0;

#line 198
            _S3003.primal_0 = _S3017;

#line 198
            _S3003.differential_0 = _S3018;

#line 198
            _S3004.primal_0 = _S2991.primal_0.primal_0;

#line 198
            _S3004.differential_0 = _S2991.primal_0.differential_0;

#line 198
            _S3006 = _S2992.primal_0.primal_0.pixel_1;

#line 198
        }
        else
        {

#line 198
            s_diff_info_1 = _S3002.differential_0;

#line 198
            _S3003.primal_0 = _S2990;

#line 198
            _S3003.differential_0 = _S2990;

#line 198
            _S3004.primal_0 = _S2999;

#line 198
            _S3004.differential_0 = _S3000;

#line 198
            _S3006 = _S2995;

#line 198
        }

#line 198
        _S3007 = _S3014;

#line 198
        _S3005.primal_0 = _S2999;

#line 198
        _S3005.differential_0 = _S3000;

#line 198
        _S3008.primal_0 = _S2996;

#line 198
        _S3008.differential_0 = _S2997;

#line 198
    }

#line 198
    IntersectionInfo_0 _S3021 = info_4;

#line 198
    IntersectionInfo_0 _S3022 = info_4;

#line 198
    DiffPair_float3_0 _S3023 = { info_4.barycentrics_2, s_diff_info_1.barycentrics_0 };

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3024 = IntersectionInfo_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_DiffRay_0 _S3025 = DiffRay_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3026 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3027 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 198
    s_diff_info_1 = _s_dOut_22.differential_0;

#line 198
    s_diff_info_1.normalW_0 = _S2990;

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3028 = _s_dOut_22.primal_0;

#line 198
    _S3028.normalW_0 = _S2990;

#line 198
    DiffPair_float3_0 _S3029 = { _s_dOut_22.primal_0.normalW_0, _s_dOut_22.differential_0.normalW_0 };

#line 198
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3030 = { _S3026, _S3027 };

#line 198
    DiffPair_0 _S3031;

#line 198
    _S3031.primal_0 = _S2994;

#line 198
    _S3031.differential_0 = _S3030;

#line 198
    DiffPair_3 _S3032;

#line 198
    _S3032.primal_0 = _S3023;

#line 198
    _S3032.differential_0 = _S3001;

#line 198
    s_bwd_s_fwd_DifferentiableSceneQuery_computeShadingNormal_0(_S3031, _S3021.instanceID_7, _S3022.triangleID_2, _S3032, _S3029);

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3033 = _S3024;

#line 198
    _S3033.barycentrics_0 = _S3032.differential_0.primal_0;

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3034 = IntersectionInfo_x24_syn_dadd_0(_S3028, _S3033);

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3035 = _S3024;

#line 198
    _S3035.barycentrics_0 = _S3032.differential_0.differential_0;

#line 198
    s_diff_s_diff_IntersectionInfo_0 _S3036 = IntersectionInfo_x24_syn_dadd_0(s_diff_info_1, _S3035);

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3037 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3031.differential_0.differential_0, _S3027);

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3038 = DifferentiableSceneQuery_x24_syn_dadd_0(_S3031.differential_0.primal_0, _S3026);

#line 198
    s_diff_s_diff_DiffRay_0 _S3039;

#line 198
    s_diff_s_diff_DiffRay_0 _S3040;

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3041;

#line 198
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3042;

#line 198
    if(_S2993)
    {

#line 198
        DiffPair_float3_0 _S3043 = { _S3034.normalW_0, _S3036.normalW_0 };

#line 198
        DiffPair_float3_0 _S3044 = { _S3034.barycentrics_0, _S3036.barycentrics_0 };

#line 198
        DiffPair_float_0 _S3045 = { _S3034.hitT_0, _S3036.hitT_0 };

#line 198
        DiffPair_float3_0 _S3046 = { _S3034.posW_2, _S3036.posW_2 };

#line 198
        DiffPair_0 _S3047;

#line 198
        _S3047.primal_0 = _S3005;

#line 198
        _S3047.differential_0 = _S3030;

#line 198
        DiffPair_s_diff_s_diff_DiffRay_0 _S3048 = _S2605();

#line 198
        DiffPair_6 _S3049;

#line 198
        _S3049.primal_0 = _S3008;

#line 198
        _S3049.differential_0 = _S3048;

#line 198
        s_bwd_s_fwd_DifferentiableSceneQuery_loadVertexPosW_1(_S3047, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S3049, _S3045, _S3044, _S3043, _S3046);

#line 198
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3050 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3047.differential_0.differential_0, _S3037);

#line 198
        s_diff_s_diff_DiffRay_0 _S3051 = DiffRay_x24_syn_dadd_0(_S3049.differential_0.differential_0, _S3025);

#line 198
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3052 = DifferentiableSceneQuery_x24_syn_dadd_0(_S3047.differential_0.primal_0, _S3038);

#line 198
        _S3039 = DiffRay_x24_syn_dadd_0(_S3049.differential_0.primal_0, _S3025);

#line 198
        _S3040 = _S3051;

#line 198
        _S3041 = _S3052;

#line 198
        _S3042 = _S3050;

#line 198
    }
    else
    {

#line 198
        if(_S3007)
        {

#line 198
            DiffPair_float_0 _S3053 = { _S3034.hitT_0, _S3036.hitT_0 };

#line 198
            DiffPair_3 _S3054;

#line 198
            _S3054.primal_0 = _S3003;

#line 198
            _S3054.differential_0 = _S3001;

#line 198
            s_bwd_s_fwd_length_impl_0(_S3054, _S3053);

#line 198
            float3 _S3055 = - _S3054.differential_0.differential_0;

#line 198
            float3 _S3056 = - _S3054.differential_0.primal_0;

#line 198
            DiffPair_float3_0 _S3057 = { _S3034.normalW_0, _S3036.normalW_0 };

#line 198
            DiffPair_float3_0 _S3058 = { _S3034.posW_2 + _S3054.differential_0.primal_0, _S3036.posW_2 + _S3054.differential_0.differential_0 };

#line 198
            DiffPair_0 _S3059;

#line 198
            _S3059.primal_0 = _S3004;

#line 198
            _S3059.differential_0 = _S3030;

#line 198
            s_bwd_s_fwd_DifferentiableSceneQuery_loadVertexPosW_0(_S3059, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, _s_diff_ctx_20.hit_8._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _s_diff_ctx_20._S1205, _S3057, _S3006, _S3058);

#line 198
            s_diff_s_diff_DifferentiableSceneQuery_0 _S3060 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3059.differential_0.differential_0, _S3037);

#line 198
            s_diff_s_diff_DiffRay_0 _S3061 = _S3025;

#line 198
            _S3061.origin_0 = _S3055;

#line 198
            s_diff_s_diff_DiffRay_0 _S3062 = DiffRay_x24_syn_dadd_0(_S3025, _S3061);

#line 198
            s_diff_s_diff_DifferentiableSceneQuery_0 _S3063 = DifferentiableSceneQuery_x24_syn_dadd_0(_S3059.differential_0.primal_0, _S3038);

#line 198
            s_diff_s_diff_DiffRay_0 _S3064 = _S3025;

#line 198
            _S3064.origin_0 = _S3056;

#line 198
            _S3039 = DiffRay_x24_syn_dadd_0(_S3025, _S3064);

#line 198
            _S3040 = _S3062;

#line 198
            _S3041 = _S3063;

#line 198
            _S3042 = _S3060;

#line 198
        }
        else
        {

#line 198
            _S3039 = _S3025;

#line 198
            _S3040 = _S3025;

#line 198
            _S3041 = _S3038;

#line 198
            _S3042 = _S3037;

#line 198
        }

#line 198
    }

#line 198
    DiffPair_s_diff_s_diff_DiffRay_0 _S3065 = { DiffRay_x24_syn_dadd_0(_S3039, _S3025), DiffRay_x24_syn_dadd_0(_S3025, _S3040) };

#line 198
    dpdpray_3.primal_0 = dpdpray_3.primal_0;

#line 198
    dpdpray_3.differential_0 = _S3065;

#line 198
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3066 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3041, _S3027), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3027, _S3042) };

#line 198
    dpdpthis_12.primal_0 = dpdpthis_12.primal_0;

#line 198
    dpdpthis_12.differential_0 = _S3066;

#line 198
    return;
}


#line 198
void s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(inout DiffPair_0 dpdpthis_13, inout DiffPair_6 dpdprayData_1, DiffPair_s_diff_s_diff_IntersectionInfo_0 dpdpisectInfo_1, int mode_8, s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _s_diff_ctx_21)
{

#line 144
    float3 _S3067 = (float3)0.0;

#line 144
    GeometryInstanceID_0 _S3068 = { 0U };

#line 144
    GeometryHit_0 _S3069 = { _S3068, 0U, (float2)0.0 };

#line 144
    TriangleHit_0 _S3070 = { _S3069 };

#line 144
    s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _S3071;

#line 144
    _S3071._S1205 = _S3067;

#line 144
    _S3071.hit_8 = _S3070;

#line 144
    DiffPair_0 _S3072 = dpdpthis_13;

#line 144
    DiffPair_6 _S3073 = dpdprayData_1;

#line 144
    bool _S3074 = !!_s_diff_ctx_21.isHit_0;

#line 144
    DiffRay_0 _S3075 = { _S3067, _S3067, (uint2)0U };

#line 144
    s_diff_s_diff_DiffRay_0 _S3076 = { _S3067, _S3067 };

#line 144
    s_diff_s_diff_SceneDerivativeFlags_0 _S3077 = { int(0) };

#line 144
    DifferentiableSceneQuery_0 _S3078 = { _S3077 };

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3079 = { _S3077 };

#line 144
    DiffPair_DifferentiableSceneQuery_0 _S3080;

#line 144
    DiffPair_DiffRay_0 _S3081;

#line 144
    if(_S3074)
    {

#line 144
        DiffPair_DifferentiableSceneQuery_0 _S3082 = { _S3072.primal_0.primal_0, _S3072.primal_0.differential_0 };

#line 144
        DiffPair_DiffRay_0 _S3083 = { _S3073.primal_0.primal_0, _S3073.primal_0.differential_0 };

#line 144
        DiffPair_IntersectionInfo_0 _S3084 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_0(_S3082, _s_diff_ctx_21._S1199, _S3083, mode_8, _S3071);

#line 144
        _S3080.primal_0 = _S3072.primal_0.primal_0;

#line 144
        _S3080.differential_0 = _S3072.primal_0.differential_0;

#line 144
        _S3081.primal_0 = _S3073.primal_0.primal_0;

#line 144
        _S3081.differential_0 = _S3073.primal_0.differential_0;

#line 144
    }
    else
    {

#line 144
        _S3080.primal_0 = _S3078;

#line 144
        _S3080.differential_0 = _S3079;

#line 144
        _S3081.primal_0 = _S3075;

#line 144
        _S3081.differential_0 = _S3076;

#line 144
    }

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S3085 = IntersectionInfo_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_DiffRay_0 _S3086 = DiffRay_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3087 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3088 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S3089 = IntersectionInfo_x24_syn_dadd_0(IntersectionInfo_x24_syn_dadd_0(dpdpisectInfo_1.primal_0, _S3085), _S3085);

#line 144
    s_diff_s_diff_IntersectionInfo_0 _S3090 = IntersectionInfo_x24_syn_dadd_0(IntersectionInfo_x24_syn_dadd_0(dpdpisectInfo_1.differential_0, _S3085), _S3085);

#line 144
    s_diff_s_diff_DiffRay_0 _S3091;

#line 144
    s_diff_s_diff_DiffRay_0 _S3092;

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3093;

#line 144
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3094;

#line 144
    if(_S3074)
    {

#line 144
        DiffPair_s_diff_s_diff_IntersectionInfo_0 _S3095 = { IntersectionInfo_x24_syn_dadd_0(_S3085, _S3089), IntersectionInfo_x24_syn_dadd_0(_S3090, _S3085) };

#line 144
        DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3096 = { _S3088, _S3087 };

#line 144
        DiffPair_0 _S3097;

#line 144
        _S3097.primal_0 = _S3080;

#line 144
        _S3097.differential_0 = _S3096;

#line 144
        DiffPair_s_diff_s_diff_DiffRay_0 _S3098 = _S2605();

#line 144
        DiffPair_6 _S3099;

#line 144
        _S3099.primal_0 = _S3081;

#line 144
        _S3099.differential_0 = _S3098;

#line 144
        s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_0(_S3097, _s_diff_ctx_21._S1199, _S3099, mode_8, _S3095, _S3071);

#line 144
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3100 = DifferentiableSceneQuery_x24_syn_dadd_0(_S3097.differential_0.primal_0, _S3088);

#line 144
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3101 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3097.differential_0.differential_0, _S3087);

#line 144
        s_diff_s_diff_DiffRay_0 _S3102 = DiffRay_x24_syn_dadd_0(_S3099.differential_0.differential_0, _S3086);

#line 144
        _S3091 = DiffRay_x24_syn_dadd_0(_S3099.differential_0.primal_0, _S3086);

#line 144
        _S3092 = _S3102;

#line 144
        _S3093 = _S3100;

#line 144
        _S3094 = _S3101;

#line 144
    }
    else
    {

#line 144
        _S3091 = _S3086;

#line 144
        _S3092 = _S3086;

#line 144
        _S3093 = _S3088;

#line 144
        _S3094 = _S3087;

#line 144
    }

#line 144
    s_diff_s_diff_DiffRay_0 _S3103 = _S3086;

#line 144
    _S3103.direction_0 = _S3067;

#line 144
    _S3103.origin_0 = _S3067;

#line 144
    DiffPair_s_diff_s_diff_DiffRay_0 _S3104 = { DiffRay_x24_syn_dadd_0(DiffRay_x24_syn_dadd_0(_S3091, _S3103), _S3086), DiffRay_x24_syn_dadd_0(_S3086, _S3092) };

#line 144
    dpdprayData_1.primal_0 = dpdprayData_1.primal_0;

#line 144
    dpdprayData_1.differential_0 = _S3104;

#line 144
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3105 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3093, _S3087), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3087, _S3094) };

#line 144
    dpdpthis_13.primal_0 = dpdpthis_13.primal_0;

#line 144
    dpdpthis_13.differential_0 = _S3105;

#line 144
    return;
}


#line 144
void s_bwd_s_fwd_DiffRay_x24init_0(inout DiffPair_3 dpdporigin_8, inout DiffPair_3 dpdpdirection_10, uint2 pixel_14, DiffPair_s_diff_s_diff_DiffRay_0 _s_dOut_23)
{

#line 29
    DiffPair_float3_0 _S3106 = { _s_dOut_23.primal_0.direction_0, _s_dOut_23.differential_0.direction_0 };

#line 29
    dpdpdirection_10.primal_0 = dpdpdirection_10.primal_0;

#line 29
    dpdpdirection_10.differential_0 = _S3106;

#line 29
    DiffPair_float3_0 _S3107 = { _s_dOut_23.primal_0.origin_0, _s_dOut_23.differential_0.origin_0 };

#line 29
    dpdporigin_8.primal_0 = dpdporigin_8.primal_0;

#line 29
    dpdporigin_8.differential_0 = _S3107;

#line 29
    return;
}


#line 29
void s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_0(inout DiffPair_0 dpdpquery_4, float kappa_5, uint2 globalPixel_8, float3 baseDirection_2, inout DiffPair_3 dpdporigin_9, inout DiffPair_5 dpdpdirection_11, DiffPair_array_float3_1 dpdpwarpedPoint_2, UniformSampleGenerator_0 sg_29, s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _s_diff_ctx_22)
{

#line 382 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    HitInfo_0 _S3108 = { (uint4)0U };

#line 382
    s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S3109;

#line 382
    _S3109._S1199 = _S3108;

#line 382
    _S3109.isHit_0 = false;

#line 382
    float3 _S3110 = (float3)0.0;

#line 382
    DiffPair_0 _S3111 = dpdpquery_4;

#line 382
    DiffPair_3 _S3112 = dpdporigin_9;

#line 382
    DiffPair_5 _S3113 = dpdpdirection_11;

#line 382
    float3 _S3114 = float3(0.0, 0.0, 0.0);

#line 382
    bool _S3115 = !(_s_diff_ctx_22._S1115[int(0)] == 0.0);

#line 382
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3116 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 382
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3117 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 382
    s_diff_s_diff_IntersectionInfo_0 _S3118 = IntersectionInfo_x24_syn_dzero_0();

#line 382
    int _S3119 = _s_diff_ctx_22._S1110 - int(1);

#line 382
    GeometryInstanceID_0 _S3120 = { 0U };

#line 382
    IntersectionInfo_0 _S3121 = { 0U, _S3120, _S3110, _S3110, _S3110, 0.0 };

#line 382
    s_diff_s_diff_DiffRay_0 _S3122 = DiffRay_x24_syn_dzero_0();

#line 1182 "core.meta.slang"
    float2 _S3123 = (float2)0.0;

#line 1182
    DiffPair_float3_0 _S3124 = { dpdporigin_9.primal_0.primal_0, dpdporigin_9.primal_0.differential_0 };

#line 1182
    DiffPair_DifferentiableSceneQuery_0 _S3125 = { dpdpquery_4.primal_0.primal_0, dpdpquery_4.primal_0.differential_0 };

#line 1182
    s_diff_s_diff_IntersectionInfo_0 _S3126 = { _S3110, _S3110, _S3110, 0.0 };

#line 1182
    DiffPair_float3_0 _S3127 = { dpdpdirection_11.primal_0.primal_0[int(0)], dpdpdirection_11.primal_0.differential_0[int(0)] };

#line 1182
    DiffPair_float3_0 _S3128 = { dpdpdirection_11.primal_0.primal_0[int(1)], dpdpdirection_11.primal_0.differential_0[int(1)] };

#line 1182
    DiffPair_float3_0 _S3129 = { _S3110, _S3110 };

#line 1182
    DiffRay_0 _S3130 = { _S3110, _S3110, (uint2)0U };

#line 1182
    s_diff_s_diff_DiffRay_0 _S3131 = { _S3110, _S3110 };

#line 1182
    s_diff_s_diff_SceneDerivativeFlags_0 _S3132 = { int(0) };

#line 1182
    DifferentiableSceneQuery_0 _S3133 = { _S3132 };

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3134 = { _S3132 };

#line 1182
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3135 = { _S3117, _S3116 };

#line 1182
    DiffPair_s_diff_s_diff_DiffRay_0 _S3136 = _S2605();

#line 1182
    DiffPair_float_0 _S3137 = _S2458();

#line 1182
    DiffPair_float_0 _S3138 = { _s_diff_ctx_22._S1115[int(0)], _s_diff_ctx_22._S1114[int(0)] };

#line 1182
    DiffPair_float_0 _S3139 = { 0.00000000999999993923, 0.0 };

#line 1182
    DiffPair_float_0 _S3140 = { _s_diff_ctx_22._S1115[int(1)], _s_diff_ctx_22._S1114[int(1)] };

#line 1182
    DiffPair_float_0 _S3141 = s_bwd_primal_d_max_0(_S3138, _S3139);

#line 1182
    float3 _S3142 = (float3)_S3141.primal_0;

#line 1182
    float3 _S3143 = (float3)_S3141.differential_0;

#line 1182
    float3 _S3144 = _S3142 * _S3142;

#line 1182
    float3 _S3145 = _s_diff_ctx_22._S1112[int(0)] * _S3142 - _s_diff_ctx_22._S1113[int(0)] * _S3143;

#line 1182
    float3 _S3146 = _S3144 * _S3144;

#line 1182
    DiffPair_float_0 _S3147 = s_bwd_primal_d_max_0(_S3140, _S3139);

#line 1182
    float3 _S3148 = (float3)_S3147.primal_0;

#line 1182
    float3 _S3149 = (float3)_S3147.differential_0;

#line 1182
    float3 _S3150 = _S3148 * _S3148;

#line 1182
    float3 _S3151 = _s_diff_ctx_22._S1112[int(1)] * _S3148 - _s_diff_ctx_22._S1113[int(1)] * _S3149;

#line 1182
    float3 _S3152 = _S3150 * _S3150;

#line 1182
    float3 _S3153 = dpdpwarpedPoint_2.primal_0[int(1)] / _S3150;

#line 1182
    float3 _S3154 = dpdpwarpedPoint_2.primal_0[int(0)] / _S3144;

#line 1182
    int _dc_0;

#line 1182
    bool _bflag_7 = true;

#line 1182
    int i_4 = int(0);

#line 1182
    UniformSampleGenerator_0 _S3155 = sg_29;

#line 1182
    float  rnd_2[int(16)];

#line 1182
    rnd_2[int(0)] = 0.0;

#line 1182
    rnd_2[int(1)] = 0.0;

#line 1182
    rnd_2[int(2)] = 0.0;

#line 1182
    rnd_2[int(3)] = 0.0;

#line 1182
    rnd_2[int(4)] = 0.0;

#line 1182
    rnd_2[int(5)] = 0.0;

#line 1182
    rnd_2[int(6)] = 0.0;

#line 1182
    rnd_2[int(7)] = 0.0;

#line 1182
    rnd_2[int(8)] = 0.0;

#line 1182
    rnd_2[int(9)] = 0.0;

#line 1182
    rnd_2[int(10)] = 0.0;

#line 1182
    rnd_2[int(11)] = 0.0;

#line 1182
    rnd_2[int(12)] = 0.0;

#line 1182
    rnd_2[int(13)] = 0.0;

#line 1182
    rnd_2[int(14)] = 0.0;

#line 1182
    rnd_2[int(15)] = 0.0;

#line 1182
    float  s_diff_rnd_2[int(16)];

#line 1182
    s_diff_rnd_2[int(0)] = 0.0;

#line 1182
    s_diff_rnd_2[int(1)] = 0.0;

#line 1182
    s_diff_rnd_2[int(2)] = 0.0;

#line 1182
    s_diff_rnd_2[int(3)] = 0.0;

#line 1182
    s_diff_rnd_2[int(4)] = 0.0;

#line 1182
    s_diff_rnd_2[int(5)] = 0.0;

#line 1182
    s_diff_rnd_2[int(6)] = 0.0;

#line 1182
    s_diff_rnd_2[int(7)] = 0.0;

#line 1182
    s_diff_rnd_2[int(8)] = 0.0;

#line 1182
    s_diff_rnd_2[int(9)] = 0.0;

#line 1182
    s_diff_rnd_2[int(10)] = 0.0;

#line 1182
    s_diff_rnd_2[int(11)] = 0.0;

#line 1182
    s_diff_rnd_2[int(12)] = 0.0;

#line 1182
    s_diff_rnd_2[int(13)] = 0.0;

#line 1182
    s_diff_rnd_2[int(14)] = 0.0;

#line 1182
    s_diff_rnd_2[int(15)] = 0.0;

#line 1182
    int _pc_3 = int(0);

#line 1182
    for(;;)
    {

#line 1182
        if(_bflag_7)
        {
        }
        else
        {

#line 1182
            break;
        }

#line 1182
        bool _S3156 = i_4 < int(16);

#line 1182
        int _S3157;

#line 1182
        if(_S3156)
        {

#line 1182
            _S3157 = _dc_0;

#line 1182
        }
        else
        {

#line 1182
            _S3157 = int(1);

#line 1182
        }

#line 1182
        UniformSampleGenerator_0 _S3158;

#line 1182
        if(_S3156)
        {

#line 1182
            UniformSampleGenerator_0 _S3159 = _S3155;

#line 1182
            float _S3160 = sampleNext1D_0(_S3159);

#line 1182
            _S3158 = _S3159;

#line 1182
            float  _S3161[int(16)] = rnd_2;

#line 1182
            _S3161[i_4] = _S3160;

#line 1182
            float  _S3162[int(16)] = s_diff_rnd_2;

#line 1182
            _S3162[i_4] = 0.0;

#line 1182
            _dc_0 = int(2);

#line 1182
            rnd_2 = _S3161;

#line 1182
            s_diff_rnd_2 = _S3162;

#line 1182
        }
        else
        {

#line 1182
            _dc_0 = _S3157;

#line 1182
        }

#line 1182
        if(_dc_0 != int(2))
        {

#line 1182
            _bflag_7 = false;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        if(_bflag_7)
        {

#line 1182
            i_4 = i_4 + int(1);

#line 1182
            _S3155 = _S3158;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        _pc_3 = _pc_3 + int(1);

#line 1182
    }

#line 1182
    float3 auxDir_2;

#line 1182
    float3  s_diff_totalWarpedPoint_7[int(2)];

#line 1182
    float3  totalWarpedPoint_7[int(2)];

#line 1182
    float3  s_diff_totalWarpedPoint_8[int(2)];

#line 1182
    float3  totalWarpedPoint_8[int(2)];

#line 1182
    float  s_diff_totalWeight_7[int(2)];

#line 1182
    float  totalWeight_7[int(2)];

#line 1182
    float  s_diff_totalWeight_8[int(2)];

#line 1182
    float  totalWeight_8[int(2)];

#line 1182
    _bflag_7 = true;

#line 1182
    uint i_5 = 0U;

#line 1182
    float  totalWeight_9[int(2)];

#line 1182
    totalWeight_9[int(0)] = 0.0;

#line 1182
    totalWeight_9[int(1)] = 0.0;

#line 1182
    float  s_diff_totalWeight_9[int(2)];

#line 1182
    s_diff_totalWeight_9[int(0)] = 0.0;

#line 1182
    s_diff_totalWeight_9[int(1)] = 0.0;

#line 1182
    float3  totalWarpedPoint_9[int(2)];

#line 1182
    totalWarpedPoint_9[int(0)] = _S3114;

#line 1182
    totalWarpedPoint_9[int(1)] = _S3114;

#line 1182
    float3  s_diff_totalWarpedPoint_9[int(2)];

#line 1182
    s_diff_totalWarpedPoint_9[int(0)] = _S3114;

#line 1182
    s_diff_totalWarpedPoint_9[int(1)] = _S3114;

#line 1182
    i_4 = _dc_0;

#line 1182
    _pc_3 = int(0);

#line 1182
    for(;;)
    {

#line 1182
        if(_bflag_7)
        {
        }
        else
        {

#line 1182
            break;
        }

#line 1182
        bool _S3163 = i_5 < 16U;

#line 1182
        if(_S3163)
        {

#line 1182
            _dc_0 = i_4;

#line 1182
        }
        else
        {

#line 1182
            _dc_0 = int(1);

#line 1182
        }

#line 1182
        if(_S3163)
        {

#line 1182
            uint _S3164 = i_5 / 2U * 2U;

#line 1182
            uint _S3165 = _S3164 + 1U;

#line 1182
            float  _S3166[int(16)] = rnd_2;

#line 1182
            float3 _S3167 = sampleVonMisesFisher_0(baseDirection_2, kappa_5, float2(rnd_2[_S3164], rnd_2[_S3165]));

#line 1182
            if(i_5 % 2U != 0U)
            {

#line 1182
                auxDir_2 = _reflect_0(- _S3167, baseDirection_2);

#line 1182
            }
            else
            {

#line 1182
                auxDir_2 = _S3167;

#line 1182
            }

#line 1182
            DiffPair_float3_0 _S3168 = { auxDir_2, _S3110 };

#line 1182
            DiffPair_DiffRay_0 _S3169 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S3124, _S3168, globalPixel_8);

#line 1182
            DiffPair_DiffRay_0 _S3170 = { _S3169.primal_0, _S3169.differential_0 };

#line 1182
            DiffPair_IntersectionInfo_0 _S3171;

#line 1182
            _S3171.primal_0 = _S3121;

#line 1182
            _S3171.differential_0 = _S3126;

#line 1182
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S3172;

#line 1182
            _S3172._S1199 = _S3108;

#line 1182
            _S3172.isHit_0 = false;

#line 1182
            bool _S3173 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S3125, _S3170, _S3171, int(1), _S3172);

#line 1182
            DiffPair_IntersectionInfo_0 _S3174 = _S3171;

#line 1182
            if(_S3173)
            {

#line 1182
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S3175;

#line 1182
                _S3175.boundaryTerm_0 = 0.0;

#line 1182
                DiffPair_float_0 _S3176 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S3174.primal_0, _S3112.primal_0.primal_0, auxDir_2, _S3166[_S3165], kappa_5, _S3127, _S3175);

#line 1182
                if(_S3176.primal_0 > 0.0)
                {

#line 1182
                    float _S3177 = totalWeight_9[int(0)] + _S3176.primal_0;

#line 1182
                    float _S3178 = s_diff_totalWeight_9[int(0)] + _S3176.differential_0;

#line 1182
                    totalWeight_8 = totalWeight_9;

#line 1182
                    totalWeight_8[int(0)] = _S3177;

#line 1182
                    s_diff_totalWeight_8 = s_diff_totalWeight_9;

#line 1182
                    s_diff_totalWeight_8[int(0)] = _S3178;

#line 1182
                    float3 _S3179 = (float3)_S3176.primal_0;

#line 1182
                    float3 _S3180 = totalWarpedPoint_9[int(0)] + _S3179 * _S3174.primal_0.posW_5;

#line 1182
                    float3 _S3181 = s_diff_totalWarpedPoint_9[int(0)] + ((float3)_S3176.differential_0 * _S3174.primal_0.posW_5 + _S3174.differential_0.posW_2 * _S3179);

#line 1182
                    totalWarpedPoint_8 = totalWarpedPoint_9;

#line 1182
                    totalWarpedPoint_8[int(0)] = _S3180;

#line 1182
                    s_diff_totalWarpedPoint_8 = s_diff_totalWarpedPoint_9;

#line 1182
                    s_diff_totalWarpedPoint_8[int(0)] = _S3181;

#line 1182
                }
                else
                {

#line 1182
                    totalWeight_8 = totalWeight_9;

#line 1182
                    s_diff_totalWeight_8 = s_diff_totalWeight_9;

#line 1182
                    totalWarpedPoint_8 = totalWarpedPoint_9;

#line 1182
                    s_diff_totalWarpedPoint_8 = s_diff_totalWarpedPoint_9;

#line 1182
                }

#line 1182
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S3182;

#line 1182
                _S3182.boundaryTerm_0 = 0.0;

#line 1182
                DiffPair_float_0 _S3183 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S3174.primal_0, _S3112.primal_0.primal_0, auxDir_2, _S3166[_S3165], kappa_5, _S3128, _S3182);

#line 1182
                if(_S3183.primal_0 > 0.0)
                {

#line 1182
                    float _S3184 = totalWeight_8[int(1)] + _S3183.primal_0;

#line 1182
                    float _S3185 = s_diff_totalWeight_8[int(1)] + _S3183.differential_0;

#line 1182
                    totalWeight_7 = totalWeight_8;

#line 1182
                    totalWeight_7[int(1)] = _S3184;

#line 1182
                    s_diff_totalWeight_7 = s_diff_totalWeight_8;

#line 1182
                    s_diff_totalWeight_7[int(1)] = _S3185;

#line 1182
                    float3 _S3186 = (float3)_S3183.primal_0;

#line 1182
                    float3 _S3187 = totalWarpedPoint_8[int(1)] + _S3186 * _S3174.primal_0.posW_5;

#line 1182
                    float3 _S3188 = s_diff_totalWarpedPoint_8[int(1)] + ((float3)_S3183.differential_0 * _S3174.primal_0.posW_5 + _S3174.differential_0.posW_2 * _S3186);

#line 1182
                    totalWarpedPoint_7 = totalWarpedPoint_8;

#line 1182
                    totalWarpedPoint_7[int(1)] = _S3187;

#line 1182
                    s_diff_totalWarpedPoint_7 = s_diff_totalWarpedPoint_8;

#line 1182
                    s_diff_totalWarpedPoint_7[int(1)] = _S3188;

#line 1182
                }
                else
                {

#line 1182
                    totalWeight_7 = totalWeight_8;

#line 1182
                    s_diff_totalWeight_7 = s_diff_totalWeight_8;

#line 1182
                    totalWarpedPoint_7 = totalWarpedPoint_8;

#line 1182
                    s_diff_totalWarpedPoint_7 = s_diff_totalWarpedPoint_8;

#line 1182
                }

#line 1182
                totalWeight_8 = totalWeight_7;

#line 1182
                s_diff_totalWeight_8 = s_diff_totalWeight_7;

#line 1182
                totalWarpedPoint_8 = totalWarpedPoint_7;

#line 1182
                s_diff_totalWarpedPoint_8 = s_diff_totalWarpedPoint_7;

#line 1182
            }
            else
            {

#line 1182
                totalWeight_8 = totalWeight_9;

#line 1182
                s_diff_totalWeight_8 = s_diff_totalWeight_9;

#line 1182
                totalWarpedPoint_8 = totalWarpedPoint_9;

#line 1182
                s_diff_totalWarpedPoint_8 = s_diff_totalWarpedPoint_9;

#line 1182
            }

#line 1182
            i_4 = int(2);

#line 1182
        }
        else
        {

#line 1182
            i_4 = _dc_0;

#line 1182
            totalWeight_8 = totalWeight_9;

#line 1182
            s_diff_totalWeight_8 = s_diff_totalWeight_9;

#line 1182
            totalWarpedPoint_8 = totalWarpedPoint_9;

#line 1182
            s_diff_totalWarpedPoint_8 = s_diff_totalWarpedPoint_9;

#line 1182
        }

#line 1182
        if(i_4 != int(2))
        {

#line 1182
            _bflag_7 = false;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        if(_bflag_7)
        {

#line 1182
            i_5 = i_5 + 1U;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        int _S3189 = _pc_3 + int(1);

#line 1182
        totalWeight_9 = totalWeight_8;

#line 1182
        s_diff_totalWeight_9 = s_diff_totalWeight_8;

#line 1182
        totalWarpedPoint_9 = totalWarpedPoint_8;

#line 1182
        s_diff_totalWarpedPoint_9 = s_diff_totalWarpedPoint_8;

#line 1182
        _pc_3 = _S3189;

#line 1182
    }

#line 1182
    float3 _S3190;

#line 1182
    float3 _S3191;

#line 1182
    float3 _S3192;

#line 1182
    float3 _S3193;

#line 1182
    float3 _S3194;

#line 1182
    float3 _S3195;

#line 1182
    float3 _S3196;

#line 1182
    float3 _S3197;

#line 1182
    float3 _S3198;

#line 1182
    float3 _S3199;

#line 1182
    float3 _S3200;

#line 1182
    float3 _S3201;

#line 1182
    float3 _S3202;

#line 1182
    DiffPair_float_0 _S3203;

#line 1182
    DiffPair_float_0 _S3204;

#line 1182
    DiffPair_float_0 _S3205;

#line 1182
    if(_S3115)
    {

#line 1182
        _S3190 = _S3152;

#line 1182
        _S3191 = _S3151;

#line 1182
        _S3192 = _S3150;

#line 1182
        _S3193 = _S3148;

#line 1182
        _S3194 = _s_diff_ctx_22._S1113[int(1)];

#line 1182
        _S3195 = _S3149;

#line 1182
        _S3196 = _s_diff_ctx_22._S1112[int(1)];

#line 1182
        _S3203.primal_0 = _s_diff_ctx_22._S1115[int(1)];

#line 1182
        _S3203.differential_0 = _s_diff_ctx_22._S1114[int(1)];

#line 1182
        _S3204.primal_0 = 0.00000000999999993923;

#line 1182
        _S3204.differential_0 = 0.0;

#line 1182
        _S3197 = _S3146;

#line 1182
        auxDir_2 = _S3145;

#line 1182
        _S3198 = _S3144;

#line 1182
        _S3199 = _S3142;

#line 1182
        _S3200 = _s_diff_ctx_22._S1113[int(0)];

#line 1182
        _S3201 = _S3143;

#line 1182
        _S3202 = _s_diff_ctx_22._S1112[int(0)];

#line 1182
        _S3205.primal_0 = _s_diff_ctx_22._S1115[int(0)];

#line 1182
        _S3205.differential_0 = _s_diff_ctx_22._S1114[int(0)];

#line 1182
    }
    else
    {

#line 1182
        _S3190 = _S3110;

#line 1182
        _S3191 = _S3110;

#line 1182
        _S3192 = _S3110;

#line 1182
        _S3193 = _S3110;

#line 1182
        _S3194 = _S3110;

#line 1182
        _S3195 = _S3110;

#line 1182
        _S3196 = _S3110;

#line 1182
        _S3203.primal_0 = 0.0;

#line 1182
        _S3203.differential_0 = 0.0;

#line 1182
        _S3204.primal_0 = 0.0;

#line 1182
        _S3204.differential_0 = 0.0;

#line 1182
        _S3197 = _S3110;

#line 1182
        auxDir_2 = _S3110;

#line 1182
        _S3198 = _S3110;

#line 1182
        _S3199 = _S3110;

#line 1182
        _S3200 = _S3110;

#line 1182
        _S3201 = _S3110;

#line 1182
        _S3202 = _S3110;

#line 1182
        _S3205.primal_0 = 0.0;

#line 1182
        _S3205.differential_0 = 0.0;

#line 1182
    }

#line 1182
    float _S3206;

#line 1182
    float _S3207;

#line 1182
    if(_S3115)
    {

#line 1182
        float3 _S3208 = dpdpwarpedPoint_2.differential_0[int(1)] / _S3190;

#line 1182
        float3 _S3209 = _S3192 * _S3208;

#line 1182
        float3 _S3210 = _S3193 * (_S3191 * - _S3208);

#line 1182
        float3 _S3211 = - _S3209;

#line 1182
        float3 _S3212 = _S3194 * _S3211;

#line 1182
        float3 _S3213 = _S3193 * _S3209;

#line 1189
        float3 _S3214 = _S3210 + _S3210 + _S3196 * _S3209 + _S3194 * - _S3153;

#line 1189
        float3 _S3215 = _S3195 * _S3211 + _S3193 * _S3153;

#line 1189
        DiffPair_float_0 _S3216 = { _S3214[int(0)] + _S3214[int(1)] + _S3214[int(2)], _S3212[int(0)] + _S3212[int(1)] + _S3212[int(2)] };

#line 1189
        DiffPair_4 _S3217;

#line 1189
        _S3217.primal_0 = _S3203;

#line 1189
        _S3217.differential_0 = _S3137;

#line 1189
        DiffPair_4 _S3218;

#line 1189
        _S3218.primal_0 = _S3204;

#line 1189
        _S3218.differential_0 = _S3137;

#line 1189
        s_bwd_d_max_0(_S3217, _S3218, _S3216);

#line 1189
        float3 _S3219 = dpdpwarpedPoint_2.differential_0[int(0)] / _S3197;

#line 1189
        float3 _S3220 = _S3198 * _S3219;

#line 1189
        float3 _S3221 = _S3199 * (auxDir_2 * - _S3219);

#line 1189
        float3 _S3222 = - _S3220;

#line 1189
        float3 _S3223 = _S3200 * _S3222;

#line 1189
        float3 _S3224 = _S3199 * _S3220;

#line 1189
        float3 _S3225 = _S3221 + _S3221 + _S3202 * _S3220 + _S3200 * - _S3154;

#line 1189
        float3 _S3226 = _S3201 * _S3222 + _S3199 * _S3154;

#line 1189
        DiffPair_float_0 _S3227 = { _S3225[int(0)] + _S3225[int(1)] + _S3225[int(2)], _S3223[int(0)] + _S3223[int(1)] + _S3223[int(2)] };

#line 1189
        DiffPair_4 _S3228;

#line 1189
        _S3228.primal_0 = _S3205;

#line 1189
        _S3228.differential_0 = _S3137;

#line 1189
        DiffPair_4 _S3229;

#line 1189
        _S3229.primal_0 = _S3139;

#line 1189
        _S3229.differential_0 = _S3137;

#line 1189
        s_bwd_d_max_0(_S3228, _S3229, _S3227);

#line 1189
        float3  _S3230[int(2)];

#line 1189
        _S3230[int(0)] = _S3110;

#line 1189
        _S3230[int(1)] = _S3110;

#line 1189
        _S3230[int(1)] = _S3213;

#line 1189
        _S3230[int(0)] = _S3224;

#line 1189
        float3  _S3231[int(2)];

#line 1189
        _S3231[int(0)] = _S3110;

#line 1189
        _S3231[int(1)] = _S3110;

#line 1189
        _S3231[int(1)] = _S3215;

#line 1189
        _S3231[int(0)] = _S3226;

#line 1189
        float  _S3232[int(2)];

#line 1189
        _S3232[int(0)] = 0.0;

#line 1189
        _S3232[int(1)] = 0.0;

#line 1189
        _S3232[int(1)] = _S3217.differential_0.differential_0;

#line 1189
        float  _S3233[int(2)];

#line 1189
        _S3233[int(0)] = 0.0;

#line 1189
        _S3233[int(1)] = 0.0;

#line 1189
        _S3233[int(1)] = _S3217.differential_0.primal_0;

#line 1189
        _S3206 = _S3228.differential_0.differential_0;

#line 1189
        _S3207 = _S3228.differential_0.primal_0;

#line 1189
        totalWeight_9[int(0)] = _S3232[int(0)];

#line 1189
        totalWeight_9[int(1)] = _S3232[int(1)];

#line 1189
        s_diff_totalWeight_9[int(0)] = _S3233[int(0)];

#line 1189
        s_diff_totalWeight_9[int(1)] = _S3233[int(1)];

#line 1189
        totalWarpedPoint_9[int(0)] = _S3231[int(0)];

#line 1189
        totalWarpedPoint_9[int(1)] = _S3231[int(1)];

#line 1189
        s_diff_totalWarpedPoint_9[int(0)] = _S3230[int(0)];

#line 1189
        s_diff_totalWarpedPoint_9[int(1)] = _S3230[int(1)];

#line 1189
    }
    else
    {

#line 1189
        _S3206 = 0.0;

#line 1189
        _S3207 = 0.0;

#line 1189
        totalWeight_9[int(0)] = 0.0;

#line 1189
        totalWeight_9[int(1)] = 0.0;

#line 1189
        s_diff_totalWeight_9[int(0)] = 0.0;

#line 1189
        s_diff_totalWeight_9[int(1)] = 0.0;

#line 1189
        totalWarpedPoint_9[int(0)] = _S3110;

#line 1189
        totalWarpedPoint_9[int(1)] = _S3110;

#line 1189
        s_diff_totalWarpedPoint_9[int(0)] = _S3110;

#line 1189
        s_diff_totalWarpedPoint_9[int(1)] = _S3110;

#line 1189
    }

#line 1189
    float  _S3234[int(2)];

#line 1189
    _S3234[int(0)] = 0.0;

#line 1189
    _S3234[int(1)] = 0.0;

#line 1189
    _S3234[int(0)] = _S3206;

#line 483
    float _S3235 = totalWeight_9[int(0)] + _S3234[int(0)];

#line 483
    float _S3236 = totalWeight_9[int(1)] + _S3234[int(1)];

#line 483
    float  _S3237[int(2)];

#line 483
    _S3237[int(0)] = 0.0;

#line 483
    _S3237[int(1)] = 0.0;

#line 483
    _S3237[int(0)] = _S3207;

#line 483
    float _S3238 = s_diff_totalWeight_9[int(0)] + _S3237[int(0)];

#line 483
    float _S3239 = s_diff_totalWeight_9[int(1)] + _S3237[int(1)];

#line 483
    _dc_0 = _S3119;

#line 483
    totalWeight_9[int(0)] = _S3238;

#line 483
    totalWeight_9[int(1)] = _S3239;

#line 483
    s_diff_totalWeight_9[int(0)] = _S3235;

#line 483
    s_diff_totalWeight_9[int(1)] = _S3236;

#line 483
    _S3190 = _S3110;

#line 483
    _S3191 = _S3110;

#line 483
    _S3192 = _S3110;

#line 483
    _S3193 = _S3110;

#line 483
    _S3194 = _S3110;

#line 483
    _S3195 = _S3110;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3240 = _S3117;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3241 = _S3116;

#line 483
    totalWeight_8[int(0)] = 0.0;

#line 483
    totalWeight_8[int(1)] = 0.0;

#line 483
    s_diff_totalWeight_8[int(0)] = 0.0;

#line 483
    s_diff_totalWeight_8[int(1)] = 0.0;

#line 483
    totalWarpedPoint_8[int(0)] = _S3110;

#line 483
    totalWarpedPoint_8[int(1)] = _S3110;

#line 483
    s_diff_totalWarpedPoint_8[int(0)] = _S3110;

#line 483
    s_diff_totalWarpedPoint_8[int(1)] = _S3110;

#line 483
    totalWeight_7[int(0)] = 0.0;

#line 483
    totalWeight_7[int(1)] = 0.0;

#line 483
    s_diff_totalWeight_7[int(0)] = 0.0;

#line 483
    s_diff_totalWeight_7[int(1)] = 0.0;

#line 483
    totalWarpedPoint_7[int(0)] = _S3110;

#line 483
    totalWarpedPoint_7[int(1)] = _S3110;

#line 483
    s_diff_totalWarpedPoint_7[int(0)] = _S3110;

#line 483
    s_diff_totalWarpedPoint_7[int(1)] = _S3110;

#line 483
    s_diff_s_diff_IntersectionInfo_0 _S3242 = _S3118;

#line 483
    s_diff_s_diff_IntersectionInfo_0 _S3243 = _S3118;

#line 483
    _S3196 = _S3110;

#line 483
    _S3197 = _S3110;

#line 483
    rnd_2[int(0)] = 0.0;

#line 483
    rnd_2[int(1)] = 0.0;

#line 483
    rnd_2[int(2)] = 0.0;

#line 483
    rnd_2[int(3)] = 0.0;

#line 483
    rnd_2[int(4)] = 0.0;

#line 483
    rnd_2[int(5)] = 0.0;

#line 483
    rnd_2[int(6)] = 0.0;

#line 483
    rnd_2[int(7)] = 0.0;

#line 483
    rnd_2[int(8)] = 0.0;

#line 483
    rnd_2[int(9)] = 0.0;

#line 483
    rnd_2[int(10)] = 0.0;

#line 483
    rnd_2[int(11)] = 0.0;

#line 483
    rnd_2[int(12)] = 0.0;

#line 483
    rnd_2[int(13)] = 0.0;

#line 483
    rnd_2[int(14)] = 0.0;

#line 483
    rnd_2[int(15)] = 0.0;

#line 483
    for(;;)
    {

#line 483
        if(_dc_0 >= int(0))
        {
        }
        else
        {

#line 483
            break;
        }

#line 483
        bool _S3244 = _dc_0 < 16U;

#line 483
        bool _S3245;

#line 483
        bool _S3246;

#line 483
        uint _S3247;

#line 483
        float3 _S3248;

#line 483
        float3 _S3249;

#line 483
        float3 _S3250;

#line 483
        DiffPair_float3_0 _S3251;

#line 483
        DiffPair_float3_0 _S3252;

#line 483
        DiffPair_float3_0 _S3253;

#line 483
        DiffPair_float3_0 _S3254;

#line 483
        IntersectionInfo_0 _S3255;

#line 483
        DiffPair_DifferentiableSceneQuery_0 _S3256;

#line 483
        DiffPair_DiffRay_0 _S3257;

#line 483
        if(_S3244)
        {

#line 483
            uint _S3258 = _dc_0 / 2U * 2U;

#line 483
            uint _S3259 = _S3258 + 1U;

#line 483
            int _S3260 = _dc_0;

#line 483
            if(_dc_0 % 2U != 0U)
            {

#line 483
                auxDir_2 = _s_diff_ctx_22._S1108[_dc_0];

#line 483
            }
            else
            {

#line 483
                auxDir_2 = _s_diff_ctx_22._S1109[_S3260];

#line 483
            }

#line 483
            float3 _S3261 = auxDir_2;

#line 483
            DiffPair_float3_0 _S3262 = { auxDir_2, _S3110 };

#line 483
            DiffPair_DiffRay_0 _S3263 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S3124, _S3262, globalPixel_8);

#line 483
            DiffPair_DiffRay_0 _S3264 = { _S3263.primal_0, _S3263.differential_0 };

#line 483
            DiffPair_IntersectionInfo_0 _S3265;

#line 483
            _S3265.primal_0 = _S3121;

#line 483
            _S3265.differential_0 = _S3126;

#line 483
            bool _S3266 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S3125, _S3264, _S3265, int(1), _S3109);

#line 483
            DiffPair_IntersectionInfo_0 _S3267 = _S3265;

#line 483
            if(_S3266)
            {

#line 483
                int _S3268 = _dc_0;

#line 483
                bool _S3269 = _s_diff_ctx_22._S1106[_dc_0].primal_0 > 0.0;

#line 483
                if(_S3269)
                {

#line 483
                    float3 _S3270 = (float3)_s_diff_ctx_22._S1106[_S3268].primal_0;

#line 483
                    float3 _S3271 = (float3)_s_diff_ctx_22._S1106[_S3268].differential_0;

#line 483
                    _S3198 = _S3267.differential_0.posW_2;

#line 483
                    _S3199 = _S3270;

#line 483
                    _S3200 = _S3271;

#line 483
                    _S3201 = _S3267.primal_0.posW_5;

#line 483
                }
                else
                {

#line 483
                    _S3198 = _S3110;

#line 483
                    _S3199 = _S3110;

#line 483
                    _S3200 = _S3110;

#line 483
                    _S3201 = _S3110;

#line 483
                }

#line 483
                int _S3272 = _dc_0;

#line 483
                bool _S3273 = _s_diff_ctx_22._S1104[_dc_0].primal_0 > 0.0;

#line 483
                if(_S3273)
                {

#line 483
                    float3 _S3274 = (float3)_s_diff_ctx_22._S1104[_S3272].primal_0;

#line 483
                    float3 _S3275 = (float3)_s_diff_ctx_22._S1104[_S3272].differential_0;

#line 483
                    _S3202 = _S3267.differential_0.posW_2;

#line 483
                    _S3248 = _S3274;

#line 483
                    _S3249 = _S3275;

#line 483
                    _S3250 = _S3267.primal_0.posW_5;

#line 483
                }
                else
                {

#line 483
                    _S3202 = _S3110;

#line 483
                    _S3248 = _S3110;

#line 483
                    _S3249 = _S3110;

#line 483
                    _S3250 = _S3110;

#line 483
                }

#line 483
                float3 _S3276 = _S3198;

#line 483
                float3 _S3277 = _S3199;

#line 483
                float3 _S3278 = _S3200;

#line 483
                float3 _S3279 = _S3201;

#line 483
                _bflag_7 = _S3273;

#line 483
                _S3198 = _S3202;

#line 483
                _S3199 = _S3248;

#line 483
                _S3200 = _S3249;

#line 483
                _S3201 = _S3250;

#line 483
                _S3251.primal_0 = _S3113.primal_0.primal_0[int(1)];

#line 483
                _S3251.differential_0 = _S3113.primal_0.differential_0[int(1)];

#line 483
                _S3245 = _S3269;

#line 483
                _S3202 = _S3276;

#line 483
                _S3248 = _S3277;

#line 483
                _S3249 = _S3278;

#line 483
                _S3250 = _S3279;

#line 483
                _S3252.primal_0 = _S3113.primal_0.primal_0[int(0)];

#line 483
                _S3252.differential_0 = _S3113.primal_0.differential_0[int(0)];

#line 483
            }
            else
            {

#line 483
                _bflag_7 = false;

#line 483
                _S3198 = _S3110;

#line 483
                _S3199 = _S3110;

#line 483
                _S3200 = _S3110;

#line 483
                _S3201 = _S3110;

#line 483
                _S3251.primal_0 = _S3110;

#line 483
                _S3251.differential_0 = _S3110;

#line 483
                _S3245 = false;

#line 483
                _S3202 = _S3110;

#line 483
                _S3248 = _S3110;

#line 483
                _S3249 = _S3110;

#line 483
                _S3250 = _S3110;

#line 483
                _S3252.primal_0 = _S3110;

#line 483
                _S3252.differential_0 = _S3110;

#line 483
            }

#line 483
            float3 _S3280 = auxDir_2;

#line 483
            bool _S3281 = _bflag_7;

#line 483
            bool _S3282 = _S3245;

#line 483
            _bflag_7 = _S3266;

#line 483
            _S3245 = _S3281;

#line 483
            auxDir_2 = _S3198;

#line 483
            _S3198 = _S3199;

#line 483
            _S3199 = _S3200;

#line 483
            _S3200 = _S3201;

#line 483
            _S3255 = _S3267.primal_0;

#line 483
            _S3201 = _S3280;

#line 483
            _S3206 = _s_diff_ctx_22._S1117[_S3259];

#line 483
            _S3246 = _S3282;

#line 483
            _S3256.primal_0 = _S3111.primal_0.primal_0;

#line 483
            _S3256.differential_0 = _S3111.primal_0.differential_0;

#line 483
            _S3257.primal_0 = _S3263.primal_0;

#line 483
            _S3257.differential_0 = _S3263.differential_0;

#line 483
            _S3253.primal_0 = _S3112.primal_0.primal_0;

#line 483
            _S3253.differential_0 = _S3112.primal_0.differential_0;

#line 483
            _S3254.primal_0 = _S3261;

#line 483
            _S3254.differential_0 = _S3110;

#line 483
            i_5 = _S3259;

#line 483
            _S3247 = _S3258;

#line 483
        }
        else
        {

#line 483
            _bflag_7 = false;

#line 483
            _S3245 = false;

#line 483
            auxDir_2 = _S3110;

#line 483
            _S3198 = _S3110;

#line 483
            _S3199 = _S3110;

#line 483
            _S3200 = _S3110;

#line 483
            _S3255.triangleID_2 = 0U;

#line 483
            _S3255.instanceID_7 = _S3120;

#line 483
            _S3255.barycentrics_2 = _S3110;

#line 483
            _S3255.normalW_2 = _S3110;

#line 483
            _S3255.posW_5 = _S3110;

#line 483
            _S3255.hitT_5 = 0.0;

#line 483
            _S3201 = _S3110;

#line 483
            _S3206 = 0.0;

#line 483
            _S3251.primal_0 = _S3110;

#line 483
            _S3251.differential_0 = _S3110;

#line 483
            _S3246 = false;

#line 483
            _S3202 = _S3110;

#line 483
            _S3248 = _S3110;

#line 483
            _S3249 = _S3110;

#line 483
            _S3250 = _S3110;

#line 483
            _S3252.primal_0 = _S3110;

#line 483
            _S3252.differential_0 = _S3110;

#line 483
            _S3256.primal_0 = _S3133;

#line 483
            _S3256.differential_0 = _S3134;

#line 483
            _S3257.primal_0 = _S3130;

#line 483
            _S3257.differential_0 = _S3131;

#line 483
            _S3253.primal_0 = _S3110;

#line 483
            _S3253.differential_0 = _S3110;

#line 483
            _S3254.primal_0 = _S3110;

#line 483
            _S3254.differential_0 = _S3110;

#line 483
            i_5 = 0U;

#line 483
            _S3247 = 0U;

#line 483
        }

#line 483
        float3  _S3283[int(2)] = s_diff_totalWarpedPoint_9;

#line 483
        float3  _S3284[int(2)] = s_diff_totalWarpedPoint_9;

#line 483
        float  _S3285[int(2)] = totalWeight_9;

#line 483
        float  _S3286[int(2)] = totalWeight_9;

#line 483
        float  _S3287[int(2)] = s_diff_totalWeight_9;

#line 483
        float  _S3288[int(2)] = s_diff_totalWeight_9;

#line 483
        float3  _S3289[int(2)] = totalWarpedPoint_9;

#line 483
        float3  _S3290[int(2)] = totalWarpedPoint_9;

#line 483
        if(_S3244)
        {

#line 483
            float  _S3291[int(2)];

#line 483
            float  _S3292[int(2)];

#line 483
            float  _S3293[int(2)];

#line 483
            float  _S3294[int(2)];

#line 483
            float  _S3295[int(2)];

#line 483
            float  _S3296[int(2)];

#line 483
            float3  _S3297[int(2)];

#line 483
            float3  _S3298[int(2)];

#line 483
            float3  _S3299[int(2)];

#line 483
            float3  _S3300[int(2)];

#line 483
            float3  _S3301[int(2)];

#line 483
            float3  _S3302[int(2)];

#line 483
            float3 _S3303;

#line 483
            float3 _S3304;

#line 483
            float3 _S3305;

#line 483
            float3 _S3306;

#line 483
            float3 _S3307;

#line 483
            s_diff_s_diff_IntersectionInfo_0 _S3308;

#line 483
            s_diff_s_diff_IntersectionInfo_0 _S3309;

#line 483
            if(_bflag_7)
            {

#line 483
                float _S3310 = _S3285[int(0)] + totalWeight_8[int(0)];

#line 483
                float _S3311 = _S3286[int(1)] + totalWeight_8[int(1)];

#line 483
                float _S3312 = _S3287[int(0)] + s_diff_totalWeight_8[int(0)];

#line 483
                float _S3313 = _S3288[int(1)] + s_diff_totalWeight_8[int(1)];

#line 1189
                float3 _S3314 = _S3289[int(0)] + totalWarpedPoint_8[int(0)];

#line 1189
                float3 _S3315 = _S3290[int(1)] + totalWarpedPoint_8[int(1)];

#line 1189
                float3 _S3316 = _S3283[int(0)] + s_diff_totalWarpedPoint_8[int(0)];

#line 1189
                float3 _S3317 = _S3284[int(1)] + s_diff_totalWarpedPoint_8[int(1)];

#line 1189
                float _S3318;

#line 1189
                if(_S3245)
                {

#line 1189
                    float3 _S3319 = _S3198 * _S3317;

#line 1189
                    float3 _S3320 = _S3200 * _S3317;

#line 1189
                    float3 _S3321 = _S3199 * _S3317 + _S3198 * _S3315;

#line 1189
                    float3 _S3322 = auxDir_2 * _S3317 + _S3200 * _S3315;

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3323 = _S3118;

#line 1189
                    _S3323.posW_2 = _S3319;

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3324 = IntersectionInfo_x24_syn_dadd_0(_S3242, _S3323);

#line 483
                    float _S3325 = _S3322[int(0)] + _S3322[int(1)] + _S3322[int(2)] + _S3311;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3326 = _S3118;

#line 483
                    _S3326.posW_2 = _S3321;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3327 = IntersectionInfo_x24_syn_dadd_0(_S3243, _S3326);

#line 1189
                    float3 _S3328 = _S3316 + s_diff_totalWarpedPoint_7[int(0)];

#line 1189
                    float3  _S3329[int(2)];

#line 1189
                    _S3329[int(0)] = _S3110;

#line 1189
                    _S3329[int(1)] = _S3110;

#line 1189
                    _S3329[int(1)] = _S3317;

#line 1189
                    float3 _S3330 = _S3328 + _S3329[int(0)];

#line 1189
                    float3 _S3331 = s_diff_totalWarpedPoint_7[int(1)] + _S3329[int(1)];

#line 1189
                    float3 _S3332 = _S3314 + totalWarpedPoint_7[int(0)];

#line 1189
                    float3  _S3333[int(2)];

#line 1189
                    _S3333[int(0)] = _S3110;

#line 1189
                    _S3333[int(1)] = _S3110;

#line 1189
                    _S3333[int(1)] = _S3315;

#line 1189
                    float3 _S3334 = _S3332 + _S3333[int(0)];

#line 1189
                    float3 _S3335 = totalWarpedPoint_7[int(1)] + _S3333[int(1)];

#line 483
                    float _S3336 = _S3320[int(0)] + _S3320[int(1)] + _S3320[int(2)] + _S3313;

#line 483
                    float _S3337 = _S3312 + s_diff_totalWeight_7[int(0)];

#line 483
                    float  _S3338[int(2)];

#line 483
                    _S3338[int(0)] = 0.0;

#line 483
                    _S3338[int(1)] = 0.0;

#line 483
                    _S3338[int(1)] = _S3313;

#line 483
                    float _S3339 = _S3337 + _S3338[int(0)];

#line 483
                    float _S3340 = s_diff_totalWeight_7[int(1)] + _S3338[int(1)];

#line 483
                    float _S3341 = _S3310 + totalWeight_7[int(0)];

#line 483
                    float  _S3342[int(2)];

#line 483
                    _S3342[int(0)] = 0.0;

#line 483
                    _S3342[int(1)] = 0.0;

#line 483
                    _S3342[int(1)] = _S3311;

#line 483
                    float _S3343 = _S3341 + _S3342[int(0)];

#line 483
                    float _S3344 = totalWeight_7[int(1)] + _S3342[int(1)];

#line 483
                    _S3207 = _S3336;

#line 483
                    _S3318 = _S3325;

#line 483
                    _S3308 = _S3327;

#line 483
                    _S3291[int(0)] = _S3343;

#line 483
                    _S3291[int(1)] = _S3344;

#line 483
                    _S3292[int(0)] = _S3339;

#line 483
                    _S3292[int(1)] = _S3340;

#line 483
                    _S3297[int(0)] = _S3334;

#line 483
                    _S3297[int(1)] = _S3335;

#line 483
                    _S3298[int(0)] = _S3330;

#line 483
                    _S3298[int(1)] = _S3331;

#line 483
                    _S3309 = _S3324;

#line 483
                }
                else
                {

#line 483
                    float _S3345 = _S3310 + totalWeight_7[int(0)];

#line 483
                    float _S3346 = _S3311 + totalWeight_7[int(1)];

#line 483
                    float _S3347 = _S3312 + s_diff_totalWeight_7[int(0)];

#line 483
                    float _S3348 = _S3313 + s_diff_totalWeight_7[int(1)];

#line 1189
                    float3 _S3349 = _S3314 + totalWarpedPoint_7[int(0)];

#line 1189
                    float3 _S3350 = _S3315 + totalWarpedPoint_7[int(1)];

#line 1189
                    float3 _S3351 = _S3316 + s_diff_totalWarpedPoint_7[int(0)];

#line 1189
                    float3 _S3352 = _S3317 + s_diff_totalWarpedPoint_7[int(1)];

#line 1189
                    _S3207 = 0.0;

#line 1189
                    _S3318 = 0.0;

#line 1189
                    _S3308 = _S3243;

#line 1189
                    _S3291[int(0)] = _S3345;

#line 1189
                    _S3291[int(1)] = _S3346;

#line 1189
                    _S3292[int(0)] = _S3347;

#line 1189
                    _S3292[int(1)] = _S3348;

#line 1189
                    _S3297[int(0)] = _S3349;

#line 1189
                    _S3297[int(1)] = _S3350;

#line 1189
                    _S3298[int(0)] = _S3351;

#line 1189
                    _S3298[int(1)] = _S3352;

#line 1189
                    _S3309 = _S3242;

#line 1189
                }

#line 1189
                DiffPair_float_0 _S3353 = { _S3318, _S3207 };

#line 1189
                IntersectionInfo_0 _S3354 = _S3255;

#line 1189
                DiffPair_IntersectionInfo_0 _S3355;

#line 1189
                _S3355.primal_0 = _S3255;

#line 1189
                _S3355.differential_0 = _S3118;

#line 1189
                DiffPair_float3_0 _S3356;

#line 1189
                _S3356.primal_0 = _S3112.primal_0.primal_0;

#line 1189
                _S3356.differential_0 = _S3110;

#line 1189
                float3 _S3357 = _S3201;

#line 1189
                DiffPair_float3_0 _S3358;

#line 1189
                _S3358.primal_0 = _S3201;

#line 1189
                _S3358.differential_0 = _S3110;

#line 1189
                float _S3359 = _S3206;

#line 1189
                DiffPair_float_0 _S3360;

#line 1189
                _S3360.primal_0 = _S3206;

#line 1189
                _S3360.differential_0 = 0.0;

#line 1189
                DiffPair_float_0 _S3361;

#line 1189
                _S3361.primal_0 = kappa_5;

#line 1189
                _S3361.differential_0 = 0.0;

#line 1189
                DiffPair_3 _S3362;

#line 1189
                _S3362.primal_0 = _S3251;

#line 1189
                _S3362.differential_0 = _S3129;

#line 1189
                s_bwd_fwd_computeHarmonicWeightMisuba_0(_S3355, _S3356, _S3358, _S3360, _S3361, _S3362, _S3353, _s_diff_ctx_22._S1105[_dc_0]);

#line 1189
                DiffPair_float_0 _S3363 = _S3360;

#line 1189
                float3 _S3364 = _S3362.differential_0.differential_0 + _S3190;

#line 1189
                float3 _S3365 = _S3356.differential_0 + _S3194;

#line 1189
                float3 _S3366 = _S3362.differential_0.primal_0 + _S3191;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3367 = IntersectionInfo_x24_syn_dadd_0(_S3355.differential_0, _S3308);

#line 1189
                float _S3368;

#line 1189
                float _S3369;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3370;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3371;

#line 1189
                if(_S3246)
                {

#line 1189
                    float3 _S3372 = _S3248 * _S3298[int(0)];

#line 1189
                    float3 _S3373 = _S3250 * _S3298[int(0)];

#line 1189
                    float3 _S3374 = _S3249 * _S3298[int(0)] + _S3248 * _S3297[int(0)];

#line 1189
                    float3 _S3375 = _S3202 * _S3298[int(0)] + _S3250 * _S3297[int(0)];

#line 483
                    float _S3376 = _S3375[int(0)] + _S3375[int(1)] + _S3375[int(2)] + _S3291[int(0)];

#line 483
                    float3  _S3377[int(2)];

#line 483
                    _S3377[int(0)] = _S3110;

#line 483
                    _S3377[int(1)] = _S3110;

#line 483
                    _S3377[int(0)] = _S3298[int(0)];

#line 1189
                    float3 _S3378 = _S3298[int(1)] + _S3377[int(1)];

#line 1189
                    float3  _S3379[int(2)];

#line 1189
                    _S3379[int(0)] = _S3110;

#line 1189
                    _S3379[int(1)] = _S3110;

#line 1189
                    _S3379[int(0)] = _S3297[int(0)];

#line 1189
                    float3 _S3380 = _S3297[int(1)] + _S3379[int(1)];

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3381 = _S3118;

#line 1189
                    _S3381.posW_2 = _S3372;

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3382 = IntersectionInfo_x24_syn_dadd_0(_S3309, _S3381);

#line 1189
                    float  _S3383[int(2)];

#line 1189
                    _S3383[int(0)] = 0.0;

#line 1189
                    _S3383[int(1)] = 0.0;

#line 1189
                    _S3383[int(0)] = _S3292[int(0)];

#line 483
                    float _S3384 = _S3292[int(1)] + _S3383[int(1)];

#line 483
                    float  _S3385[int(2)];

#line 483
                    _S3385[int(0)] = 0.0;

#line 483
                    _S3385[int(1)] = 0.0;

#line 483
                    _S3385[int(0)] = _S3291[int(0)];

#line 483
                    float _S3386 = _S3291[int(1)] + _S3385[int(1)];

#line 483
                    float _S3387 = _S3373[int(0)] + _S3373[int(1)] + _S3373[int(2)] + _S3292[int(0)];

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3388 = _S3118;

#line 483
                    _S3388.posW_2 = _S3374;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3389 = IntersectionInfo_x24_syn_dadd_0(_S3367, _S3388);

#line 483
                    _S3368 = _S3387;

#line 483
                    _S3369 = _S3376;

#line 483
                    _S3370 = _S3389;

#line 483
                    _S3371 = _S3382;

#line 483
                    _S3293[int(0)] = _S3385[int(0)];

#line 483
                    _S3293[int(1)] = _S3386;

#line 483
                    _S3294[int(0)] = _S3383[int(0)];

#line 483
                    _S3294[int(1)] = _S3384;

#line 483
                    _S3299[int(0)] = _S3379[int(0)];

#line 483
                    _S3299[int(1)] = _S3380;

#line 483
                    _S3300[int(0)] = _S3377[int(0)];

#line 483
                    _S3300[int(1)] = _S3378;

#line 483
                }
                else
                {

#line 483
                    _S3368 = 0.0;

#line 483
                    _S3369 = 0.0;

#line 483
                    _S3370 = _S3367;

#line 483
                    _S3371 = _S3309;

#line 483
                    _S3293[int(0)] = _S3291[int(0)];

#line 483
                    _S3293[int(1)] = _S3291[int(1)];

#line 483
                    _S3294[int(0)] = _S3292[int(0)];

#line 483
                    _S3294[int(1)] = _S3292[int(1)];

#line 483
                    _S3299[int(0)] = _S3297[int(0)];

#line 483
                    _S3299[int(1)] = _S3297[int(1)];

#line 483
                    _S3300[int(0)] = _S3298[int(0)];

#line 483
                    _S3300[int(1)] = _S3298[int(1)];

#line 483
                }

#line 483
                DiffPair_float_0 _S3390 = { _S3369, _S3368 };

#line 483
                DiffPair_IntersectionInfo_0 _S3391;

#line 483
                _S3391.primal_0 = _S3354;

#line 483
                _S3391.differential_0 = _S3118;

#line 483
                DiffPair_float3_0 _S3392;

#line 483
                _S3392.primal_0 = _S3112.primal_0.primal_0;

#line 483
                _S3392.differential_0 = _S3110;

#line 483
                DiffPair_float3_0 _S3393;

#line 483
                _S3393.primal_0 = _S3357;

#line 483
                _S3393.differential_0 = _S3110;

#line 483
                DiffPair_float_0 _S3394;

#line 483
                _S3394.primal_0 = _S3359;

#line 483
                _S3394.differential_0 = 0.0;

#line 483
                DiffPair_float_0 _S3395;

#line 483
                _S3395.primal_0 = kappa_5;

#line 483
                _S3395.differential_0 = 0.0;

#line 483
                DiffPair_3 _S3396;

#line 483
                _S3396.primal_0 = _S3252;

#line 483
                _S3396.differential_0 = _S3129;

#line 483
                s_bwd_fwd_computeHarmonicWeightMisuba_0(_S3391, _S3392, _S3393, _S3394, _S3395, _S3396, _S3390, _s_diff_ctx_22._S1107[_dc_0]);

#line 483
                float _S3397 = _S3394.differential_0 + _S3363.differential_0;

#line 1189
                float3 _S3398 = _S3392.differential_0 + _S3365;

#line 1189
                float3 _S3399 = _S3396.differential_0.differential_0 + _S3192;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3400 = IntersectionInfo_x24_syn_dadd_0(_S3391.differential_0, _S3370);

#line 1189
                float3 _S3401 = _S3396.differential_0.primal_0 + _S3193;

#line 1189
                _S3308 = _S3371;

#line 1189
                _S3309 = _S3400;

#line 1189
                _S3303 = _S3398;

#line 1189
                _S3207 = _S3397;

#line 1189
                _S3291 = _S3293;

#line 1189
                _S3292 = _S3294;

#line 1189
                _S3297 = _S3299;

#line 1189
                _S3298 = _S3300;

#line 1189
                _S3304 = _S3364;

#line 1189
                _S3305 = _S3366;

#line 1189
                _S3306 = _S3399;

#line 1189
                _S3307 = _S3401;

#line 1189
                _S3293[int(0)] = 0.0;

#line 1189
                _S3293[int(1)] = 0.0;

#line 1189
                _S3294[int(0)] = 0.0;

#line 1189
                _S3294[int(1)] = 0.0;

#line 1189
                _S3299[int(0)] = _S3110;

#line 1189
                _S3299[int(1)] = _S3110;

#line 1189
                _S3300[int(0)] = _S3110;

#line 1189
                _S3300[int(1)] = _S3110;

#line 1189
                _S3295[int(0)] = 0.0;

#line 1189
                _S3295[int(1)] = 0.0;

#line 1189
                _S3296[int(0)] = 0.0;

#line 1189
                _S3296[int(1)] = 0.0;

#line 1189
                _S3301[int(0)] = _S3110;

#line 1189
                _S3301[int(1)] = _S3110;

#line 1189
                _S3302[int(0)] = _S3110;

#line 1189
                _S3302[int(1)] = _S3110;

#line 1189
            }
            else
            {

#line 1189
                _S3308 = _S3242;

#line 1189
                _S3309 = _S3243;

#line 1189
                _S3303 = _S3194;

#line 1189
                _S3207 = 0.0;

#line 1189
                _S3291[int(0)] = _S3285[int(0)];

#line 1189
                _S3291[int(1)] = _S3286[int(1)];

#line 1189
                _S3292[int(0)] = _S3287[int(0)];

#line 1189
                _S3292[int(1)] = _S3288[int(1)];

#line 1189
                _S3297[int(0)] = _S3289[int(0)];

#line 1189
                _S3297[int(1)] = _S3290[int(1)];

#line 1189
                _S3298[int(0)] = _S3283[int(0)];

#line 1189
                _S3298[int(1)] = _S3284[int(1)];

#line 1189
                _S3304 = _S3190;

#line 1189
                _S3305 = _S3191;

#line 1189
                _S3306 = _S3192;

#line 1189
                _S3307 = _S3193;

#line 1189
                _S3293 = totalWeight_8;

#line 1189
                _S3294 = s_diff_totalWeight_8;

#line 1189
                _S3299 = totalWarpedPoint_8;

#line 1189
                _S3300 = s_diff_totalWarpedPoint_8;

#line 1189
                _S3295 = totalWeight_7;

#line 1189
                _S3296 = s_diff_totalWeight_7;

#line 1189
                _S3301 = totalWarpedPoint_7;

#line 1189
                _S3302 = s_diff_totalWarpedPoint_7;

#line 1189
            }

#line 1189
            DiffPair_s_diff_s_diff_IntersectionInfo_0 _S3402 = { IntersectionInfo_x24_syn_dadd_0(_S3118, IntersectionInfo_x24_syn_dadd_0(_S3118, _S3309)), IntersectionInfo_x24_syn_dadd_0(_S3118, IntersectionInfo_x24_syn_dadd_0(_S3308, _S3118)) };

#line 1189
            DiffPair_0 _S3403;

#line 1189
            _S3403.primal_0 = _S3256;

#line 1189
            _S3403.differential_0 = _S3135;

#line 1189
            DiffPair_6 _S3404;

#line 1189
            _S3404.primal_0 = _S3257;

#line 1189
            _S3404.differential_0 = _S3136;

#line 1189
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S3403, _S3404, _S3402, int(1), _S3109);

#line 1189
            DiffPair_s_diff_s_diff_DiffRay_0 _S3405 = { DiffRay_x24_syn_dadd_0(_S3122, _S3404.differential_0.primal_0), DiffRay_x24_syn_dadd_0(_S3404.differential_0.differential_0, _S3122) };

#line 1189
            DiffPair_3 _S3406;

#line 1189
            _S3406.primal_0 = _S3253;

#line 1189
            _S3406.differential_0 = _S3129;

#line 1189
            DiffPair_3 _S3407;

#line 1189
            _S3407.primal_0 = _S3254;

#line 1189
            _S3407.differential_0 = _S3129;

#line 1189
            s_bwd_s_fwd_DiffRay_x24init_0(_S3406, _S3407, globalPixel_8, _S3405);

#line 1189
            s_diff_s_diff_DifferentiableSceneQuery_0 _S3408 = DifferentiableSceneQuery_x24_syn_dadd_0(_S3403.differential_0.primal_0, _S3240);

#line 1189
            float3 _S3409 = _S3407.differential_0.differential_0 + _S3197;

#line 1189
            float3 _S3410 = _S3406.differential_0.primal_0 + _S3303;

#line 1189
            s_diff_s_diff_DifferentiableSceneQuery_0 _S3411 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3403.differential_0.differential_0, _S3241);

#line 1189
            float3 _S3412 = _S3406.differential_0.differential_0 + _S3195;

#line 483
            float _S3413 = _S3123[int(1)] + _S3207;

#line 483
            float  _S3414[int(16)];

#line 483
            _S3414[int(0)] = 0.0;

#line 483
            _S3414[int(1)] = 0.0;

#line 483
            _S3414[int(2)] = 0.0;

#line 483
            _S3414[int(3)] = 0.0;

#line 483
            _S3414[int(4)] = 0.0;

#line 483
            _S3414[int(5)] = 0.0;

#line 483
            _S3414[int(6)] = 0.0;

#line 483
            _S3414[int(7)] = 0.0;

#line 483
            _S3414[int(8)] = 0.0;

#line 483
            _S3414[int(9)] = 0.0;

#line 483
            _S3414[int(10)] = 0.0;

#line 483
            _S3414[int(11)] = 0.0;

#line 483
            _S3414[int(12)] = 0.0;

#line 483
            _S3414[int(13)] = 0.0;

#line 483
            _S3414[int(14)] = 0.0;

#line 483
            _S3414[int(15)] = 0.0;

#line 483
            _S3414[i_5] = _S3413;

#line 483
            _S3414[_S3247] = _S3123[int(0)];

#line 483
            float _S3415 = rnd_2[int(0)] + _S3414[int(0)];

#line 483
            float _S3416 = rnd_2[int(1)] + _S3414[int(1)];

#line 483
            float _S3417 = rnd_2[int(2)] + _S3414[int(2)];

#line 483
            float _S3418 = rnd_2[int(3)] + _S3414[int(3)];

#line 483
            float _S3419 = rnd_2[int(4)] + _S3414[int(4)];

#line 483
            float _S3420 = rnd_2[int(5)] + _S3414[int(5)];

#line 483
            float _S3421 = rnd_2[int(6)] + _S3414[int(6)];

#line 483
            float _S3422 = rnd_2[int(7)] + _S3414[int(7)];

#line 483
            float _S3423 = rnd_2[int(8)] + _S3414[int(8)];

#line 483
            float _S3424 = rnd_2[int(9)] + _S3414[int(9)];

#line 483
            float _S3425 = rnd_2[int(10)] + _S3414[int(10)];

#line 483
            float _S3426 = rnd_2[int(11)] + _S3414[int(11)];

#line 483
            float _S3427 = rnd_2[int(12)] + _S3414[int(12)];

#line 483
            float _S3428 = rnd_2[int(13)] + _S3414[int(13)];

#line 483
            float _S3429 = rnd_2[int(14)] + _S3414[int(14)];

#line 483
            float _S3430 = rnd_2[int(15)] + _S3414[int(15)];

#line 483
            totalWeight_9 = _S3291;

#line 483
            s_diff_totalWeight_9 = _S3292;

#line 483
            totalWarpedPoint_9 = _S3297;

#line 483
            s_diff_totalWarpedPoint_9 = _S3298;

#line 483
            _S3190 = _S3304;

#line 483
            _S3191 = _S3305;

#line 483
            _S3192 = _S3306;

#line 483
            _S3193 = _S3307;

#line 483
            _S3194 = _S3410;

#line 483
            _S3195 = _S3412;

#line 483
            _S3240 = _S3408;

#line 483
            _S3241 = _S3411;

#line 483
            totalWeight_8 = _S3293;

#line 483
            s_diff_totalWeight_8 = _S3294;

#line 483
            totalWarpedPoint_8 = _S3299;

#line 483
            s_diff_totalWarpedPoint_8 = _S3300;

#line 483
            totalWeight_7 = _S3295;

#line 483
            s_diff_totalWeight_7 = _S3296;

#line 483
            totalWarpedPoint_7 = _S3301;

#line 483
            s_diff_totalWarpedPoint_7 = _S3302;

#line 483
            _S3242 = _S3118;

#line 483
            _S3243 = _S3118;

#line 483
            _S3196 = _S3110;

#line 483
            _S3197 = _S3409;

#line 483
            rnd_2[int(0)] = _S3415;

#line 483
            rnd_2[int(1)] = _S3416;

#line 483
            rnd_2[int(2)] = _S3417;

#line 483
            rnd_2[int(3)] = _S3418;

#line 483
            rnd_2[int(4)] = _S3419;

#line 483
            rnd_2[int(5)] = _S3420;

#line 483
            rnd_2[int(6)] = _S3421;

#line 483
            rnd_2[int(7)] = _S3422;

#line 483
            rnd_2[int(8)] = _S3423;

#line 483
            rnd_2[int(9)] = _S3424;

#line 483
            rnd_2[int(10)] = _S3425;

#line 483
            rnd_2[int(11)] = _S3426;

#line 483
            rnd_2[int(12)] = _S3427;

#line 483
            rnd_2[int(13)] = _S3428;

#line 483
            rnd_2[int(14)] = _S3429;

#line 483
            rnd_2[int(15)] = _S3430;

#line 483
        }
        else
        {

#line 483
            totalWeight_9[int(0)] = _S3285[int(0)];

#line 483
            totalWeight_9[int(1)] = _S3286[int(1)];

#line 483
            s_diff_totalWeight_9[int(0)] = _S3287[int(0)];

#line 483
            s_diff_totalWeight_9[int(1)] = _S3288[int(1)];

#line 483
            totalWarpedPoint_9[int(0)] = _S3289[int(0)];

#line 483
            totalWarpedPoint_9[int(1)] = _S3290[int(1)];

#line 483
            s_diff_totalWarpedPoint_9[int(0)] = _S3283[int(0)];

#line 483
            s_diff_totalWarpedPoint_9[int(1)] = _S3284[int(1)];

#line 483
        }

#line 483
        _dc_0 = _dc_0 - int(1);

#line 483
    }

#line 483
    float3  _S3431[int(2)];

#line 483
    _S3431[int(0)] = _S3110;

#line 483
    _S3431[int(1)] = _S3110;

#line 483
    _S3431[int(1)] = _S3191;

#line 483
    _S3431[int(0)] = _S3193;

#line 483
    float3  _S3432[int(2)];

#line 483
    _S3432[int(0)] = _S3110;

#line 483
    _S3432[int(1)] = _S3110;

#line 483
    _S3432[int(1)] = _S3190;

#line 483
    _S3432[int(0)] = _S3192;

#line 483
    float3  _S3433[int(2)] = { _S3431[int(0)], _S3431[int(1)] };

#line 483
    float3  _S3434[int(2)] = { _S3432[int(0)], _S3432[int(1)] };

#line 483
    DiffPair_array_float3_1 _S3435 = { _S3433, _S3434 };

#line 483
    dpdpdirection_11.primal_0 = dpdpdirection_11.primal_0;

#line 483
    dpdpdirection_11.differential_0 = _S3435;

#line 483
    DiffPair_float3_0 _S3436 = { _S3194, _S3195 };

#line 483
    dpdporigin_9.primal_0 = dpdporigin_9.primal_0;

#line 483
    dpdporigin_9.differential_0 = _S3436;

#line 483
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3437 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3240, _S3116), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3116, _S3241) };

#line 483
    dpdpquery_4.primal_0 = dpdpquery_4.primal_0;

#line 483
    dpdpquery_4.differential_0 = _S3437;

#line 483
    return;
}


#line 483
void s_bwd_s_fwd_FalcorSceneIO_loadCameraPositionW_0(inout DiffPair_7 dpdpmode_1, DiffPair_float3_0 _s_dOut_24)
{

#line 483
    s_diff_s_diff_SceneDerivativeFlags_0 _S3438 = SceneDerivativeFlags_dzero_0();

#line 483
    s_diff_s_diff_SceneDerivativeFlags_0 _S3439 = SceneDerivativeFlags_dadd_0(_S3438, _S3438);

#line 483
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S3440 = { _S3439, _S3439 };

#line 483
    dpdpmode_1.primal_0 = dpdpmode_1.primal_0;

#line 483
    dpdpmode_1.differential_0 = _S3440;

#line 483
    return;
}


#line 483
void s_bwd_s_fwd_DifferentiableSceneQuery_loadCameraPosition_0(inout DiffPair_0 dpdpthis_14, DiffPair_float3_0 _s_dOut_25)
{

#line 483
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S3441 = { dpdpthis_14.primal_0.primal_0.gradientFlags_1, dpdpthis_14.primal_0.differential_0.gradientFlags_0 };

#line 483
    DiffPair_float3_0 _S3442 = { _s_dOut_25.primal_0, _s_dOut_25.differential_0 };

#line 483
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S3443 = _S2658();

#line 483
    DiffPair_7 _S3444;

#line 483
    _S3444.primal_0 = _S3441;

#line 483
    _S3444.differential_0 = _S3443;

#line 483
    s_bwd_s_fwd_FalcorSceneIO_loadCameraPositionW_0(_S3444, _S3442);

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3445 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 483
    _S3445.gradientFlags_0 = _S3444.differential_0.primal_0;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3446 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3447 = _S3446;

#line 483
    _S3447.gradientFlags_0 = _S3444.differential_0.differential_0;

#line 483
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3448 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3445, _S3446), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3446, _S3447) };

#line 483
    dpdpthis_14.primal_0 = dpdpthis_14.primal_0;

#line 483
    dpdpthis_14.differential_0 = _S3448;

#line 483
    return;
}


#line 483
void s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(inout DiffPair_0 dpdpthis_15, inout DiffPair_1 dpdpposS_2, inout DiffPair_1 dpdpframeDim_1, DiffPair_float3_0 _s_dOut_26)
{

#line 483
    float2 _S3449 = dpdpposS_2.primal_0.primal_0 + float2(0.5, 0.5);

#line 483
    float2 _S3450 = dpdpposS_2.primal_0.differential_0 * dpdpframeDim_1.primal_0.primal_0 - _S3449 * dpdpframeDim_1.primal_0.differential_0;

#line 483
    float2 _S3451 = dpdpframeDim_1.primal_0.primal_0 * dpdpframeDim_1.primal_0.primal_0;

#line 483
    float2 _S3452 = float2(2.0, -2.0);

#line 483
    float2 _S3453 = _S3450 / _S3451 * _S3452;

#line 483
    float2 ndc_3 = _S3452 * (_S3449 / dpdpframeDim_1.primal_0.primal_0) + float2(-1.0, 1.0);

#line 483
    Scene_0 _S3454 = gScene_0;

#line 483
    DiffPair_float3_0 _S3455 = { ndc_3.x * gScene_0.camera_0.data_1.cameraU_0 + ndc_3.y * gScene_0.camera_0.data_1.cameraV_0 + gScene_0.camera_0.data_1.cameraW_0, _S3453.x * gScene_0.camera_0.data_1.cameraU_0 + _S3453.y * gScene_0.camera_0.data_1.cameraV_0 };

#line 483
    float2 _S3456 = _S3451 * _S3451;

#line 1182
    float3 _S3457 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S3458 = { _s_dOut_26.primal_0, _s_dOut_26.differential_0 };

#line 1182
    DiffPair_float3_0 _S3459 = { _S3457, _S3457 };

#line 1182
    DiffPair_3 _S3460;

#line 1182
    _S3460.primal_0 = _S3455;

#line 1182
    _S3460.differential_0 = _S3459;

#line 1182
    s_bwd_s_fwd_safeNormalize_0(_S3460, _S3458);

#line 1182
    float3 _S3461 = _S3454.camera_0.data_1.cameraV_0 * _S3460.differential_0.differential_0;

#line 1182
    float3 _S3462 = _S3454.camera_0.data_1.cameraV_0 * _S3460.differential_0.primal_0;

#line 1182
    float3 _S3463 = _S3454.camera_0.data_1.cameraU_0 * _S3460.differential_0.differential_0;

#line 1182
    float3 _S3464 = _S3454.camera_0.data_1.cameraU_0 * _S3460.differential_0.primal_0;

#line 1182
    float2 _S3465 = _S3452 * (float2(0.0, _S3461[int(0)] + _S3461[int(1)] + _S3461[int(2)]) + float2(_S3463[int(0)] + _S3463[int(1)] + _S3463[int(2)], 0.0)) / _S3456;

#line 1182
    float2 _S3466 = _S3451 * _S3465;

#line 1182
    float2 _S3467 = dpdpframeDim_1.primal_0.primal_0 * (_S3450 * - _S3465);

#line 1182
    float2 _S3468 = - _S3466;

#line 1182
    float2 _S3469 = dpdpframeDim_1.primal_0.primal_0 * _S3466;

#line 1182
    float2 _S3470 = _S3452 * (float2(0.0, _S3462[int(0)] + _S3462[int(1)] + _S3462[int(2)]) + float2(_S3464[int(0)] + _S3464[int(1)] + _S3464[int(2)], 0.0)) / _S3451;

#line 1189
    float2 _S3471 = dpdpframeDim_1.primal_0.differential_0 * _S3468 + dpdpframeDim_1.primal_0.primal_0 * _S3470;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3472 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3473 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 1189
    DiffPair_float2_0 _S3474 = { _S3467 + _S3467 + dpdpposS_2.primal_0.differential_0 * _S3466 + _S3449 * - _S3470, _S3449 * _S3468 };

#line 1189
    dpdpframeDim_1.primal_0 = dpdpframeDim_1.primal_0;

#line 1189
    dpdpframeDim_1.differential_0 = _S3474;

#line 1189
    DiffPair_float2_0 _S3475 = { _S3471, _S3469 };

#line 1189
    dpdpposS_2.primal_0 = dpdpposS_2.primal_0;

#line 1189
    dpdpposS_2.differential_0 = _S3475;

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3476 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3472, _S3473), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3473, _S3473) };

#line 1189
    dpdpthis_15.primal_0 = dpdpthis_15.primal_0;

#line 1189
    dpdpthis_15.differential_0 = _S3476;

#line 1189
    return;
}


#line 1189
void s_bwd_s_fwd_computeWarpedPrimalSample_0(inout DiffPair_0 dpdpquery_5, float kappa_6, inout DiffPair_1 dpdpbasePosS_1, inout DiffPair_2 dpdpposS_3, DiffPair_array_float2_0 dpdpwarpedPosS_1, uint2 frameDim_5, uint2 globalPixel_9, UniformSampleGenerator_0 sg_30, s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _s_diff_ctx_23)
{

#line 604 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    DiffPair_0 _S3477 = dpdpquery_5;

#line 604
    float2 _S3478 = (float2)0.0;

#line 604
    DiffPair_DifferentiableSceneQuery_0 _S3479 = { dpdpquery_5.primal_0.primal_0, dpdpquery_5.primal_0.differential_0 };

#line 604
    DiffPair_float2_0 _S3480 = { dpdpbasePosS_1.primal_0.primal_0, dpdpbasePosS_1.primal_0.differential_0 };

#line 604
    DiffPair_float2_0 _S3481 = { float2(frameDim_5), _S3478 };

#line 604
    DiffPair_float2_0 _S3482 = { dpdpposS_3.primal_0.primal_0[int(0)], dpdpposS_3.primal_0.differential_0[int(0)] };

#line 604
    DiffPair_float2_0 _S3483 = { dpdpposS_3.primal_0.primal_0[int(1)], dpdpposS_3.primal_0.differential_0[int(1)] };

#line 604
    float3 _S3484 = (float3)0.0;

#line 604
    DiffPair_float3_0 _S3485 = { _S3484, _S3484 };

#line 604
    s_diff_s_diff_SceneDerivativeFlags_0 _S3486 = { int(0) };

#line 604
    DifferentiableSceneQuery_0 _S3487 = { _S3486 };

#line 604
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3488 = { _S3486 };

#line 604
    DiffPair_float3_0 _S3489 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3479, _S3480, _S3481);

#line 604
    DiffPair_float3_0 _S3490 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3479, _S3482, _S3481);

#line 604
    DiffPair_float3_0 _S3491 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3479, _S3483, _S3481);

#line 604
    float3  rayDir_1[int(2)] = { _S3490.primal_0, _S3491.primal_0 };

#line 604
    float3  s_diff_rayDir_1[int(2)] = { _S3490.differential_0, _S3491.differential_0 };

#line 604
    DiffPair_float3_0 _S3492 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_loadCameraPosition_0(_S3479);

#line 604
    DiffPair_float3_0 _S3493 = { _S3492.primal_0, _S3492.differential_0 };

#line 604
    DiffPair_array_float3_1 _S3494 = { rayDir_1, s_diff_rayDir_1 };

#line 604
    DiffPair_DifferentiableSceneQuery_0 _S3495;

#line 604
    DiffPair_float3_0 _S3496;

#line 604
    DiffPair_float3_0 _S3497;

#line 604
    DiffPair_float3_0 _S3498;

#line 604
    DiffPair_float3_0 _S3499;

#line 604
    if(_s_diff_ctx_23._S1122)
    {

#line 604
        float3 _S3500 = _s_diff_ctx_23._S1120.primal_0[int(0)] - _S3492.primal_0;

#line 604
        float3 _S3501 = _s_diff_ctx_23._S1120.differential_0[int(0)] - _S3492.differential_0;

#line 604
        DiffPair_float3_0 _S3502 = { _S3500, _S3501 };

#line 604
        DiffPair_float3_0 _S3503 = s_bwd_primal_s_fwd_normalize_impl_0(_S3502);

#line 604
        float3 _S3504 = _s_diff_ctx_23._S1120.primal_0[int(1)] - _S3492.primal_0;

#line 604
        float3 _S3505 = _s_diff_ctx_23._S1120.differential_0[int(1)] - _S3492.differential_0;

#line 604
        DiffPair_float3_0 _S3506 = { _S3504, _S3505 };

#line 604
        DiffPair_float3_0 _S3507 = s_bwd_primal_s_fwd_normalize_impl_0(_S3506);

#line 604
        _S3495.primal_0 = _S3477.primal_0.primal_0;

#line 604
        _S3495.differential_0 = _S3477.primal_0.differential_0;

#line 604
        _S3496.primal_0 = _S3507.primal_0;

#line 604
        _S3496.differential_0 = _S3507.differential_0;

#line 604
        _S3497.primal_0 = _S3504;

#line 604
        _S3497.differential_0 = _S3505;

#line 604
        _S3498.primal_0 = _S3503.primal_0;

#line 604
        _S3498.differential_0 = _S3503.differential_0;

#line 604
        _S3499.primal_0 = _S3500;

#line 604
        _S3499.differential_0 = _S3501;

#line 604
    }
    else
    {

#line 604
        _S3495.primal_0 = _S3487;

#line 604
        _S3495.differential_0 = _S3488;

#line 604
        _S3496.primal_0 = _S3484;

#line 604
        _S3496.differential_0 = _S3484;

#line 604
        _S3497.primal_0 = _S3484;

#line 604
        _S3497.differential_0 = _S3484;

#line 604
        _S3498.primal_0 = _S3484;

#line 604
        _S3498.differential_0 = _S3484;

#line 604
        _S3499.primal_0 = _S3484;

#line 604
        _S3499.differential_0 = _S3484;

#line 604
    }

#line 604
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3508 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 604
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3509 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 604
    float3  _S3510[int(2)];

#line 604
    float3  _S3511[int(2)];

#line 604
    float3 _S3512;

#line 604
    float3 _S3513;

#line 604
    float2 _S3514;

#line 604
    float2 _S3515;

#line 604
    float2 _S3516;

#line 604
    float2 _S3517;

#line 604
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3518;

#line 604
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3519;

#line 604
    if(_s_diff_ctx_23._S1122)
    {

#line 604
        DiffPair_float2_0 _S3520 = { dpdpwarpedPosS_1.primal_0[int(1)], dpdpwarpedPosS_1.differential_0[int(1)] };

#line 604
        DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3521 = { _S3509, _S3508 };

#line 604
        DiffPair_0 _S3522;

#line 604
        _S3522.primal_0 = _S3495;

#line 604
        _S3522.differential_0 = _S3521;

#line 604
        DiffPair_float3_0 _S3523 = _S2416();

#line 604
        DiffPair_3 _S3524;

#line 604
        _S3524.primal_0 = _S3496;

#line 604
        _S3524.differential_0 = _S3523;

#line 604
        s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(_S3522, _S3524, frameDim_5, _S3520);

#line 604
        DiffPair_float3_0 _S3525 = { _S3524.differential_0.primal_0, _S3524.differential_0.differential_0 };

#line 604
        DiffPair_3 _S3526;

#line 604
        _S3526.primal_0 = _S3497;

#line 604
        _S3526.differential_0 = _S3523;

#line 604
        s_bwd_s_fwd_normalize_impl_0(_S3526, _S3525);

#line 604
        float3 _S3527 = - _S3526.differential_0.differential_0;

#line 604
        float3 _S3528 = - _S3526.differential_0.primal_0;

#line 604
        DiffPair_float2_0 _S3529 = { dpdpwarpedPosS_1.primal_0[int(0)], dpdpwarpedPosS_1.differential_0[int(0)] };

#line 604
        DiffPair_0 _S3530;

#line 604
        _S3530.primal_0 = _S3479;

#line 604
        _S3530.differential_0 = _S3521;

#line 604
        DiffPair_3 _S3531;

#line 604
        _S3531.primal_0 = _S3498;

#line 604
        _S3531.differential_0 = _S3523;

#line 604
        s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayScreenPos_0(_S3530, _S3531, frameDim_5, _S3529);

#line 604
        DiffPair_float3_0 _S3532 = { _S3531.differential_0.primal_0, _S3531.differential_0.differential_0 };

#line 604
        DiffPair_3 _S3533;

#line 604
        _S3533.primal_0 = _S3499;

#line 604
        _S3533.differential_0 = _S3523;

#line 604
        s_bwd_s_fwd_normalize_impl_0(_S3533, _S3532);

#line 604
        float3 _S3534 = - _S3533.differential_0.differential_0;

#line 604
        float3 _S3535 = - _S3533.differential_0.primal_0;

#line 604
        float3  _S3536[int(2)];

#line 604
        _S3536[int(0)] = _S3484;

#line 604
        _S3536[int(1)] = _S3484;

#line 604
        _S3536[int(1)] = _S3526.differential_0.primal_0;

#line 604
        _S3536[int(0)] = _S3533.differential_0.primal_0;

#line 604
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3537 = DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(_S3522.differential_0.primal_0, _S3530.differential_0.primal_0), _S3509);

#line 1189 "core.meta.slang"
        float3 _S3538 = _S3527 + _S3534;

#line 1189
        float3  _S3539[int(2)];

#line 1189
        _S3539[int(0)] = _S3484;

#line 1189
        _S3539[int(1)] = _S3484;

#line 1189
        _S3539[int(1)] = _S3526.differential_0.differential_0;

#line 1189
        _S3539[int(0)] = _S3533.differential_0.differential_0;

#line 1189
        s_diff_s_diff_DifferentiableSceneQuery_0 _S3540 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3522.differential_0.differential_0, _S3530.differential_0.differential_0), _S3508);

#line 1189
        float3 _S3541 = _S3528 + _S3535;

#line 1189
        _S3510[int(0)] = _S3539[int(0)];

#line 1189
        _S3510[int(1)] = _S3539[int(1)];

#line 1189
        _S3511[int(0)] = _S3536[int(0)];

#line 1189
        _S3511[int(1)] = _S3536[int(1)];

#line 1189
        _S3512 = _S3538;

#line 1189
        _S3513 = _S3541;

#line 1189
        _S3514 = _S3478;

#line 1189
        _S3515 = _S3478;

#line 1189
        _S3516 = _S3478;

#line 1189
        _S3517 = _S3478;

#line 1189
        _S3518 = _S3537;

#line 1189
        _S3519 = _S3540;

#line 1189
    }
    else
    {

#line 1189
        _S3510[int(0)] = _S3484;

#line 1189
        _S3510[int(1)] = _S3484;

#line 1189
        _S3511[int(0)] = _S3484;

#line 1189
        _S3511[int(1)] = _S3484;

#line 1189
        _S3512 = _S3484;

#line 1189
        _S3513 = _S3484;

#line 1189
        _S3514 = dpdpwarpedPosS_1.differential_0[int(1)];

#line 1189
        _S3515 = dpdpwarpedPosS_1.primal_0[int(1)];

#line 1189
        _S3516 = dpdpwarpedPosS_1.differential_0[int(0)];

#line 1189
        _S3517 = dpdpwarpedPosS_1.primal_0[int(0)];

#line 1189
        _S3518 = _S3509;

#line 1189
        _S3519 = _S3508;

#line 1189
    }

#line 1189
    float3  _S3542[int(2)] = { _S3511[int(0)], _S3511[int(1)] };

#line 1189
    float3  _S3543[int(2)] = { _S3510[int(0)], _S3510[int(1)] };

#line 1189
    DiffPair_array_float3_1 _S3544 = { _S3542, _S3543 };

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3545 = { _S3509, _S3508 };

#line 1189
    DiffPair_0 _S3546;

#line 1189
    _S3546.primal_0 = _S3479;

#line 1189
    _S3546.differential_0 = _S3545;

#line 1189
    DiffPair_float3_0 _S3547 = _S2416();

#line 1189
    DiffPair_3 _S3548;

#line 1189
    _S3548.primal_0 = _S3493;

#line 1189
    _S3548.differential_0 = _S3547;

#line 1189
    DiffPair_array_float3_1 _S3549 = _S2602();

#line 1189
    DiffPair_5 _S3550;

#line 1189
    _S3550.primal_0 = _S3494;

#line 1189
    _S3550.differential_0 = _S3549;

#line 1189
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_0(_S3546, kappa_6, globalPixel_9, _S3489.primal_0, _S3548, _S3550, _S3544, _s_diff_ctx_23._S1121, _s_diff_ctx_23._S1119);

#line 1189
    DiffPair_float3_0 _S3551 = { _S3548.differential_0.primal_0 + _S3513, _S3548.differential_0.differential_0 + _S3512 };

#line 1189
    DiffPair_0 _S3552;

#line 1189
    _S3552.primal_0 = _S3479;

#line 1189
    _S3552.differential_0 = _S3545;

#line 1189
    s_bwd_s_fwd_DifferentiableSceneQuery_loadCameraPosition_0(_S3552, _S3551);

#line 1189
    DiffPair_float3_0 _S3553 = { _S3550.differential_0.primal_0[int(1)], _S3550.differential_0.differential_0[int(1)] };

#line 1189
    DiffPair_0 _S3554;

#line 1189
    _S3554.primal_0 = _S3479;

#line 1189
    _S3554.differential_0 = _S3545;

#line 1189
    DiffPair_float2_0 _S3555 = { _S3478, _S3478 };

#line 1189
    DiffPair_1 _S3556;

#line 1189
    _S3556.primal_0 = _S3483;

#line 1189
    _S3556.differential_0 = _S3555;

#line 1189
    DiffPair_1 _S3557;

#line 1189
    _S3557.primal_0 = _S3481;

#line 1189
    _S3557.differential_0 = _S3555;

#line 1189
    s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3554, _S3556, _S3557, _S3553);

#line 1189
    float2 _S3558 = _S3556.differential_0.differential_0 + _S3514;

#line 1189
    float2 _S3559 = _S3556.differential_0.primal_0 + _S3515;

#line 1189
    DiffPair_float3_0 _S3560 = { _S3550.differential_0.primal_0[int(0)], _S3550.differential_0.differential_0[int(0)] };

#line 1189
    DiffPair_0 _S3561;

#line 1189
    _S3561.primal_0 = _S3479;

#line 1189
    _S3561.differential_0 = _S3545;

#line 1189
    DiffPair_1 _S3562;

#line 1189
    _S3562.primal_0 = _S3482;

#line 1189
    _S3562.differential_0 = _S3555;

#line 1189
    DiffPair_1 _S3563;

#line 1189
    _S3563.primal_0 = _S3481;

#line 1189
    _S3563.differential_0 = _S3555;

#line 1189
    s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3561, _S3562, _S3563, _S3560);

#line 1189
    float2 _S3564 = _S3562.differential_0.differential_0 + _S3516;

#line 1189
    float2 _S3565 = _S3562.differential_0.primal_0 + _S3517;

#line 1189
    DiffPair_0 _S3566;

#line 1189
    _S3566.primal_0 = _S3479;

#line 1189
    _S3566.differential_0 = _S3545;

#line 1189
    DiffPair_1 _S3567;

#line 1189
    _S3567.primal_0 = _S3480;

#line 1189
    _S3567.differential_0 = _S3555;

#line 1189
    DiffPair_1 _S3568;

#line 1189
    _S3568.primal_0 = _S3481;

#line 1189
    _S3568.differential_0 = _S3555;

#line 1189
    s_bwd_s_fwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S3566, _S3567, _S3568, _S3485);

#line 1189
    float2  _S3569[int(2)];

#line 1189
    _S3569[int(0)] = _S3478;

#line 1189
    _S3569[int(1)] = _S3478;

#line 1189
    _S3569[int(1)] = _S3559;

#line 1189
    _S3569[int(0)] = _S3565;

#line 1189
    float2  _S3570[int(2)];

#line 1189
    _S3570[int(0)] = _S3478;

#line 1189
    _S3570[int(1)] = _S3478;

#line 1189
    _S3570[int(1)] = _S3558;

#line 1189
    _S3570[int(0)] = _S3564;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3571 = DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(_S3546.differential_0.primal_0, _S3552.differential_0.primal_0), _S3554.differential_0.primal_0), _S3561.differential_0.primal_0), _S3566.differential_0.primal_0), _S3518);

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3572 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(DifferentiableSceneQuery_Differential_x24_syn_dadd_0(DifferentiableSceneQuery_Differential_x24_syn_dadd_0(DifferentiableSceneQuery_Differential_x24_syn_dadd_0(DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3546.differential_0.differential_0, _S3552.differential_0.differential_0), _S3554.differential_0.differential_0), _S3561.differential_0.differential_0), _S3566.differential_0.differential_0), _S3519);

#line 1189
    float2  _S3573[int(2)] = { _S3569[int(0)], _S3569[int(1)] };

#line 1189
    float2  _S3574[int(2)] = { _S3570[int(0)], _S3570[int(1)] };

#line 1189
    DiffPair_array_float2_0 _S3575 = { _S3573, _S3574 };

#line 1189
    dpdpposS_3.primal_0 = dpdpposS_3.primal_0;

#line 1189
    dpdpposS_3.differential_0 = _S3575;

#line 1189
    DiffPair_float2_0 _S3576 = { _S3567.differential_0.primal_0, _S3567.differential_0.differential_0 };

#line 1189
    dpdpbasePosS_1.primal_0 = dpdpbasePosS_1.primal_0;

#line 1189
    dpdpbasePosS_1.differential_0 = _S3576;

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3577 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3571, _S3508), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3508, _S3572) };

#line 1189
    dpdpquery_5.primal_0 = dpdpquery_5.primal_0;

#line 1189
    dpdpquery_5.differential_0 = _S3577;

#line 1189
    return;
}


#line 1189
void s_bwd_reparameterizeScreenSample_0(inout DiffPair_DifferentiableSceneQuery_0 dpquery_2, inout DiffPair_float2_0 dpposS_3, uint2 gFrameDim_1, uint2 globalPixel_10, UniformSampleGenerator_0 sg_31, float dpweight_2, float2 s_diff_warpedPos_T_0, s_bwd_reparameterizeScreenSample_Intermediates_0 _s_diff_ctx_24)
{

#line 658 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    float2 _S3578 = dpposS_3.primal_0;

#line 658
    float2  _S3579[int(2)] = { _S3578, _S3578 };

#line 658
    float2  _S3580[int(2)] = { float2(1.0, 0.0), float2(0.0, 1.0) };

#line 658
    DiffPair_array_float2_0 _S3581 = { _S3579, _S3580 };

#line 658
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3582 = { _s_diff_ctx_24._S1126 };

#line 658
    DiffPair_DifferentiableSceneQuery_0 _S3583 = { dpquery_2.primal_0, _S3582 };

#line 658
    float _S3584 = ReparamCB_0.gVMFConcentrationScreen_0;

#line 658
    DiffPair_float2_0 _S3585 = { dpposS_3.primal_0, (float2)0.0 };

#line 658
    float2 _S3586 = (float2)0.0;

#line 658
    matrix<float,int(2),int(2)>  _S3587 = matrix<float,int(2),int(2)> (0.0, 0.0, 0.0, 0.0);

#line 658
    matrix<float,int(2),int(2)>  _S3588 = _S3587;

#line 658
    _S3588[int(0)][int(0)] = 1.0;

#line 658
    _S3588[int(1)][int(1)] = 1.0;

#line 658
    float2  _S3589[int(2)] = { _S3586, _S3586 };

#line 658
    DiffPair_array_float2_0 _S3590 = { _S3589, _S3589 };

#line 658
    DiffPair_float2x2_0 _S3591;

#line 658
    _S3591.primal_0 = _S3588;

#line 658
    _S3591.differential_0 = _S3587;

#line 658
    s_bwd_determinant_2(_S3591, dpweight_2);

#line 658
    float2  _S3592[int(2)];

#line 658
    _S3592[int(0)] = _S3586;

#line 658
    _S3592[int(1)] = _S3586;

#line 658
    _S3592[int(1)] = _S3591.differential_0[int(1)];

#line 658
    float2  _S3593[int(2)];

#line 658
    _S3593[int(0)] = _S3586;

#line 658
    _S3593[int(1)] = _S3586;

#line 658
    _S3593[int(0)] = _S3591.differential_0[int(0)];

#line 658
    float2  _S3594[int(2)];

#line 658
    _S3594[int(0)] = _S3586;

#line 658
    _S3594[int(1)] = _S3586;

#line 658
    _S3594[int(0)] = s_diff_warpedPos_T_0;

#line 658
    float2  _S3595[int(2)] = { _S3592[int(0)] + _S3593[int(0)], _S3592[int(1)] + _S3593[int(1)] };

#line 658
    float2  _S3596[int(2)] = { _S3594[int(0)], _S3594[int(1)] };

#line 658
    DiffPair_array_float2_0 _S3597 = { _S3596, _S3595 };

#line 658
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3598 = { DifferentiableSceneQuery_x24_syn_dzero_0(), DifferentiableSceneQuery_Differential_x24_syn_dzero_0() };

#line 658
    DiffPair_0 _S3599;

#line 658
    _S3599.primal_0 = _S3583;

#line 658
    _S3599.differential_0 = _S3598;

#line 658
    DiffPair_float2_0 _S3600 = { _S3586, _S3586 };

#line 658
    DiffPair_1 _S3601;

#line 658
    _S3601.primal_0 = _S3585;

#line 658
    _S3601.differential_0 = _S3600;

#line 658
    DiffPair_2 _S3602;

#line 658
    _S3602.primal_0 = _S3581;

#line 658
    _S3602.differential_0 = _S3590;

#line 658
    s_bwd_s_fwd_computeWarpedPrimalSample_0(_S3599, _S3584, _S3601, _S3602, _S3597, gFrameDim_1, globalPixel_10, _s_diff_ctx_24._S1125, _s_diff_ctx_24._S1123);

#line 1189 "core.meta.slang"
    float2 _S3603 = s_diff_warpedPos_T_0 + _S3601.differential_0.primal_0 + _S3602.differential_0.primal_0[int(0)] + _S3602.differential_0.primal_0[int(1)];

#line 1189
    dpposS_3.primal_0 = dpposS_3.primal_0;

#line 1189
    dpposS_3.differential_0 = _S3603;

#line 1189
    dpquery_2.primal_0 = dpquery_2.primal_0;

#line 1189
    dpquery_2.differential_0 = _S3599.differential_0.primal_0;

#line 1189
    return;
}


#line 1189
struct DiffPair_PathData_0
{
    PathData_0 primal_0;
    s_diff_PathData_0 differential_0;
};


#line 1189
struct DiffPair_ShadingData_0
{
    ShadingData_0 primal_0;
    s_diff_ShadingData_0 differential_0;
};


#line 1189
void s_bwd_temporaryBsdfEval_0(Tuple_0 mi_4, inout DiffPair_ShadingData_0 dpsd_3, inout DiffPair_float3_0 dpwo_1, inout DiffPair_float3_0 dpn_1, float3 _s_dOut_27, s_bwd_temporaryBsdfEval_Intermediates_0 _s_diff_ctx_25)
{

#line 214 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float _S3604 = s_bwd_dot_0(dpwo_1.primal_0, dpn_1.primal_0);

#line 214
    float3 _S3605 = _s_diff_ctx_25._S1046.diffuseReflectionAlbedo_0 * ((float3)0.31830987334251403809 * _s_dOut_27);

#line 483 "core.meta.slang"
    float _S3606 = _S3605[int(0)] + _S3605[int(1)] + _S3605[int(2)];

#line 483
    DiffPair_float_0 _S3607;

#line 483
    _S3607.primal_0 = 0.0;

#line 483
    _S3607.differential_0 = 0.0;

#line 483
    DiffPair_float_0 _S3608;

#line 483
    _S3608.primal_0 = _S3604;

#line 483
    _S3608.differential_0 = 0.0;

#line 483
    s_bwd_max_1(_S3607, _S3608, _S3606);

#line 1182
    float3 _S3609 = (float3)0.0;

#line 1182
    DiffPair_float3_0 _S3610;

#line 1182
    _S3610.primal_0 = dpwo_1.primal_0;

#line 1182
    _S3610.differential_0 = _S3609;

#line 1182
    DiffPair_float3_0 _S3611;

#line 1182
    _S3611.primal_0 = dpn_1.primal_0;

#line 1182
    _S3611.differential_0 = _S3609;

#line 1182
    s_bwd_dot_2(_S3610, _S3611, _S3608.differential_0);

#line 1182
    dpn_1.primal_0 = dpn_1.primal_0;

#line 1182
    dpn_1.differential_0 = _S3611.differential_0;

#line 1182
    dpwo_1.primal_0 = dpwo_1.primal_0;

#line 1182
    dpwo_1.differential_0 = _S3610.differential_0;

#line 1182
    s_diff_ShadingData_0 _S3612 = ShadingData_x24_syn_dzero_0();

#line 1182
    dpsd_3.primal_0 = dpsd_3.primal_0;

#line 1182
    dpsd_3.differential_0 = _S3612;

#line 1182
    return;
}


#line 1182
struct DiffPair_8
{
    DiffPair_array_float3_0 primal_0;
    DiffPair_array_float3_0 differential_0;
};


#line 1182
void s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_1(inout DiffPair_0 dpdpquery_6, float kappa_7, uint2 globalPixel_11, float3 baseDirection_3, inout DiffPair_3 dpdporigin_10, inout DiffPair_8 dpdpdirection_12, DiffPair_array_float3_0 dpdpwarpedPoint_3, UniformSampleGenerator_0 sg_32, s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _s_diff_ctx_26)
{

#line 382 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    HitInfo_0 _S3613 = { (uint4)0U };

#line 382
    s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S3614;

#line 382
    _S3614._S1199 = _S3613;

#line 382
    _S3614.isHit_0 = false;

#line 382
    float3 _S3615 = (float3)0.0;

#line 382
    DiffPair_0 _S3616 = dpdpquery_6;

#line 382
    DiffPair_3 _S3617 = dpdporigin_10;

#line 382
    DiffPair_8 _S3618 = dpdpdirection_12;

#line 382
    float3 _S3619 = float3(0.0, 0.0, 0.0);

#line 382
    bool _S3620 = !(_s_diff_ctx_26._S1060[int(0)] == 0.0);

#line 382
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3621 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 382
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3622 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 382
    s_diff_s_diff_IntersectionInfo_0 _S3623 = IntersectionInfo_x24_syn_dzero_0();

#line 382
    int _S3624 = _s_diff_ctx_26._S1055 - int(1);

#line 382
    GeometryInstanceID_0 _S3625 = { 0U };

#line 382
    IntersectionInfo_0 _S3626 = { 0U, _S3625, _S3615, _S3615, _S3615, 0.0 };

#line 382
    s_diff_s_diff_DiffRay_0 _S3627 = DiffRay_x24_syn_dzero_0();

#line 1182 "core.meta.slang"
    float2 _S3628 = (float2)0.0;

#line 1182
    DiffPair_float3_0 _S3629 = { dpdporigin_10.primal_0.primal_0, dpdporigin_10.primal_0.differential_0 };

#line 1182
    DiffPair_DifferentiableSceneQuery_0 _S3630 = { dpdpquery_6.primal_0.primal_0, dpdpquery_6.primal_0.differential_0 };

#line 1182
    s_diff_s_diff_IntersectionInfo_0 _S3631 = { _S3615, _S3615, _S3615, 0.0 };

#line 1182
    DiffPair_float3_0 _S3632 = { dpdpdirection_12.primal_0.primal_0[int(0)], dpdpdirection_12.primal_0.differential_0[int(0)] };

#line 1182
    DiffPair_float3_0 _S3633 = { dpdpdirection_12.primal_0.primal_0[int(1)], dpdpdirection_12.primal_0.differential_0[int(1)] };

#line 1182
    DiffPair_float3_0 _S3634 = { dpdpdirection_12.primal_0.primal_0[int(2)], dpdpdirection_12.primal_0.differential_0[int(2)] };

#line 1182
    DiffPair_float_0 _S3635 = { 0.0, 0.0 };

#line 1182
    DiffPair_float3_0 _S3636 = { _S3615, _S3615 };

#line 1182
    DiffRay_0 _S3637 = { _S3615, _S3615, (uint2)0U };

#line 1182
    s_diff_s_diff_DiffRay_0 _S3638 = { _S3615, _S3615 };

#line 1182
    s_diff_s_diff_SceneDerivativeFlags_0 _S3639 = { int(0) };

#line 1182
    DifferentiableSceneQuery_0 _S3640 = { _S3639 };

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3641 = { _S3639 };

#line 1182
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S3642 = { _S3621, _S3622 };

#line 1182
    DiffPair_s_diff_s_diff_DiffRay_0 _S3643 = _S2605();

#line 1182
    DiffPair_float_0 _S3644 = { _s_diff_ctx_26._S1060[int(0)], _s_diff_ctx_26._S1059[int(0)] };

#line 1182
    DiffPair_float_0 _S3645 = { 0.00000000999999993923, 0.0 };

#line 1182
    DiffPair_float_0 _S3646 = { _s_diff_ctx_26._S1060[int(1)], _s_diff_ctx_26._S1059[int(1)] };

#line 1182
    DiffPair_float_0 _S3647 = { _s_diff_ctx_26._S1060[int(2)], _s_diff_ctx_26._S1059[int(2)] };

#line 1182
    DiffPair_float_0 _S3648 = s_bwd_primal_d_max_0(_S3644, _S3645);

#line 1182
    float3 _S3649 = (float3)_S3648.primal_0;

#line 1182
    float3 _S3650 = (float3)_S3648.differential_0;

#line 1182
    float3 _S3651 = _S3649 * _S3649;

#line 1182
    float3 _S3652 = _s_diff_ctx_26._S1057[int(0)] * _S3649 - _s_diff_ctx_26._S1058[int(0)] * _S3650;

#line 1182
    float3 _S3653 = _S3651 * _S3651;

#line 1182
    DiffPair_float_0 _S3654 = s_bwd_primal_d_max_0(_S3646, _S3645);

#line 1182
    float3 _S3655 = (float3)_S3654.primal_0;

#line 1182
    float3 _S3656 = (float3)_S3654.differential_0;

#line 1182
    float3 _S3657 = _S3655 * _S3655;

#line 1182
    float3 _S3658 = _s_diff_ctx_26._S1057[int(1)] * _S3655 - _s_diff_ctx_26._S1058[int(1)] * _S3656;

#line 1182
    float3 _S3659 = _S3657 * _S3657;

#line 1182
    DiffPair_float_0 _S3660 = s_bwd_primal_d_max_0(_S3647, _S3645);

#line 1182
    float3 _S3661 = (float3)_S3660.primal_0;

#line 1182
    float3 _S3662 = (float3)_S3660.differential_0;

#line 1182
    float3 _S3663 = _S3661 * _S3661;

#line 1182
    float3 _S3664 = _s_diff_ctx_26._S1057[int(2)] * _S3661 - _s_diff_ctx_26._S1058[int(2)] * _S3662;

#line 1182
    float3 _S3665 = _S3663 * _S3663;

#line 1182
    float3 _S3666 = dpdpwarpedPoint_3.primal_0[int(2)] / _S3663;

#line 1182
    float3 _S3667 = dpdpwarpedPoint_3.primal_0[int(1)] / _S3657;

#line 1182
    float3 _S3668 = dpdpwarpedPoint_3.primal_0[int(0)] / _S3651;

#line 1182
    int _dc_1;

#line 1182
    bool _bflag_8 = true;

#line 1182
    int i_6 = int(0);

#line 1182
    UniformSampleGenerator_0 _S3669 = sg_32;

#line 1182
    float  rnd_3[int(16)];

#line 1182
    rnd_3[int(0)] = 0.0;

#line 1182
    rnd_3[int(1)] = 0.0;

#line 1182
    rnd_3[int(2)] = 0.0;

#line 1182
    rnd_3[int(3)] = 0.0;

#line 1182
    rnd_3[int(4)] = 0.0;

#line 1182
    rnd_3[int(5)] = 0.0;

#line 1182
    rnd_3[int(6)] = 0.0;

#line 1182
    rnd_3[int(7)] = 0.0;

#line 1182
    rnd_3[int(8)] = 0.0;

#line 1182
    rnd_3[int(9)] = 0.0;

#line 1182
    rnd_3[int(10)] = 0.0;

#line 1182
    rnd_3[int(11)] = 0.0;

#line 1182
    rnd_3[int(12)] = 0.0;

#line 1182
    rnd_3[int(13)] = 0.0;

#line 1182
    rnd_3[int(14)] = 0.0;

#line 1182
    rnd_3[int(15)] = 0.0;

#line 1182
    float  s_diff_rnd_3[int(16)];

#line 1182
    s_diff_rnd_3[int(0)] = 0.0;

#line 1182
    s_diff_rnd_3[int(1)] = 0.0;

#line 1182
    s_diff_rnd_3[int(2)] = 0.0;

#line 1182
    s_diff_rnd_3[int(3)] = 0.0;

#line 1182
    s_diff_rnd_3[int(4)] = 0.0;

#line 1182
    s_diff_rnd_3[int(5)] = 0.0;

#line 1182
    s_diff_rnd_3[int(6)] = 0.0;

#line 1182
    s_diff_rnd_3[int(7)] = 0.0;

#line 1182
    s_diff_rnd_3[int(8)] = 0.0;

#line 1182
    s_diff_rnd_3[int(9)] = 0.0;

#line 1182
    s_diff_rnd_3[int(10)] = 0.0;

#line 1182
    s_diff_rnd_3[int(11)] = 0.0;

#line 1182
    s_diff_rnd_3[int(12)] = 0.0;

#line 1182
    s_diff_rnd_3[int(13)] = 0.0;

#line 1182
    s_diff_rnd_3[int(14)] = 0.0;

#line 1182
    s_diff_rnd_3[int(15)] = 0.0;

#line 1182
    int _pc_4 = int(0);

#line 1182
    for(;;)
    {

#line 1182
        if(_bflag_8)
        {
        }
        else
        {

#line 1182
            break;
        }

#line 1182
        bool _S3670 = i_6 < int(16);

#line 1182
        int _S3671;

#line 1182
        if(_S3670)
        {

#line 1182
            _S3671 = _dc_1;

#line 1182
        }
        else
        {

#line 1182
            _S3671 = int(1);

#line 1182
        }

#line 1182
        UniformSampleGenerator_0 _S3672;

#line 1182
        if(_S3670)
        {

#line 1182
            UniformSampleGenerator_0 _S3673 = _S3669;

#line 1182
            float _S3674 = sampleNext1D_0(_S3673);

#line 1182
            _S3672 = _S3673;

#line 1182
            float  _S3675[int(16)] = rnd_3;

#line 1182
            _S3675[i_6] = _S3674;

#line 1182
            float  _S3676[int(16)] = s_diff_rnd_3;

#line 1182
            _S3676[i_6] = 0.0;

#line 1182
            _dc_1 = int(2);

#line 1182
            rnd_3 = _S3675;

#line 1182
            s_diff_rnd_3 = _S3676;

#line 1182
        }
        else
        {

#line 1182
            _dc_1 = _S3671;

#line 1182
        }

#line 1182
        if(_dc_1 != int(2))
        {

#line 1182
            _bflag_8 = false;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        if(_bflag_8)
        {

#line 1182
            i_6 = i_6 + int(1);

#line 1182
            _S3669 = _S3672;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        _pc_4 = _pc_4 + int(1);

#line 1182
    }

#line 1182
    float3 auxDir_3;

#line 1182
    float3  s_diff_totalWarpedPoint_10[int(3)];

#line 1182
    float3  totalWarpedPoint_10[int(3)];

#line 1182
    float3  s_diff_totalWarpedPoint_11[int(3)];

#line 1182
    float3  totalWarpedPoint_11[int(3)];

#line 1182
    float3  s_diff_totalWarpedPoint_12[int(3)];

#line 1182
    float3  totalWarpedPoint_12[int(3)];

#line 1182
    float  s_diff_totalWeight_10[int(3)];

#line 1182
    float  totalWeight_10[int(3)];

#line 1182
    float  s_diff_totalWeight_11[int(3)];

#line 1182
    float  totalWeight_11[int(3)];

#line 1182
    float  s_diff_totalWeight_12[int(3)];

#line 1182
    float  totalWeight_12[int(3)];

#line 1182
    _bflag_8 = true;

#line 1182
    uint i_7 = 0U;

#line 1182
    float  totalWeight_13[int(3)];

#line 1182
    totalWeight_13[int(0)] = 0.0;

#line 1182
    totalWeight_13[int(1)] = 0.0;

#line 1182
    totalWeight_13[int(2)] = 0.0;

#line 1182
    float  s_diff_totalWeight_13[int(3)];

#line 1182
    s_diff_totalWeight_13[int(0)] = 0.0;

#line 1182
    s_diff_totalWeight_13[int(1)] = 0.0;

#line 1182
    s_diff_totalWeight_13[int(2)] = 0.0;

#line 1182
    float3  totalWarpedPoint_13[int(3)];

#line 1182
    totalWarpedPoint_13[int(0)] = _S3619;

#line 1182
    totalWarpedPoint_13[int(1)] = _S3619;

#line 1182
    totalWarpedPoint_13[int(2)] = _S3619;

#line 1182
    float3  s_diff_totalWarpedPoint_13[int(3)];

#line 1182
    s_diff_totalWarpedPoint_13[int(0)] = _S3619;

#line 1182
    s_diff_totalWarpedPoint_13[int(1)] = _S3619;

#line 1182
    s_diff_totalWarpedPoint_13[int(2)] = _S3619;

#line 1182
    i_6 = _dc_1;

#line 1182
    _pc_4 = int(0);

#line 1182
    for(;;)
    {

#line 1182
        if(_bflag_8)
        {
        }
        else
        {

#line 1182
            break;
        }

#line 1182
        bool _S3677 = i_7 < 16U;

#line 1182
        if(_S3677)
        {

#line 1182
            _dc_1 = i_6;

#line 1182
        }
        else
        {

#line 1182
            _dc_1 = int(1);

#line 1182
        }

#line 1182
        if(_S3677)
        {

#line 1182
            uint _S3678 = i_7 / 2U * 2U;

#line 1182
            uint _S3679 = _S3678 + 1U;

#line 1182
            float  _S3680[int(16)] = rnd_3;

#line 1182
            float3 _S3681 = sampleVonMisesFisher_0(baseDirection_3, kappa_7, float2(rnd_3[_S3678], rnd_3[_S3679]));

#line 1182
            if(i_7 % 2U != 0U)
            {

#line 1182
                auxDir_3 = _reflect_0(- _S3681, baseDirection_3);

#line 1182
            }
            else
            {

#line 1182
                auxDir_3 = _S3681;

#line 1182
            }

#line 1182
            DiffPair_float3_0 _S3682 = { auxDir_3, _S3615 };

#line 1182
            DiffPair_DiffRay_0 _S3683 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S3629, _S3682, globalPixel_11);

#line 1182
            DiffPair_DiffRay_0 _S3684 = { _S3683.primal_0, _S3683.differential_0 };

#line 1182
            DiffPair_IntersectionInfo_0 _S3685;

#line 1182
            _S3685.primal_0 = _S3626;

#line 1182
            _S3685.differential_0 = _S3631;

#line 1182
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S3686;

#line 1182
            _S3686._S1199 = _S3613;

#line 1182
            _S3686.isHit_0 = false;

#line 1182
            bool _S3687 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S3630, _S3684, _S3685, int(1), _S3686);

#line 1182
            DiffPair_IntersectionInfo_0 _S3688 = _S3685;

#line 1182
            if(_S3687)
            {

#line 1182
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S3689;

#line 1182
                _S3689.boundaryTerm_0 = 0.0;

#line 1182
                DiffPair_float_0 _S3690 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S3688.primal_0, _S3617.primal_0.primal_0, auxDir_3, _S3680[_S3679], kappa_7, _S3632, _S3689);

#line 1182
                if(_S3690.primal_0 > 0.0)
                {

#line 1182
                    float _S3691 = totalWeight_13[int(0)] + _S3690.primal_0;

#line 1182
                    float _S3692 = s_diff_totalWeight_13[int(0)] + _S3690.differential_0;

#line 1182
                    totalWeight_12 = totalWeight_13;

#line 1182
                    totalWeight_12[int(0)] = _S3691;

#line 1182
                    s_diff_totalWeight_12 = s_diff_totalWeight_13;

#line 1182
                    s_diff_totalWeight_12[int(0)] = _S3692;

#line 1182
                    float3 _S3693 = (float3)_S3690.primal_0;

#line 1182
                    float3 _S3694 = totalWarpedPoint_13[int(0)] + _S3693 * _S3688.primal_0.posW_5;

#line 1182
                    float3 _S3695 = s_diff_totalWarpedPoint_13[int(0)] + ((float3)_S3690.differential_0 * _S3688.primal_0.posW_5 + _S3688.differential_0.posW_2 * _S3693);

#line 1182
                    totalWarpedPoint_12 = totalWarpedPoint_13;

#line 1182
                    totalWarpedPoint_12[int(0)] = _S3694;

#line 1182
                    s_diff_totalWarpedPoint_12 = s_diff_totalWarpedPoint_13;

#line 1182
                    s_diff_totalWarpedPoint_12[int(0)] = _S3695;

#line 1182
                }
                else
                {

#line 1182
                    totalWeight_12 = totalWeight_13;

#line 1182
                    s_diff_totalWeight_12 = s_diff_totalWeight_13;

#line 1182
                    totalWarpedPoint_12 = totalWarpedPoint_13;

#line 1182
                    s_diff_totalWarpedPoint_12 = s_diff_totalWarpedPoint_13;

#line 1182
                }

#line 1182
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S3696;

#line 1182
                _S3696.boundaryTerm_0 = 0.0;

#line 1182
                DiffPair_float_0 _S3697 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S3688.primal_0, _S3617.primal_0.primal_0, auxDir_3, _S3680[_S3679], kappa_7, _S3633, _S3696);

#line 1182
                if(_S3697.primal_0 > 0.0)
                {

#line 1182
                    float _S3698 = totalWeight_12[int(1)] + _S3697.primal_0;

#line 1182
                    float _S3699 = s_diff_totalWeight_12[int(1)] + _S3697.differential_0;

#line 1182
                    totalWeight_11 = totalWeight_12;

#line 1182
                    totalWeight_11[int(1)] = _S3698;

#line 1182
                    s_diff_totalWeight_11 = s_diff_totalWeight_12;

#line 1182
                    s_diff_totalWeight_11[int(1)] = _S3699;

#line 1182
                    float3 _S3700 = (float3)_S3697.primal_0;

#line 1182
                    float3 _S3701 = totalWarpedPoint_12[int(1)] + _S3700 * _S3688.primal_0.posW_5;

#line 1182
                    float3 _S3702 = s_diff_totalWarpedPoint_12[int(1)] + ((float3)_S3697.differential_0 * _S3688.primal_0.posW_5 + _S3688.differential_0.posW_2 * _S3700);

#line 1182
                    totalWarpedPoint_11 = totalWarpedPoint_12;

#line 1182
                    totalWarpedPoint_11[int(1)] = _S3701;

#line 1182
                    s_diff_totalWarpedPoint_11 = s_diff_totalWarpedPoint_12;

#line 1182
                    s_diff_totalWarpedPoint_11[int(1)] = _S3702;

#line 1182
                }
                else
                {

#line 1182
                    totalWeight_11 = totalWeight_12;

#line 1182
                    s_diff_totalWeight_11 = s_diff_totalWeight_12;

#line 1182
                    totalWarpedPoint_11 = totalWarpedPoint_12;

#line 1182
                    s_diff_totalWarpedPoint_11 = s_diff_totalWarpedPoint_12;

#line 1182
                }

#line 1182
                s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S3703;

#line 1182
                _S3703.boundaryTerm_0 = 0.0;

#line 1182
                DiffPair_float_0 _S3704 = s_bwd_primal_fwd_computeHarmonicWeightMisuba_0(_S3688.primal_0, _S3617.primal_0.primal_0, auxDir_3, _S3680[_S3679], kappa_7, _S3634, _S3703);

#line 1182
                if(_S3704.primal_0 > 0.0)
                {

#line 1182
                    float _S3705 = totalWeight_11[int(2)] + _S3704.primal_0;

#line 1182
                    float _S3706 = s_diff_totalWeight_11[int(2)] + _S3704.differential_0;

#line 1182
                    totalWeight_10 = totalWeight_11;

#line 1182
                    totalWeight_10[int(2)] = _S3705;

#line 1182
                    s_diff_totalWeight_10 = s_diff_totalWeight_11;

#line 1182
                    s_diff_totalWeight_10[int(2)] = _S3706;

#line 1182
                    float3 _S3707 = (float3)_S3704.primal_0;

#line 1182
                    float3 _S3708 = totalWarpedPoint_11[int(2)] + _S3707 * _S3688.primal_0.posW_5;

#line 1182
                    float3 _S3709 = s_diff_totalWarpedPoint_11[int(2)] + ((float3)_S3704.differential_0 * _S3688.primal_0.posW_5 + _S3688.differential_0.posW_2 * _S3707);

#line 1182
                    totalWarpedPoint_10 = totalWarpedPoint_11;

#line 1182
                    totalWarpedPoint_10[int(2)] = _S3708;

#line 1182
                    s_diff_totalWarpedPoint_10 = s_diff_totalWarpedPoint_11;

#line 1182
                    s_diff_totalWarpedPoint_10[int(2)] = _S3709;

#line 1182
                }
                else
                {

#line 1182
                    totalWeight_10 = totalWeight_11;

#line 1182
                    s_diff_totalWeight_10 = s_diff_totalWeight_11;

#line 1182
                    totalWarpedPoint_10 = totalWarpedPoint_11;

#line 1182
                    s_diff_totalWarpedPoint_10 = s_diff_totalWarpedPoint_11;

#line 1182
                }

#line 1182
                totalWeight_12 = totalWeight_10;

#line 1182
                s_diff_totalWeight_12 = s_diff_totalWeight_10;

#line 1182
                totalWarpedPoint_12 = totalWarpedPoint_10;

#line 1182
                s_diff_totalWarpedPoint_12 = s_diff_totalWarpedPoint_10;

#line 1182
            }
            else
            {

#line 1182
                totalWeight_12 = totalWeight_13;

#line 1182
                s_diff_totalWeight_12 = s_diff_totalWeight_13;

#line 1182
                totalWarpedPoint_12 = totalWarpedPoint_13;

#line 1182
                s_diff_totalWarpedPoint_12 = s_diff_totalWarpedPoint_13;

#line 1182
            }

#line 1182
            i_6 = int(2);

#line 1182
        }
        else
        {

#line 1182
            i_6 = _dc_1;

#line 1182
            totalWeight_12 = totalWeight_13;

#line 1182
            s_diff_totalWeight_12 = s_diff_totalWeight_13;

#line 1182
            totalWarpedPoint_12 = totalWarpedPoint_13;

#line 1182
            s_diff_totalWarpedPoint_12 = s_diff_totalWarpedPoint_13;

#line 1182
        }

#line 1182
        if(i_6 != int(2))
        {

#line 1182
            _bflag_8 = false;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        if(_bflag_8)
        {

#line 1182
            i_7 = i_7 + 1U;

#line 1182
        }
        else
        {

#line 1182
        }

#line 1182
        int _S3710 = _pc_4 + int(1);

#line 1182
        totalWeight_13 = totalWeight_12;

#line 1182
        s_diff_totalWeight_13 = s_diff_totalWeight_12;

#line 1182
        totalWarpedPoint_13 = totalWarpedPoint_12;

#line 1182
        s_diff_totalWarpedPoint_13 = s_diff_totalWarpedPoint_12;

#line 1182
        _pc_4 = _S3710;

#line 1182
    }

#line 1182
    float3 _S3711;

#line 1182
    float3 _S3712;

#line 1182
    float3 _S3713;

#line 1182
    float3 _S3714;

#line 1182
    float3 _S3715;

#line 1182
    float3 _S3716;

#line 1182
    float3 _S3717;

#line 1182
    float3 _S3718;

#line 1182
    float3 _S3719;

#line 1182
    float3 _S3720;

#line 1182
    float3 _S3721;

#line 1182
    float3 _S3722;

#line 1182
    float3 _S3723;

#line 1182
    float3 _S3724;

#line 1182
    float3 _S3725;

#line 1182
    float3 _S3726;

#line 1182
    float3 _S3727;

#line 1182
    float3 _S3728;

#line 1182
    float3 _S3729;

#line 1182
    float3 _S3730;

#line 1182
    DiffPair_float_0 _S3731;

#line 1182
    DiffPair_float_0 _S3732;

#line 1182
    DiffPair_float_0 _S3733;

#line 1182
    DiffPair_float_0 _S3734;

#line 1182
    if(_S3620)
    {

#line 1182
        _S3711 = _S3665;

#line 1182
        _S3712 = _S3664;

#line 1182
        _S3713 = _S3663;

#line 1182
        _S3714 = _S3661;

#line 1182
        _S3715 = _s_diff_ctx_26._S1058[int(2)];

#line 1182
        _S3716 = _S3662;

#line 1182
        _S3717 = _s_diff_ctx_26._S1057[int(2)];

#line 1182
        _S3731.primal_0 = _s_diff_ctx_26._S1060[int(2)];

#line 1182
        _S3731.differential_0 = _s_diff_ctx_26._S1059[int(2)];

#line 1182
        _S3732.primal_0 = 0.00000000999999993923;

#line 1182
        _S3732.differential_0 = 0.0;

#line 1182
        _S3718 = _S3659;

#line 1182
        _S3719 = _S3658;

#line 1182
        _S3720 = _S3657;

#line 1182
        auxDir_3 = _S3655;

#line 1182
        _S3721 = _s_diff_ctx_26._S1058[int(1)];

#line 1182
        _S3722 = _S3656;

#line 1182
        _S3723 = _s_diff_ctx_26._S1057[int(1)];

#line 1182
        _S3733.primal_0 = _s_diff_ctx_26._S1060[int(1)];

#line 1182
        _S3733.differential_0 = _s_diff_ctx_26._S1059[int(1)];

#line 1182
        _S3724 = _S3653;

#line 1182
        _S3725 = _S3652;

#line 1182
        _S3726 = _S3651;

#line 1182
        _S3727 = _S3649;

#line 1182
        _S3728 = _s_diff_ctx_26._S1058[int(0)];

#line 1182
        _S3729 = _S3650;

#line 1182
        _S3730 = _s_diff_ctx_26._S1057[int(0)];

#line 1182
        _S3734.primal_0 = _s_diff_ctx_26._S1060[int(0)];

#line 1182
        _S3734.differential_0 = _s_diff_ctx_26._S1059[int(0)];

#line 1182
    }
    else
    {

#line 1182
        _S3711 = _S3615;

#line 1182
        _S3712 = _S3615;

#line 1182
        _S3713 = _S3615;

#line 1182
        _S3714 = _S3615;

#line 1182
        _S3715 = _S3615;

#line 1182
        _S3716 = _S3615;

#line 1182
        _S3717 = _S3615;

#line 1182
        _S3731.primal_0 = 0.0;

#line 1182
        _S3731.differential_0 = 0.0;

#line 1182
        _S3732.primal_0 = 0.0;

#line 1182
        _S3732.differential_0 = 0.0;

#line 1182
        _S3718 = _S3615;

#line 1182
        _S3719 = _S3615;

#line 1182
        _S3720 = _S3615;

#line 1182
        auxDir_3 = _S3615;

#line 1182
        _S3721 = _S3615;

#line 1182
        _S3722 = _S3615;

#line 1182
        _S3723 = _S3615;

#line 1182
        _S3733.primal_0 = 0.0;

#line 1182
        _S3733.differential_0 = 0.0;

#line 1182
        _S3724 = _S3615;

#line 1182
        _S3725 = _S3615;

#line 1182
        _S3726 = _S3615;

#line 1182
        _S3727 = _S3615;

#line 1182
        _S3728 = _S3615;

#line 1182
        _S3729 = _S3615;

#line 1182
        _S3730 = _S3615;

#line 1182
        _S3734.primal_0 = 0.0;

#line 1182
        _S3734.differential_0 = 0.0;

#line 1182
    }

#line 1182
    float _S3735;

#line 1182
    float _S3736;

#line 1182
    if(_S3620)
    {

#line 1182
        float3 _S3737 = dpdpwarpedPoint_3.differential_0[int(2)] / _S3711;

#line 1182
        float3 _S3738 = _S3713 * _S3737;

#line 1182
        float3 _S3739 = _S3714 * (_S3712 * - _S3737);

#line 1182
        float3 _S3740 = - _S3738;

#line 1182
        float3 _S3741 = _S3715 * _S3740;

#line 1182
        float3 _S3742 = _S3714 * _S3738;

#line 1189
        float3 _S3743 = _S3739 + _S3739 + _S3717 * _S3738 + _S3715 * - _S3666;

#line 1189
        float3 _S3744 = _S3716 * _S3740 + _S3714 * _S3666;

#line 1189
        DiffPair_float_0 _S3745 = { _S3743[int(0)] + _S3743[int(1)] + _S3743[int(2)], _S3741[int(0)] + _S3741[int(1)] + _S3741[int(2)] };

#line 1189
        DiffPair_4 _S3746;

#line 1189
        _S3746.primal_0 = _S3731;

#line 1189
        _S3746.differential_0 = _S3635;

#line 1189
        DiffPair_4 _S3747;

#line 1189
        _S3747.primal_0 = _S3732;

#line 1189
        _S3747.differential_0 = _S3635;

#line 1189
        s_bwd_d_max_0(_S3746, _S3747, _S3745);

#line 1189
        float3 _S3748 = dpdpwarpedPoint_3.differential_0[int(1)] / _S3718;

#line 1189
        float3 _S3749 = _S3720 * _S3748;

#line 1189
        float3 _S3750 = auxDir_3 * (_S3719 * - _S3748);

#line 1189
        float3 _S3751 = - _S3749;

#line 1189
        float3 _S3752 = _S3721 * _S3751;

#line 1189
        float3 _S3753 = auxDir_3 * _S3749;

#line 1189
        float3 _S3754 = _S3750 + _S3750 + _S3723 * _S3749 + _S3721 * - _S3667;

#line 1189
        float3 _S3755 = _S3722 * _S3751 + auxDir_3 * _S3667;

#line 1189
        DiffPair_float_0 _S3756 = { _S3754[int(0)] + _S3754[int(1)] + _S3754[int(2)], _S3752[int(0)] + _S3752[int(1)] + _S3752[int(2)] };

#line 1189
        DiffPair_4 _S3757;

#line 1189
        _S3757.primal_0 = _S3733;

#line 1189
        _S3757.differential_0 = _S3635;

#line 1189
        DiffPair_4 _S3758;

#line 1189
        _S3758.primal_0 = _S3645;

#line 1189
        _S3758.differential_0 = _S3635;

#line 1189
        s_bwd_d_max_0(_S3757, _S3758, _S3756);

#line 1189
        float3 _S3759 = dpdpwarpedPoint_3.differential_0[int(0)] / _S3724;

#line 1189
        float3 _S3760 = _S3726 * _S3759;

#line 1189
        float3 _S3761 = _S3727 * (_S3725 * - _S3759);

#line 1189
        float3 _S3762 = - _S3760;

#line 1189
        float3 _S3763 = _S3728 * _S3762;

#line 1189
        float3 _S3764 = _S3727 * _S3760;

#line 1189
        float3 _S3765 = _S3761 + _S3761 + _S3730 * _S3760 + _S3728 * - _S3668;

#line 1189
        float3 _S3766 = _S3729 * _S3762 + _S3727 * _S3668;

#line 1189
        DiffPair_float_0 _S3767 = { _S3765[int(0)] + _S3765[int(1)] + _S3765[int(2)], _S3763[int(0)] + _S3763[int(1)] + _S3763[int(2)] };

#line 1189
        DiffPair_4 _S3768;

#line 1189
        _S3768.primal_0 = _S3734;

#line 1189
        _S3768.differential_0 = _S3635;

#line 1189
        DiffPair_4 _S3769;

#line 1189
        _S3769.primal_0 = _S3645;

#line 1189
        _S3769.differential_0 = _S3635;

#line 1189
        s_bwd_d_max_0(_S3768, _S3769, _S3767);

#line 1189
        float3  _S3770[int(3)];

#line 1189
        _S3770[int(0)] = _S3615;

#line 1189
        _S3770[int(1)] = _S3615;

#line 1189
        _S3770[int(2)] = _S3615;

#line 1189
        _S3770[int(2)] = _S3742;

#line 1189
        _S3770[int(1)] = _S3753;

#line 1189
        _S3770[int(0)] = _S3764;

#line 1189
        float3  _S3771[int(3)];

#line 1189
        _S3771[int(0)] = _S3615;

#line 1189
        _S3771[int(1)] = _S3615;

#line 1189
        _S3771[int(2)] = _S3615;

#line 1189
        _S3771[int(2)] = _S3744;

#line 1189
        _S3771[int(1)] = _S3755;

#line 1189
        _S3771[int(0)] = _S3766;

#line 1189
        float  _S3772[int(3)];

#line 1189
        _S3772[int(0)] = 0.0;

#line 1189
        _S3772[int(1)] = 0.0;

#line 1189
        _S3772[int(2)] = 0.0;

#line 1189
        _S3772[int(2)] = _S3746.differential_0.differential_0;

#line 1189
        _S3772[int(1)] = _S3757.differential_0.differential_0;

#line 1189
        float  _S3773[int(3)];

#line 1189
        _S3773[int(0)] = 0.0;

#line 1189
        _S3773[int(1)] = 0.0;

#line 1189
        _S3773[int(2)] = 0.0;

#line 1189
        _S3773[int(2)] = _S3746.differential_0.primal_0;

#line 1189
        _S3773[int(1)] = _S3757.differential_0.primal_0;

#line 1189
        _S3735 = _S3768.differential_0.differential_0;

#line 1189
        _S3736 = _S3768.differential_0.primal_0;

#line 1189
        totalWeight_13[int(0)] = _S3772[int(0)];

#line 1189
        totalWeight_13[int(1)] = _S3772[int(1)];

#line 1189
        totalWeight_13[int(2)] = _S3772[int(2)];

#line 1189
        s_diff_totalWeight_13[int(0)] = _S3773[int(0)];

#line 1189
        s_diff_totalWeight_13[int(1)] = _S3773[int(1)];

#line 1189
        s_diff_totalWeight_13[int(2)] = _S3773[int(2)];

#line 1189
        totalWarpedPoint_13[int(0)] = _S3771[int(0)];

#line 1189
        totalWarpedPoint_13[int(1)] = _S3771[int(1)];

#line 1189
        totalWarpedPoint_13[int(2)] = _S3771[int(2)];

#line 1189
        s_diff_totalWarpedPoint_13[int(0)] = _S3770[int(0)];

#line 1189
        s_diff_totalWarpedPoint_13[int(1)] = _S3770[int(1)];

#line 1189
        s_diff_totalWarpedPoint_13[int(2)] = _S3770[int(2)];

#line 1189
    }
    else
    {

#line 1189
        _S3735 = 0.0;

#line 1189
        _S3736 = 0.0;

#line 1189
        totalWeight_13[int(0)] = 0.0;

#line 1189
        totalWeight_13[int(1)] = 0.0;

#line 1189
        totalWeight_13[int(2)] = 0.0;

#line 1189
        s_diff_totalWeight_13[int(0)] = 0.0;

#line 1189
        s_diff_totalWeight_13[int(1)] = 0.0;

#line 1189
        s_diff_totalWeight_13[int(2)] = 0.0;

#line 1189
        totalWarpedPoint_13[int(0)] = _S3615;

#line 1189
        totalWarpedPoint_13[int(1)] = _S3615;

#line 1189
        totalWarpedPoint_13[int(2)] = _S3615;

#line 1189
        s_diff_totalWarpedPoint_13[int(0)] = _S3615;

#line 1189
        s_diff_totalWarpedPoint_13[int(1)] = _S3615;

#line 1189
        s_diff_totalWarpedPoint_13[int(2)] = _S3615;

#line 1189
    }

#line 1189
    float  _S3774[int(3)];

#line 1189
    _S3774[int(0)] = 0.0;

#line 1189
    _S3774[int(1)] = 0.0;

#line 1189
    _S3774[int(2)] = 0.0;

#line 1189
    _S3774[int(0)] = _S3735;

#line 483
    float _S3775 = totalWeight_13[int(0)] + _S3774[int(0)];

#line 483
    float _S3776 = totalWeight_13[int(1)] + _S3774[int(1)];

#line 483
    float _S3777 = totalWeight_13[int(2)] + _S3774[int(2)];

#line 483
    float  _S3778[int(3)];

#line 483
    _S3778[int(0)] = 0.0;

#line 483
    _S3778[int(1)] = 0.0;

#line 483
    _S3778[int(2)] = 0.0;

#line 483
    _S3778[int(0)] = _S3736;

#line 483
    float _S3779 = s_diff_totalWeight_13[int(0)] + _S3778[int(0)];

#line 483
    float _S3780 = s_diff_totalWeight_13[int(1)] + _S3778[int(1)];

#line 483
    float _S3781 = s_diff_totalWeight_13[int(2)] + _S3778[int(2)];

#line 483
    _dc_1 = _S3624;

#line 483
    totalWeight_13[int(0)] = _S3779;

#line 483
    totalWeight_13[int(1)] = _S3780;

#line 483
    totalWeight_13[int(2)] = _S3781;

#line 483
    s_diff_totalWeight_13[int(0)] = _S3775;

#line 483
    s_diff_totalWeight_13[int(1)] = _S3776;

#line 483
    s_diff_totalWeight_13[int(2)] = _S3777;

#line 483
    _S3711 = _S3615;

#line 483
    _S3712 = _S3615;

#line 483
    _S3713 = _S3615;

#line 483
    _S3714 = _S3615;

#line 483
    _S3715 = _S3615;

#line 483
    _S3716 = _S3615;

#line 483
    _S3717 = _S3615;

#line 483
    _S3718 = _S3615;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3782 = _S3621;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S3783 = _S3622;

#line 483
    totalWeight_12[int(0)] = 0.0;

#line 483
    totalWeight_12[int(1)] = 0.0;

#line 483
    totalWeight_12[int(2)] = 0.0;

#line 483
    s_diff_totalWeight_12[int(0)] = 0.0;

#line 483
    s_diff_totalWeight_12[int(1)] = 0.0;

#line 483
    s_diff_totalWeight_12[int(2)] = 0.0;

#line 483
    totalWarpedPoint_12[int(0)] = _S3615;

#line 483
    totalWarpedPoint_12[int(1)] = _S3615;

#line 483
    totalWarpedPoint_12[int(2)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_12[int(0)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_12[int(1)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_12[int(2)] = _S3615;

#line 483
    totalWeight_11[int(0)] = 0.0;

#line 483
    totalWeight_11[int(1)] = 0.0;

#line 483
    totalWeight_11[int(2)] = 0.0;

#line 483
    s_diff_totalWeight_11[int(0)] = 0.0;

#line 483
    s_diff_totalWeight_11[int(1)] = 0.0;

#line 483
    s_diff_totalWeight_11[int(2)] = 0.0;

#line 483
    totalWarpedPoint_11[int(0)] = _S3615;

#line 483
    totalWarpedPoint_11[int(1)] = _S3615;

#line 483
    totalWarpedPoint_11[int(2)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_11[int(0)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_11[int(1)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_11[int(2)] = _S3615;

#line 483
    s_diff_s_diff_IntersectionInfo_0 _S3784 = _S3623;

#line 483
    s_diff_s_diff_IntersectionInfo_0 _S3785 = _S3623;

#line 483
    _S3719 = _S3615;

#line 483
    totalWeight_10[int(0)] = 0.0;

#line 483
    totalWeight_10[int(1)] = 0.0;

#line 483
    totalWeight_10[int(2)] = 0.0;

#line 483
    s_diff_totalWeight_10[int(0)] = 0.0;

#line 483
    s_diff_totalWeight_10[int(1)] = 0.0;

#line 483
    s_diff_totalWeight_10[int(2)] = 0.0;

#line 483
    totalWarpedPoint_10[int(0)] = _S3615;

#line 483
    totalWarpedPoint_10[int(1)] = _S3615;

#line 483
    totalWarpedPoint_10[int(2)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_10[int(0)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_10[int(1)] = _S3615;

#line 483
    s_diff_totalWarpedPoint_10[int(2)] = _S3615;

#line 483
    _S3720 = _S3615;

#line 483
    rnd_3[int(0)] = 0.0;

#line 483
    rnd_3[int(1)] = 0.0;

#line 483
    rnd_3[int(2)] = 0.0;

#line 483
    rnd_3[int(3)] = 0.0;

#line 483
    rnd_3[int(4)] = 0.0;

#line 483
    rnd_3[int(5)] = 0.0;

#line 483
    rnd_3[int(6)] = 0.0;

#line 483
    rnd_3[int(7)] = 0.0;

#line 483
    rnd_3[int(8)] = 0.0;

#line 483
    rnd_3[int(9)] = 0.0;

#line 483
    rnd_3[int(10)] = 0.0;

#line 483
    rnd_3[int(11)] = 0.0;

#line 483
    rnd_3[int(12)] = 0.0;

#line 483
    rnd_3[int(13)] = 0.0;

#line 483
    rnd_3[int(14)] = 0.0;

#line 483
    rnd_3[int(15)] = 0.0;

#line 483
    for(;;)
    {

#line 483
        if(_dc_1 >= int(0))
        {
        }
        else
        {

#line 483
            break;
        }

#line 483
        bool _S3786 = _dc_1 < 16U;

#line 483
        bool _S3787;

#line 483
        bool _S3788;

#line 483
        bool _S3789;

#line 483
        uint _S3790;

#line 483
        float3 _S3791;

#line 483
        float3 _S3792;

#line 483
        DiffPair_float3_0 _S3793;

#line 483
        DiffPair_float3_0 _S3794;

#line 483
        DiffPair_float3_0 _S3795;

#line 483
        DiffPair_float3_0 _S3796;

#line 483
        DiffPair_float3_0 _S3797;

#line 483
        IntersectionInfo_0 _S3798;

#line 483
        DiffPair_DifferentiableSceneQuery_0 _S3799;

#line 483
        DiffPair_DiffRay_0 _S3800;

#line 483
        if(_S3786)
        {

#line 483
            uint _S3801 = _dc_1 / 2U * 2U;

#line 483
            uint _S3802 = _S3801 + 1U;

#line 483
            int _S3803 = _dc_1;

#line 483
            if(_dc_1 % 2U != 0U)
            {

#line 483
                auxDir_3 = _s_diff_ctx_26._S1053[_dc_1];

#line 483
            }
            else
            {

#line 483
                auxDir_3 = _s_diff_ctx_26._S1054[_S3803];

#line 483
            }

#line 483
            float3 _S3804 = auxDir_3;

#line 483
            DiffPair_float3_0 _S3805 = { auxDir_3, _S3615 };

#line 483
            DiffPair_DiffRay_0 _S3806 = s_bwd_primal_s_fwd_DiffRay_x24init_0(_S3629, _S3805, globalPixel_11);

#line 483
            DiffPair_DiffRay_0 _S3807 = { _S3806.primal_0, _S3806.differential_0 };

#line 483
            DiffPair_IntersectionInfo_0 _S3808;

#line 483
            _S3808.primal_0 = _S3626;

#line 483
            _S3808.differential_0 = _S3631;

#line 483
            bool _S3809 = s_bwd_primal_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S3630, _S3807, _S3808, int(1), _S3614);

#line 483
            DiffPair_IntersectionInfo_0 _S3810 = _S3808;

#line 483
            if(_S3809)
            {

#line 483
                int _S3811 = _dc_1;

#line 483
                bool _S3812 = _s_diff_ctx_26._S1051[_dc_1].primal_0 > 0.0;

#line 483
                if(_S3812)
                {

#line 483
                    float3 _S3813 = (float3)_s_diff_ctx_26._S1051[_S3811].primal_0;

#line 483
                    float3 _S3814 = (float3)_s_diff_ctx_26._S1051[_S3811].differential_0;

#line 483
                    _S3721 = _S3810.differential_0.posW_2;

#line 483
                    _S3722 = _S3813;

#line 483
                    _S3723 = _S3814;

#line 483
                    _S3724 = _S3810.primal_0.posW_5;

#line 483
                }
                else
                {

#line 483
                    _S3721 = _S3615;

#line 483
                    _S3722 = _S3615;

#line 483
                    _S3723 = _S3615;

#line 483
                    _S3724 = _S3615;

#line 483
                }

#line 483
                int _S3815 = _dc_1;

#line 483
                bool _S3816 = _s_diff_ctx_26._S1049[_dc_1].primal_0 > 0.0;

#line 483
                if(_S3816)
                {

#line 483
                    float3 _S3817 = (float3)_s_diff_ctx_26._S1049[_S3815].primal_0;

#line 483
                    float3 _S3818 = (float3)_s_diff_ctx_26._S1049[_S3815].differential_0;

#line 483
                    _S3725 = _S3810.differential_0.posW_2;

#line 483
                    _S3726 = _S3817;

#line 483
                    _S3727 = _S3818;

#line 483
                    _S3728 = _S3810.primal_0.posW_5;

#line 483
                }
                else
                {

#line 483
                    _S3725 = _S3615;

#line 483
                    _S3726 = _S3615;

#line 483
                    _S3727 = _S3615;

#line 483
                    _S3728 = _S3615;

#line 483
                }

#line 483
                int _S3819 = _dc_1;

#line 483
                bool _S3820 = _s_diff_ctx_26._S1047[_dc_1].primal_0 > 0.0;

#line 483
                if(_S3820)
                {

#line 483
                    float3 _S3821 = (float3)_s_diff_ctx_26._S1047[_S3819].primal_0;

#line 483
                    float3 _S3822 = (float3)_s_diff_ctx_26._S1047[_S3819].differential_0;

#line 483
                    _S3729 = _S3810.differential_0.posW_2;

#line 483
                    _S3730 = _S3821;

#line 483
                    _S3791 = _S3822;

#line 483
                    _S3792 = _S3810.primal_0.posW_5;

#line 483
                }
                else
                {

#line 483
                    _S3729 = _S3615;

#line 483
                    _S3730 = _S3615;

#line 483
                    _S3791 = _S3615;

#line 483
                    _S3792 = _S3615;

#line 483
                }

#line 483
                float3 _S3823 = _S3721;

#line 483
                float3 _S3824 = _S3722;

#line 483
                float3 _S3825 = _S3723;

#line 483
                float3 _S3826 = _S3724;

#line 483
                _bflag_8 = _S3820;

#line 483
                _S3721 = _S3729;

#line 483
                _S3722 = _S3730;

#line 483
                _S3723 = _S3791;

#line 483
                _S3724 = _S3792;

#line 483
                _S3793.primal_0 = _S3618.primal_0.primal_0[int(2)];

#line 483
                _S3793.differential_0 = _S3618.primal_0.differential_0[int(2)];

#line 483
                _S3787 = _S3816;

#line 483
                _S3794.primal_0 = _S3618.primal_0.primal_0[int(1)];

#line 483
                _S3794.differential_0 = _S3618.primal_0.differential_0[int(1)];

#line 483
                _S3788 = _S3812;

#line 483
                _S3729 = _S3823;

#line 483
                _S3730 = _S3824;

#line 483
                _S3791 = _S3825;

#line 483
                _S3792 = _S3826;

#line 483
                _S3795.primal_0 = _S3618.primal_0.primal_0[int(0)];

#line 483
                _S3795.differential_0 = _S3618.primal_0.differential_0[int(0)];

#line 483
            }
            else
            {

#line 483
                _bflag_8 = false;

#line 483
                _S3721 = _S3615;

#line 483
                _S3722 = _S3615;

#line 483
                _S3723 = _S3615;

#line 483
                _S3724 = _S3615;

#line 483
                _S3793.primal_0 = _S3615;

#line 483
                _S3793.differential_0 = _S3615;

#line 483
                _S3787 = false;

#line 483
                _S3725 = _S3615;

#line 483
                _S3726 = _S3615;

#line 483
                _S3727 = _S3615;

#line 483
                _S3728 = _S3615;

#line 483
                _S3794.primal_0 = _S3615;

#line 483
                _S3794.differential_0 = _S3615;

#line 483
                _S3788 = false;

#line 483
                _S3729 = _S3615;

#line 483
                _S3730 = _S3615;

#line 483
                _S3791 = _S3615;

#line 483
                _S3792 = _S3615;

#line 483
                _S3795.primal_0 = _S3615;

#line 483
                _S3795.differential_0 = _S3615;

#line 483
            }

#line 483
            float3 _S3827 = auxDir_3;

#line 483
            bool _S3828 = _bflag_8;

#line 483
            bool _S3829 = _S3787;

#line 483
            bool _S3830 = _S3788;

#line 483
            _bflag_8 = _S3809;

#line 483
            _S3787 = _S3828;

#line 483
            auxDir_3 = _S3721;

#line 483
            _S3721 = _S3722;

#line 483
            _S3722 = _S3723;

#line 483
            _S3723 = _S3724;

#line 483
            _S3798 = _S3810.primal_0;

#line 483
            _S3724 = _S3827;

#line 483
            _S3735 = _s_diff_ctx_26._S1062[_S3802];

#line 483
            _S3788 = _S3829;

#line 483
            _S3789 = _S3830;

#line 483
            _S3799.primal_0 = _S3616.primal_0.primal_0;

#line 483
            _S3799.differential_0 = _S3616.primal_0.differential_0;

#line 483
            _S3800.primal_0 = _S3806.primal_0;

#line 483
            _S3800.differential_0 = _S3806.differential_0;

#line 483
            _S3796.primal_0 = _S3617.primal_0.primal_0;

#line 483
            _S3796.differential_0 = _S3617.primal_0.differential_0;

#line 483
            _S3797.primal_0 = _S3804;

#line 483
            _S3797.differential_0 = _S3615;

#line 483
            i_7 = _S3802;

#line 483
            _S3790 = _S3801;

#line 483
        }
        else
        {

#line 483
            _bflag_8 = false;

#line 483
            _S3787 = false;

#line 483
            auxDir_3 = _S3615;

#line 483
            _S3721 = _S3615;

#line 483
            _S3722 = _S3615;

#line 483
            _S3723 = _S3615;

#line 483
            _S3798.triangleID_2 = 0U;

#line 483
            _S3798.instanceID_7 = _S3625;

#line 483
            _S3798.barycentrics_2 = _S3615;

#line 483
            _S3798.normalW_2 = _S3615;

#line 483
            _S3798.posW_5 = _S3615;

#line 483
            _S3798.hitT_5 = 0.0;

#line 483
            _S3724 = _S3615;

#line 483
            _S3735 = 0.0;

#line 483
            _S3793.primal_0 = _S3615;

#line 483
            _S3793.differential_0 = _S3615;

#line 483
            _S3788 = false;

#line 483
            _S3725 = _S3615;

#line 483
            _S3726 = _S3615;

#line 483
            _S3727 = _S3615;

#line 483
            _S3728 = _S3615;

#line 483
            _S3794.primal_0 = _S3615;

#line 483
            _S3794.differential_0 = _S3615;

#line 483
            _S3789 = false;

#line 483
            _S3729 = _S3615;

#line 483
            _S3730 = _S3615;

#line 483
            _S3791 = _S3615;

#line 483
            _S3792 = _S3615;

#line 483
            _S3795.primal_0 = _S3615;

#line 483
            _S3795.differential_0 = _S3615;

#line 483
            _S3799.primal_0 = _S3640;

#line 483
            _S3799.differential_0 = _S3641;

#line 483
            _S3800.primal_0 = _S3637;

#line 483
            _S3800.differential_0 = _S3638;

#line 483
            _S3796.primal_0 = _S3615;

#line 483
            _S3796.differential_0 = _S3615;

#line 483
            _S3797.primal_0 = _S3615;

#line 483
            _S3797.differential_0 = _S3615;

#line 483
            i_7 = 0U;

#line 483
            _S3790 = 0U;

#line 483
        }

#line 483
        float  _S3831[int(3)] = totalWeight_13;

#line 483
        float  _S3832[int(3)] = totalWeight_13;

#line 483
        float  _S3833[int(3)] = totalWeight_13;

#line 483
        float  _S3834[int(3)] = s_diff_totalWeight_13;

#line 483
        float  _S3835[int(3)] = s_diff_totalWeight_13;

#line 483
        float  _S3836[int(3)] = s_diff_totalWeight_13;

#line 483
        float3  _S3837[int(3)] = totalWarpedPoint_13;

#line 483
        float3  _S3838[int(3)] = totalWarpedPoint_13;

#line 483
        float3  _S3839[int(3)] = totalWarpedPoint_13;

#line 483
        float3  _S3840[int(3)] = s_diff_totalWarpedPoint_13;

#line 483
        float3  _S3841[int(3)] = s_diff_totalWarpedPoint_13;

#line 483
        float3  _S3842[int(3)] = s_diff_totalWarpedPoint_13;

#line 483
        if(_S3786)
        {

#line 483
            float  _S3843[int(3)];

#line 483
            float  _S3844[int(3)];

#line 483
            float  _S3845[int(3)];

#line 483
            float  _S3846[int(3)];

#line 483
            float  _S3847[int(3)];

#line 483
            float  _S3848[int(3)];

#line 483
            float  _S3849[int(3)];

#line 483
            float  _S3850[int(3)];

#line 483
            float3  _S3851[int(3)];

#line 483
            float3  _S3852[int(3)];

#line 483
            float3  _S3853[int(3)];

#line 483
            float3  _S3854[int(3)];

#line 483
            float3  _S3855[int(3)];

#line 483
            float3  _S3856[int(3)];

#line 483
            float3  _S3857[int(3)];

#line 483
            float3  _S3858[int(3)];

#line 483
            float3 _S3859;

#line 483
            float3 _S3860;

#line 483
            float3 _S3861;

#line 483
            float3 _S3862;

#line 483
            float3 _S3863;

#line 483
            float3 _S3864;

#line 483
            float3 _S3865;

#line 483
            s_diff_s_diff_IntersectionInfo_0 _S3866;

#line 483
            s_diff_s_diff_IntersectionInfo_0 _S3867;

#line 483
            if(_bflag_8)
            {

#line 483
                float _S3868 = _S3831[int(0)] + totalWeight_12[int(0)];

#line 483
                float _S3869 = _S3832[int(1)] + totalWeight_12[int(1)];

#line 483
                float _S3870 = _S3833[int(2)] + totalWeight_12[int(2)];

#line 483
                float _S3871 = _S3834[int(0)] + s_diff_totalWeight_12[int(0)];

#line 483
                float _S3872 = _S3835[int(1)] + s_diff_totalWeight_12[int(1)];

#line 483
                float _S3873 = _S3836[int(2)] + s_diff_totalWeight_12[int(2)];

#line 1189
                float3 _S3874 = _S3837[int(0)] + totalWarpedPoint_12[int(0)];

#line 1189
                float3 _S3875 = _S3838[int(1)] + totalWarpedPoint_12[int(1)];

#line 1189
                float3 _S3876 = _S3839[int(2)] + totalWarpedPoint_12[int(2)];

#line 1189
                float3 _S3877 = _S3840[int(0)] + s_diff_totalWarpedPoint_12[int(0)];

#line 1189
                float3 _S3878 = _S3841[int(1)] + s_diff_totalWarpedPoint_12[int(1)];

#line 1189
                float3 _S3879 = _S3842[int(2)] + s_diff_totalWarpedPoint_12[int(2)];

#line 1189
                float _S3880;

#line 1189
                if(_S3787)
                {

#line 1189
                    float3 _S3881 = _S3721 * _S3879;

#line 1189
                    float3 _S3882 = _S3723 * _S3879;

#line 1189
                    float3 _S3883 = _S3722 * _S3879 + _S3721 * _S3876;

#line 1189
                    float3 _S3884 = auxDir_3 * _S3879 + _S3723 * _S3876;

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3885 = _S3623;

#line 1189
                    _S3885.posW_2 = _S3881;

#line 1189
                    s_diff_s_diff_IntersectionInfo_0 _S3886 = IntersectionInfo_x24_syn_dadd_0(_S3784, _S3885);

#line 1189
                    float3 _S3887 = _S3877 + s_diff_totalWarpedPoint_11[int(0)];

#line 1189
                    float3 _S3888 = _S3878 + s_diff_totalWarpedPoint_11[int(1)];

#line 1189
                    float3  _S3889[int(3)];

#line 1189
                    _S3889[int(0)] = _S3615;

#line 1189
                    _S3889[int(1)] = _S3615;

#line 1189
                    _S3889[int(2)] = _S3615;

#line 1189
                    _S3889[int(2)] = _S3879;

#line 1189
                    float3 _S3890 = _S3887 + _S3889[int(0)];

#line 1189
                    float3 _S3891 = _S3888 + _S3889[int(1)];

#line 1189
                    float3 _S3892 = s_diff_totalWarpedPoint_11[int(2)] + _S3889[int(2)];

#line 1189
                    float3 _S3893 = _S3874 + totalWarpedPoint_11[int(0)];

#line 1189
                    float3 _S3894 = _S3875 + totalWarpedPoint_11[int(1)];

#line 1189
                    float3  _S3895[int(3)];

#line 1189
                    _S3895[int(0)] = _S3615;

#line 1189
                    _S3895[int(1)] = _S3615;

#line 1189
                    _S3895[int(2)] = _S3615;

#line 1189
                    _S3895[int(2)] = _S3876;

#line 1189
                    float3 _S3896 = _S3893 + _S3895[int(0)];

#line 1189
                    float3 _S3897 = _S3894 + _S3895[int(1)];

#line 1189
                    float3 _S3898 = totalWarpedPoint_11[int(2)] + _S3895[int(2)];

#line 483
                    float _S3899 = _S3882[int(0)] + _S3882[int(1)] + _S3882[int(2)] + _S3873;

#line 483
                    float _S3900 = _S3871 + s_diff_totalWeight_11[int(0)];

#line 483
                    float _S3901 = _S3872 + s_diff_totalWeight_11[int(1)];

#line 483
                    float  _S3902[int(3)];

#line 483
                    _S3902[int(0)] = 0.0;

#line 483
                    _S3902[int(1)] = 0.0;

#line 483
                    _S3902[int(2)] = 0.0;

#line 483
                    _S3902[int(2)] = _S3873;

#line 483
                    float _S3903 = _S3900 + _S3902[int(0)];

#line 483
                    float _S3904 = _S3901 + _S3902[int(1)];

#line 483
                    float _S3905 = s_diff_totalWeight_11[int(2)] + _S3902[int(2)];

#line 483
                    float _S3906 = _S3868 + totalWeight_11[int(0)];

#line 483
                    float _S3907 = _S3869 + totalWeight_11[int(1)];

#line 483
                    float  _S3908[int(3)];

#line 483
                    _S3908[int(0)] = 0.0;

#line 483
                    _S3908[int(1)] = 0.0;

#line 483
                    _S3908[int(2)] = 0.0;

#line 483
                    _S3908[int(2)] = _S3870;

#line 483
                    float _S3909 = _S3906 + _S3908[int(0)];

#line 483
                    float _S3910 = _S3907 + _S3908[int(1)];

#line 483
                    float _S3911 = totalWeight_11[int(2)] + _S3908[int(2)];

#line 483
                    float _S3912 = _S3884[int(0)] + _S3884[int(1)] + _S3884[int(2)] + _S3870;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3913 = _S3623;

#line 483
                    _S3913.posW_2 = _S3883;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3914 = IntersectionInfo_x24_syn_dadd_0(_S3785, _S3913);

#line 483
                    _S3736 = _S3899;

#line 483
                    _S3880 = _S3912;

#line 483
                    _S3866 = _S3914;

#line 483
                    _S3843[int(0)] = _S3909;

#line 483
                    _S3843[int(1)] = _S3910;

#line 483
                    _S3843[int(2)] = _S3911;

#line 483
                    _S3844[int(0)] = _S3903;

#line 483
                    _S3844[int(1)] = _S3904;

#line 483
                    _S3844[int(2)] = _S3905;

#line 483
                    _S3851[int(0)] = _S3896;

#line 483
                    _S3851[int(1)] = _S3897;

#line 483
                    _S3851[int(2)] = _S3898;

#line 483
                    _S3852[int(0)] = _S3890;

#line 483
                    _S3852[int(1)] = _S3891;

#line 483
                    _S3852[int(2)] = _S3892;

#line 483
                    _S3867 = _S3886;

#line 483
                }
                else
                {

#line 483
                    float _S3915 = _S3868 + totalWeight_11[int(0)];

#line 483
                    float _S3916 = _S3869 + totalWeight_11[int(1)];

#line 483
                    float _S3917 = _S3870 + totalWeight_11[int(2)];

#line 483
                    float _S3918 = _S3871 + s_diff_totalWeight_11[int(0)];

#line 483
                    float _S3919 = _S3872 + s_diff_totalWeight_11[int(1)];

#line 483
                    float _S3920 = _S3873 + s_diff_totalWeight_11[int(2)];

#line 1189
                    float3 _S3921 = _S3874 + totalWarpedPoint_11[int(0)];

#line 1189
                    float3 _S3922 = _S3875 + totalWarpedPoint_11[int(1)];

#line 1189
                    float3 _S3923 = _S3876 + totalWarpedPoint_11[int(2)];

#line 1189
                    float3 _S3924 = _S3877 + s_diff_totalWarpedPoint_11[int(0)];

#line 1189
                    float3 _S3925 = _S3878 + s_diff_totalWarpedPoint_11[int(1)];

#line 1189
                    float3 _S3926 = _S3879 + s_diff_totalWarpedPoint_11[int(2)];

#line 1189
                    _S3736 = 0.0;

#line 1189
                    _S3880 = 0.0;

#line 1189
                    _S3866 = _S3785;

#line 1189
                    _S3843[int(0)] = _S3915;

#line 1189
                    _S3843[int(1)] = _S3916;

#line 1189
                    _S3843[int(2)] = _S3917;

#line 1189
                    _S3844[int(0)] = _S3918;

#line 1189
                    _S3844[int(1)] = _S3919;

#line 1189
                    _S3844[int(2)] = _S3920;

#line 1189
                    _S3851[int(0)] = _S3921;

#line 1189
                    _S3851[int(1)] = _S3922;

#line 1189
                    _S3851[int(2)] = _S3923;

#line 1189
                    _S3852[int(0)] = _S3924;

#line 1189
                    _S3852[int(1)] = _S3925;

#line 1189
                    _S3852[int(2)] = _S3926;

#line 1189
                    _S3867 = _S3784;

#line 1189
                }

#line 1189
                DiffPair_float_0 _S3927 = { _S3880, _S3736 };

#line 1189
                IntersectionInfo_0 _S3928 = _S3798;

#line 1189
                DiffPair_IntersectionInfo_0 _S3929;

#line 1189
                _S3929.primal_0 = _S3798;

#line 1189
                _S3929.differential_0 = _S3623;

#line 1189
                DiffPair_float3_0 _S3930;

#line 1189
                _S3930.primal_0 = _S3617.primal_0.primal_0;

#line 1189
                _S3930.differential_0 = _S3615;

#line 1189
                float3 _S3931 = _S3724;

#line 1189
                DiffPair_float3_0 _S3932;

#line 1189
                _S3932.primal_0 = _S3724;

#line 1189
                _S3932.differential_0 = _S3615;

#line 1189
                float _S3933 = _S3735;

#line 1189
                DiffPair_float_0 _S3934;

#line 1189
                _S3934.primal_0 = _S3735;

#line 1189
                _S3934.differential_0 = 0.0;

#line 1189
                DiffPair_float_0 _S3935;

#line 1189
                _S3935.primal_0 = kappa_7;

#line 1189
                _S3935.differential_0 = 0.0;

#line 1189
                DiffPair_3 _S3936;

#line 1189
                _S3936.primal_0 = _S3793;

#line 1189
                _S3936.differential_0 = _S3636;

#line 1189
                s_bwd_fwd_computeHarmonicWeightMisuba_0(_S3929, _S3930, _S3932, _S3934, _S3935, _S3936, _S3927, _s_diff_ctx_26._S1048[_dc_1]);

#line 1189
                DiffPair_float_0 _S3937 = _S3934;

#line 1189
                float3 _S3938 = _S3936.differential_0.differential_0 + _S3711;

#line 1189
                float3 _S3939 = _S3936.differential_0.primal_0 + _S3712;

#line 1189
                float3 _S3940 = _S3930.differential_0 + _S3717;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3941 = IntersectionInfo_x24_syn_dadd_0(_S3929.differential_0, _S3866);

#line 1189
                float _S3942;

#line 1189
                float _S3943;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3944;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3945;

#line 1189
                if(_S3788)
                {

#line 1189
                    float3 _S3946 = _S3726 * _S3852[int(1)];

#line 1189
                    float3 _S3947 = _S3728 * _S3852[int(1)];

#line 1189
                    float3 _S3948 = _S3727 * _S3852[int(1)] + _S3726 * _S3851[int(1)];

#line 1189
                    float3 _S3949 = _S3725 * _S3852[int(1)] + _S3728 * _S3851[int(1)];

#line 483
                    float _S3950 = _S3843[int(0)] + totalWeight_10[int(0)];

#line 483
                    float _S3951 = _S3843[int(2)] + totalWeight_10[int(2)];

#line 483
                    float  _S3952[int(3)];

#line 483
                    _S3952[int(0)] = 0.0;

#line 483
                    _S3952[int(1)] = 0.0;

#line 483
                    _S3952[int(2)] = 0.0;

#line 483
                    _S3952[int(1)] = _S3843[int(1)];

#line 483
                    float _S3953 = _S3950 + _S3952[int(0)];

#line 483
                    float _S3954 = totalWeight_10[int(1)] + _S3952[int(1)];

#line 483
                    float _S3955 = _S3951 + _S3952[int(2)];

#line 483
                    float _S3956 = _S3949[int(0)] + _S3949[int(1)] + _S3949[int(2)] + _S3843[int(1)];

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3957 = _S3623;

#line 483
                    _S3957.posW_2 = _S3946;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3958 = IntersectionInfo_x24_syn_dadd_0(_S3867, _S3957);

#line 1189
                    float3 _S3959 = _S3851[int(0)] + totalWarpedPoint_10[int(0)];

#line 1189
                    float3 _S3960 = _S3851[int(2)] + totalWarpedPoint_10[int(2)];

#line 1189
                    float3  _S3961[int(3)];

#line 1189
                    _S3961[int(0)] = _S3615;

#line 1189
                    _S3961[int(1)] = _S3615;

#line 1189
                    _S3961[int(2)] = _S3615;

#line 1189
                    _S3961[int(1)] = _S3851[int(1)];

#line 1189
                    float3 _S3962 = _S3959 + _S3961[int(0)];

#line 1189
                    float3 _S3963 = totalWarpedPoint_10[int(1)] + _S3961[int(1)];

#line 1189
                    float3 _S3964 = _S3960 + _S3961[int(2)];

#line 1189
                    float3 _S3965 = _S3852[int(0)] + s_diff_totalWarpedPoint_10[int(0)];

#line 1189
                    float3 _S3966 = _S3852[int(2)] + s_diff_totalWarpedPoint_10[int(2)];

#line 1189
                    float3  _S3967[int(3)];

#line 1189
                    _S3967[int(0)] = _S3615;

#line 1189
                    _S3967[int(1)] = _S3615;

#line 1189
                    _S3967[int(2)] = _S3615;

#line 1189
                    _S3967[int(1)] = _S3852[int(1)];

#line 1189
                    float3 _S3968 = _S3965 + _S3967[int(0)];

#line 1189
                    float3 _S3969 = s_diff_totalWarpedPoint_10[int(1)] + _S3967[int(1)];

#line 1189
                    float3 _S3970 = _S3966 + _S3967[int(2)];

#line 483
                    float _S3971 = _S3947[int(0)] + _S3947[int(1)] + _S3947[int(2)] + _S3844[int(1)];

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3972 = _S3623;

#line 483
                    _S3972.posW_2 = _S3948;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S3973 = IntersectionInfo_x24_syn_dadd_0(_S3941, _S3972);

#line 483
                    float _S3974 = _S3844[int(0)] + s_diff_totalWeight_10[int(0)];

#line 483
                    float _S3975 = _S3844[int(2)] + s_diff_totalWeight_10[int(2)];

#line 483
                    float  _S3976[int(3)];

#line 483
                    _S3976[int(0)] = 0.0;

#line 483
                    _S3976[int(1)] = 0.0;

#line 483
                    _S3976[int(2)] = 0.0;

#line 483
                    _S3976[int(1)] = _S3844[int(1)];

#line 483
                    float _S3977 = _S3974 + _S3976[int(0)];

#line 483
                    float _S3978 = s_diff_totalWeight_10[int(1)] + _S3976[int(1)];

#line 483
                    float _S3979 = _S3975 + _S3976[int(2)];

#line 483
                    _S3942 = _S3971;

#line 483
                    _S3943 = _S3956;

#line 483
                    _S3944 = _S3973;

#line 483
                    _S3845[int(0)] = _S3953;

#line 483
                    _S3845[int(1)] = _S3954;

#line 483
                    _S3845[int(2)] = _S3955;

#line 483
                    _S3846[int(0)] = _S3977;

#line 483
                    _S3846[int(1)] = _S3978;

#line 483
                    _S3846[int(2)] = _S3979;

#line 483
                    _S3853[int(0)] = _S3962;

#line 483
                    _S3853[int(1)] = _S3963;

#line 483
                    _S3853[int(2)] = _S3964;

#line 483
                    _S3854[int(0)] = _S3968;

#line 483
                    _S3854[int(1)] = _S3969;

#line 483
                    _S3854[int(2)] = _S3970;

#line 483
                    _S3945 = _S3958;

#line 483
                }
                else
                {

#line 483
                    float _S3980 = _S3843[int(0)] + totalWeight_10[int(0)];

#line 483
                    float _S3981 = _S3843[int(1)] + totalWeight_10[int(1)];

#line 483
                    float _S3982 = _S3843[int(2)] + totalWeight_10[int(2)];

#line 483
                    float _S3983 = _S3844[int(0)] + s_diff_totalWeight_10[int(0)];

#line 483
                    float _S3984 = _S3844[int(1)] + s_diff_totalWeight_10[int(1)];

#line 483
                    float _S3985 = _S3844[int(2)] + s_diff_totalWeight_10[int(2)];

#line 1189
                    float3 _S3986 = _S3851[int(0)] + totalWarpedPoint_10[int(0)];

#line 1189
                    float3 _S3987 = _S3851[int(1)] + totalWarpedPoint_10[int(1)];

#line 1189
                    float3 _S3988 = _S3851[int(2)] + totalWarpedPoint_10[int(2)];

#line 1189
                    float3 _S3989 = _S3852[int(0)] + s_diff_totalWarpedPoint_10[int(0)];

#line 1189
                    float3 _S3990 = _S3852[int(1)] + s_diff_totalWarpedPoint_10[int(1)];

#line 1189
                    float3 _S3991 = _S3852[int(2)] + s_diff_totalWarpedPoint_10[int(2)];

#line 1189
                    _S3942 = 0.0;

#line 1189
                    _S3943 = 0.0;

#line 1189
                    _S3944 = _S3941;

#line 1189
                    _S3845[int(0)] = _S3980;

#line 1189
                    _S3845[int(1)] = _S3981;

#line 1189
                    _S3845[int(2)] = _S3982;

#line 1189
                    _S3846[int(0)] = _S3983;

#line 1189
                    _S3846[int(1)] = _S3984;

#line 1189
                    _S3846[int(2)] = _S3985;

#line 1189
                    _S3853[int(0)] = _S3986;

#line 1189
                    _S3853[int(1)] = _S3987;

#line 1189
                    _S3853[int(2)] = _S3988;

#line 1189
                    _S3854[int(0)] = _S3989;

#line 1189
                    _S3854[int(1)] = _S3990;

#line 1189
                    _S3854[int(2)] = _S3991;

#line 1189
                    _S3945 = _S3867;

#line 1189
                }

#line 1189
                DiffPair_float_0 _S3992 = { _S3943, _S3942 };

#line 1189
                DiffPair_IntersectionInfo_0 _S3993;

#line 1189
                _S3993.primal_0 = _S3928;

#line 1189
                _S3993.differential_0 = _S3623;

#line 1189
                DiffPair_float3_0 _S3994;

#line 1189
                _S3994.primal_0 = _S3617.primal_0.primal_0;

#line 1189
                _S3994.differential_0 = _S3615;

#line 1189
                DiffPair_float3_0 _S3995;

#line 1189
                _S3995.primal_0 = _S3931;

#line 1189
                _S3995.differential_0 = _S3615;

#line 1189
                DiffPair_float_0 _S3996;

#line 1189
                _S3996.primal_0 = _S3933;

#line 1189
                _S3996.differential_0 = 0.0;

#line 1189
                DiffPair_float_0 _S3997;

#line 1189
                _S3997.primal_0 = kappa_7;

#line 1189
                _S3997.differential_0 = 0.0;

#line 1189
                DiffPair_3 _S3998;

#line 1189
                _S3998.primal_0 = _S3794;

#line 1189
                _S3998.differential_0 = _S3636;

#line 1189
                s_bwd_fwd_computeHarmonicWeightMisuba_0(_S3993, _S3994, _S3995, _S3996, _S3997, _S3998, _S3992, _s_diff_ctx_26._S1050[_dc_1]);

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S3999 = IntersectionInfo_x24_syn_dadd_0(_S3993.differential_0, _S3944);

#line 1189
                float3 _S4000 = _S3998.differential_0.primal_0 + _S3714;

#line 483
                float _S4001 = _S3996.differential_0 + _S3937.differential_0;

#line 1189
                float3 _S4002 = _S3998.differential_0.differential_0 + _S3713;

#line 1189
                float3 _S4003 = _S3994.differential_0 + _S3940;

#line 1189
                float _S4004;

#line 1189
                float _S4005;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S4006;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S4007;

#line 1189
                if(_S3789)
                {

#line 1189
                    float3 _S4008 = _S3730 * _S3854[int(0)];

#line 1189
                    float3 _S4009 = _S3792 * _S3854[int(0)];

#line 1189
                    float3 _S4010 = _S3791 * _S3854[int(0)] + _S3730 * _S3853[int(0)];

#line 1189
                    float3 _S4011 = _S3729 * _S3854[int(0)] + _S3792 * _S3853[int(0)];

#line 483
                    float _S4012 = _S4011[int(0)] + _S4011[int(1)] + _S4011[int(2)] + _S3845[int(0)];

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S4013 = _S3623;

#line 483
                    _S4013.posW_2 = _S4008;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S4014 = IntersectionInfo_x24_syn_dadd_0(_S3945, _S4013);

#line 483
                    float _S4015 = _S4009[int(0)] + _S4009[int(1)] + _S4009[int(2)] + _S3846[int(0)];

#line 483
                    float3  _S4016[int(3)];

#line 483
                    _S4016[int(0)] = _S3615;

#line 483
                    _S4016[int(1)] = _S3615;

#line 483
                    _S4016[int(2)] = _S3615;

#line 483
                    _S4016[int(0)] = _S3854[int(0)];

#line 1189
                    float3 _S4017 = _S3854[int(1)] + _S4016[int(1)];

#line 1189
                    float3 _S4018 = _S3854[int(2)] + _S4016[int(2)];

#line 1189
                    float3  _S4019[int(3)];

#line 1189
                    _S4019[int(0)] = _S3615;

#line 1189
                    _S4019[int(1)] = _S3615;

#line 1189
                    _S4019[int(2)] = _S3615;

#line 1189
                    _S4019[int(0)] = _S3853[int(0)];

#line 1189
                    float3 _S4020 = _S3853[int(1)] + _S4019[int(1)];

#line 1189
                    float3 _S4021 = _S3853[int(2)] + _S4019[int(2)];

#line 1189
                    float  _S4022[int(3)];

#line 1189
                    _S4022[int(0)] = 0.0;

#line 1189
                    _S4022[int(1)] = 0.0;

#line 1189
                    _S4022[int(2)] = 0.0;

#line 1189
                    _S4022[int(0)] = _S3846[int(0)];

#line 483
                    float _S4023 = _S3846[int(1)] + _S4022[int(1)];

#line 483
                    float _S4024 = _S3846[int(2)] + _S4022[int(2)];

#line 483
                    float  _S4025[int(3)];

#line 483
                    _S4025[int(0)] = 0.0;

#line 483
                    _S4025[int(1)] = 0.0;

#line 483
                    _S4025[int(2)] = 0.0;

#line 483
                    _S4025[int(0)] = _S3845[int(0)];

#line 483
                    float _S4026 = _S3845[int(1)] + _S4025[int(1)];

#line 483
                    float _S4027 = _S3845[int(2)] + _S4025[int(2)];

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S4028 = _S3623;

#line 483
                    _S4028.posW_2 = _S4010;

#line 483
                    s_diff_s_diff_IntersectionInfo_0 _S4029 = IntersectionInfo_x24_syn_dadd_0(_S3999, _S4028);

#line 483
                    _S4004 = _S4015;

#line 483
                    _S4005 = _S4012;

#line 483
                    _S4006 = _S4029;

#line 483
                    _S4007 = _S4014;

#line 483
                    _S3847[int(0)] = _S4025[int(0)];

#line 483
                    _S3847[int(1)] = _S4026;

#line 483
                    _S3847[int(2)] = _S4027;

#line 483
                    _S3848[int(0)] = _S4022[int(0)];

#line 483
                    _S3848[int(1)] = _S4023;

#line 483
                    _S3848[int(2)] = _S4024;

#line 483
                    _S3855[int(0)] = _S4019[int(0)];

#line 483
                    _S3855[int(1)] = _S4020;

#line 483
                    _S3855[int(2)] = _S4021;

#line 483
                    _S3856[int(0)] = _S4016[int(0)];

#line 483
                    _S3856[int(1)] = _S4017;

#line 483
                    _S3856[int(2)] = _S4018;

#line 483
                }
                else
                {

#line 483
                    _S4004 = 0.0;

#line 483
                    _S4005 = 0.0;

#line 483
                    _S4006 = _S3999;

#line 483
                    _S4007 = _S3945;

#line 483
                    _S3847[int(0)] = _S3845[int(0)];

#line 483
                    _S3847[int(1)] = _S3845[int(1)];

#line 483
                    _S3847[int(2)] = _S3845[int(2)];

#line 483
                    _S3848[int(0)] = _S3846[int(0)];

#line 483
                    _S3848[int(1)] = _S3846[int(1)];

#line 483
                    _S3848[int(2)] = _S3846[int(2)];

#line 483
                    _S3855[int(0)] = _S3853[int(0)];

#line 483
                    _S3855[int(1)] = _S3853[int(1)];

#line 483
                    _S3855[int(2)] = _S3853[int(2)];

#line 483
                    _S3856[int(0)] = _S3854[int(0)];

#line 483
                    _S3856[int(1)] = _S3854[int(1)];

#line 483
                    _S3856[int(2)] = _S3854[int(2)];

#line 483
                }

#line 483
                DiffPair_float_0 _S4030 = { _S4005, _S4004 };

#line 483
                DiffPair_IntersectionInfo_0 _S4031;

#line 483
                _S4031.primal_0 = _S3928;

#line 483
                _S4031.differential_0 = _S3623;

#line 483
                DiffPair_float3_0 _S4032;

#line 483
                _S4032.primal_0 = _S3617.primal_0.primal_0;

#line 483
                _S4032.differential_0 = _S3615;

#line 483
                DiffPair_float3_0 _S4033;

#line 483
                _S4033.primal_0 = _S3931;

#line 483
                _S4033.differential_0 = _S3615;

#line 483
                DiffPair_float_0 _S4034;

#line 483
                _S4034.primal_0 = _S3933;

#line 483
                _S4034.differential_0 = 0.0;

#line 483
                DiffPair_float_0 _S4035;

#line 483
                _S4035.primal_0 = kappa_7;

#line 483
                _S4035.differential_0 = 0.0;

#line 483
                DiffPair_3 _S4036;

#line 483
                _S4036.primal_0 = _S3795;

#line 483
                _S4036.differential_0 = _S3636;

#line 483
                s_bwd_fwd_computeHarmonicWeightMisuba_0(_S4031, _S4032, _S4033, _S4034, _S4035, _S4036, _S4030, _s_diff_ctx_26._S1052[_dc_1]);

#line 483
                float _S4037 = _S4034.differential_0 + _S4001;

#line 1189
                float3 _S4038 = _S4036.differential_0.primal_0 + _S3716;

#line 1189
                float3 _S4039 = _S4036.differential_0.differential_0 + _S3715;

#line 1189
                float3 _S4040 = _S4032.differential_0 + _S4003;

#line 1189
                s_diff_s_diff_IntersectionInfo_0 _S4041 = IntersectionInfo_x24_syn_dadd_0(_S4031.differential_0, _S4006);

#line 1189
                _S3866 = _S4007;

#line 1189
                _S3867 = _S4041;

#line 1189
                _S3859 = _S4040;

#line 1189
                _S3736 = _S4037;

#line 1189
                _S3843 = _S3847;

#line 1189
                _S3844 = _S3848;

#line 1189
                _S3851 = _S3855;

#line 1189
                _S3852 = _S3856;

#line 1189
                _S3860 = _S3938;

#line 1189
                _S3861 = _S3939;

#line 1189
                _S3862 = _S4002;

#line 1189
                _S3863 = _S4000;

#line 1189
                _S3864 = _S4039;

#line 1189
                _S3865 = _S4038;

#line 1189
                _S3845[int(0)] = 0.0;

#line 1189
                _S3845[int(1)] = 0.0;

#line 1189
                _S3845[int(2)] = 0.0;

#line 1189
                _S3846[int(0)] = 0.0;

#line 1189
                _S3846[int(1)] = 0.0;

#line 1189
                _S3846[int(2)] = 0.0;

#line 1189
                _S3853[int(0)] = _S3615;

#line 1189
                _S3853[int(1)] = _S3615;

#line 1189
                _S3853[int(2)] = _S3615;

#line 1189
                _S3854[int(0)] = _S3615;

#line 1189
                _S3854[int(1)] = _S3615;

#line 1189
                _S3854[int(2)] = _S3615;

#line 1189
                _S3847[int(0)] = 0.0;

#line 1189
                _S3847[int(1)] = 0.0;

#line 1189
                _S3847[int(2)] = 0.0;

#line 1189
                _S3848[int(0)] = 0.0;

#line 1189
                _S3848[int(1)] = 0.0;

#line 1189
                _S3848[int(2)] = 0.0;

#line 1189
                _S3855[int(0)] = _S3615;

#line 1189
                _S3855[int(1)] = _S3615;

#line 1189
                _S3855[int(2)] = _S3615;

#line 1189
                _S3856[int(0)] = _S3615;

#line 1189
                _S3856[int(1)] = _S3615;

#line 1189
                _S3856[int(2)] = _S3615;

#line 1189
                _S3849[int(0)] = 0.0;

#line 1189
                _S3849[int(1)] = 0.0;

#line 1189
                _S3849[int(2)] = 0.0;

#line 1189
                _S3850[int(0)] = 0.0;

#line 1189
                _S3850[int(1)] = 0.0;

#line 1189
                _S3850[int(2)] = 0.0;

#line 1189
                _S3857[int(0)] = _S3615;

#line 1189
                _S3857[int(1)] = _S3615;

#line 1189
                _S3857[int(2)] = _S3615;

#line 1189
                _S3858[int(0)] = _S3615;

#line 1189
                _S3858[int(1)] = _S3615;

#line 1189
                _S3858[int(2)] = _S3615;

#line 1189
            }
            else
            {

#line 1189
                _S3866 = _S3784;

#line 1189
                _S3867 = _S3785;

#line 1189
                _S3859 = _S3717;

#line 1189
                _S3736 = 0.0;

#line 1189
                _S3843[int(0)] = _S3831[int(0)];

#line 1189
                _S3843[int(1)] = _S3832[int(1)];

#line 1189
                _S3843[int(2)] = _S3833[int(2)];

#line 1189
                _S3844[int(0)] = _S3834[int(0)];

#line 1189
                _S3844[int(1)] = _S3835[int(1)];

#line 1189
                _S3844[int(2)] = _S3836[int(2)];

#line 1189
                _S3851[int(0)] = _S3837[int(0)];

#line 1189
                _S3851[int(1)] = _S3838[int(1)];

#line 1189
                _S3851[int(2)] = _S3839[int(2)];

#line 1189
                _S3852[int(0)] = _S3840[int(0)];

#line 1189
                _S3852[int(1)] = _S3841[int(1)];

#line 1189
                _S3852[int(2)] = _S3842[int(2)];

#line 1189
                _S3860 = _S3711;

#line 1189
                _S3861 = _S3712;

#line 1189
                _S3862 = _S3713;

#line 1189
                _S3863 = _S3714;

#line 1189
                _S3864 = _S3715;

#line 1189
                _S3865 = _S3716;

#line 1189
                _S3845 = totalWeight_12;

#line 1189
                _S3846 = s_diff_totalWeight_12;

#line 1189
                _S3853 = totalWarpedPoint_12;

#line 1189
                _S3854 = s_diff_totalWarpedPoint_12;

#line 1189
                _S3847 = totalWeight_11;

#line 1189
                _S3848 = s_diff_totalWeight_11;

#line 1189
                _S3855 = totalWarpedPoint_11;

#line 1189
                _S3856 = s_diff_totalWarpedPoint_11;

#line 1189
                _S3849 = totalWeight_10;

#line 1189
                _S3850 = s_diff_totalWeight_10;

#line 1189
                _S3857 = totalWarpedPoint_10;

#line 1189
                _S3858 = s_diff_totalWarpedPoint_10;

#line 1189
            }

#line 1189
            DiffPair_s_diff_s_diff_IntersectionInfo_0 _S4042 = { IntersectionInfo_x24_syn_dadd_0(_S3623, IntersectionInfo_x24_syn_dadd_0(_S3623, _S3867)), IntersectionInfo_x24_syn_dadd_0(_S3623, IntersectionInfo_x24_syn_dadd_0(_S3866, _S3623)) };

#line 1189
            DiffPair_0 _S4043;

#line 1189
            _S4043.primal_0 = _S3799;

#line 1189
            _S4043.differential_0 = _S3642;

#line 1189
            DiffPair_6 _S4044;

#line 1189
            _S4044.primal_0 = _S3800;

#line 1189
            _S4044.differential_0 = _S3643;

#line 1189
            s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4043, _S4044, _S4042, int(1), _S3614);

#line 1189
            DiffPair_s_diff_s_diff_DiffRay_0 _S4045 = { DiffRay_x24_syn_dadd_0(_S3627, _S4044.differential_0.primal_0), DiffRay_x24_syn_dadd_0(_S4044.differential_0.differential_0, _S3627) };

#line 1189
            DiffPair_3 _S4046;

#line 1189
            _S4046.primal_0 = _S3796;

#line 1189
            _S4046.differential_0 = _S3636;

#line 1189
            DiffPair_3 _S4047;

#line 1189
            _S4047.primal_0 = _S3797;

#line 1189
            _S4047.differential_0 = _S3636;

#line 1189
            s_bwd_s_fwd_DiffRay_x24init_0(_S4046, _S4047, globalPixel_11, _S4045);

#line 1189
            s_diff_s_diff_DifferentiableSceneQuery_0 _S4048 = DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S4043.differential_0.differential_0, _S3783);

#line 1189
            float3 _S4049 = _S4046.differential_0.differential_0 + _S3718;

#line 1189
            s_diff_s_diff_DifferentiableSceneQuery_0 _S4050 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4043.differential_0.primal_0, _S3782);

#line 1189
            float3 _S4051 = _S4047.differential_0.differential_0 + _S3720;

#line 1189
            float3 _S4052 = _S4046.differential_0.primal_0 + _S3859;

#line 483
            float _S4053 = _S3628[int(1)] + _S3736;

#line 483
            float  _S4054[int(16)];

#line 483
            _S4054[int(0)] = 0.0;

#line 483
            _S4054[int(1)] = 0.0;

#line 483
            _S4054[int(2)] = 0.0;

#line 483
            _S4054[int(3)] = 0.0;

#line 483
            _S4054[int(4)] = 0.0;

#line 483
            _S4054[int(5)] = 0.0;

#line 483
            _S4054[int(6)] = 0.0;

#line 483
            _S4054[int(7)] = 0.0;

#line 483
            _S4054[int(8)] = 0.0;

#line 483
            _S4054[int(9)] = 0.0;

#line 483
            _S4054[int(10)] = 0.0;

#line 483
            _S4054[int(11)] = 0.0;

#line 483
            _S4054[int(12)] = 0.0;

#line 483
            _S4054[int(13)] = 0.0;

#line 483
            _S4054[int(14)] = 0.0;

#line 483
            _S4054[int(15)] = 0.0;

#line 483
            _S4054[i_7] = _S4053;

#line 483
            _S4054[_S3790] = _S3628[int(0)];

#line 483
            float _S4055 = rnd_3[int(0)] + _S4054[int(0)];

#line 483
            float _S4056 = rnd_3[int(1)] + _S4054[int(1)];

#line 483
            float _S4057 = rnd_3[int(2)] + _S4054[int(2)];

#line 483
            float _S4058 = rnd_3[int(3)] + _S4054[int(3)];

#line 483
            float _S4059 = rnd_3[int(4)] + _S4054[int(4)];

#line 483
            float _S4060 = rnd_3[int(5)] + _S4054[int(5)];

#line 483
            float _S4061 = rnd_3[int(6)] + _S4054[int(6)];

#line 483
            float _S4062 = rnd_3[int(7)] + _S4054[int(7)];

#line 483
            float _S4063 = rnd_3[int(8)] + _S4054[int(8)];

#line 483
            float _S4064 = rnd_3[int(9)] + _S4054[int(9)];

#line 483
            float _S4065 = rnd_3[int(10)] + _S4054[int(10)];

#line 483
            float _S4066 = rnd_3[int(11)] + _S4054[int(11)];

#line 483
            float _S4067 = rnd_3[int(12)] + _S4054[int(12)];

#line 483
            float _S4068 = rnd_3[int(13)] + _S4054[int(13)];

#line 483
            float _S4069 = rnd_3[int(14)] + _S4054[int(14)];

#line 483
            float _S4070 = rnd_3[int(15)] + _S4054[int(15)];

#line 483
            totalWeight_13 = _S3843;

#line 483
            s_diff_totalWeight_13 = _S3844;

#line 483
            totalWarpedPoint_13 = _S3851;

#line 483
            s_diff_totalWarpedPoint_13 = _S3852;

#line 483
            _S3711 = _S3860;

#line 483
            _S3712 = _S3861;

#line 483
            _S3713 = _S3862;

#line 483
            _S3714 = _S3863;

#line 483
            _S3715 = _S3864;

#line 483
            _S3716 = _S3865;

#line 483
            _S3717 = _S4052;

#line 483
            _S3718 = _S4049;

#line 483
            _S3782 = _S4050;

#line 483
            _S3783 = _S4048;

#line 483
            totalWeight_12 = _S3845;

#line 483
            s_diff_totalWeight_12 = _S3846;

#line 483
            totalWarpedPoint_12 = _S3853;

#line 483
            s_diff_totalWarpedPoint_12 = _S3854;

#line 483
            totalWeight_11 = _S3847;

#line 483
            s_diff_totalWeight_11 = _S3848;

#line 483
            totalWarpedPoint_11 = _S3855;

#line 483
            s_diff_totalWarpedPoint_11 = _S3856;

#line 483
            _S3784 = _S3623;

#line 483
            _S3785 = _S3623;

#line 483
            _S3719 = _S3615;

#line 483
            totalWeight_10 = _S3849;

#line 483
            s_diff_totalWeight_10 = _S3850;

#line 483
            totalWarpedPoint_10 = _S3857;

#line 483
            s_diff_totalWarpedPoint_10 = _S3858;

#line 483
            _S3720 = _S4051;

#line 483
            rnd_3[int(0)] = _S4055;

#line 483
            rnd_3[int(1)] = _S4056;

#line 483
            rnd_3[int(2)] = _S4057;

#line 483
            rnd_3[int(3)] = _S4058;

#line 483
            rnd_3[int(4)] = _S4059;

#line 483
            rnd_3[int(5)] = _S4060;

#line 483
            rnd_3[int(6)] = _S4061;

#line 483
            rnd_3[int(7)] = _S4062;

#line 483
            rnd_3[int(8)] = _S4063;

#line 483
            rnd_3[int(9)] = _S4064;

#line 483
            rnd_3[int(10)] = _S4065;

#line 483
            rnd_3[int(11)] = _S4066;

#line 483
            rnd_3[int(12)] = _S4067;

#line 483
            rnd_3[int(13)] = _S4068;

#line 483
            rnd_3[int(14)] = _S4069;

#line 483
            rnd_3[int(15)] = _S4070;

#line 483
        }
        else
        {

#line 483
            totalWeight_13[int(0)] = _S3831[int(0)];

#line 483
            totalWeight_13[int(1)] = _S3832[int(1)];

#line 483
            totalWeight_13[int(2)] = _S3833[int(2)];

#line 483
            s_diff_totalWeight_13[int(0)] = _S3834[int(0)];

#line 483
            s_diff_totalWeight_13[int(1)] = _S3835[int(1)];

#line 483
            s_diff_totalWeight_13[int(2)] = _S3836[int(2)];

#line 483
            totalWarpedPoint_13[int(0)] = _S3837[int(0)];

#line 483
            totalWarpedPoint_13[int(1)] = _S3838[int(1)];

#line 483
            totalWarpedPoint_13[int(2)] = _S3839[int(2)];

#line 483
            s_diff_totalWarpedPoint_13[int(0)] = _S3840[int(0)];

#line 483
            s_diff_totalWarpedPoint_13[int(1)] = _S3841[int(1)];

#line 483
            s_diff_totalWarpedPoint_13[int(2)] = _S3842[int(2)];

#line 483
        }

#line 483
        _dc_1 = _dc_1 - int(1);

#line 483
    }

#line 483
    float3  _S4071[int(3)];

#line 483
    _S4071[int(0)] = _S3615;

#line 483
    _S4071[int(1)] = _S3615;

#line 483
    _S4071[int(2)] = _S3615;

#line 483
    _S4071[int(2)] = _S3712;

#line 483
    _S4071[int(1)] = _S3714;

#line 483
    _S4071[int(0)] = _S3716;

#line 483
    float3  _S4072[int(3)];

#line 483
    _S4072[int(0)] = _S3615;

#line 483
    _S4072[int(1)] = _S3615;

#line 483
    _S4072[int(2)] = _S3615;

#line 483
    _S4072[int(2)] = _S3711;

#line 483
    _S4072[int(1)] = _S3713;

#line 483
    _S4072[int(0)] = _S3715;

#line 483
    float3  _S4073[int(3)] = { _S4071[int(0)], _S4071[int(1)], _S4071[int(2)] };

#line 483
    float3  _S4074[int(3)] = { _S4072[int(0)], _S4072[int(1)], _S4072[int(2)] };

#line 483
    DiffPair_array_float3_0 _S4075 = { _S4073, _S4074 };

#line 483
    dpdpdirection_12.primal_0 = dpdpdirection_12.primal_0;

#line 483
    dpdpdirection_12.differential_0 = _S4075;

#line 483
    DiffPair_float3_0 _S4076 = { _S3717, _S3718 };

#line 483
    dpdporigin_10.primal_0 = dpdporigin_10.primal_0;

#line 483
    dpdporigin_10.differential_0 = _S4076;

#line 483
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S4077 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S3782, _S3622), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S3622, _S3783) };

#line 483
    dpdpquery_6.primal_0 = dpdpquery_6.primal_0;

#line 483
    dpdpquery_6.differential_0 = _S4077;

#line 483
    return;
}


#line 483
void s_bwd_s_fwd_computeWarpedRay_0(inout DiffPair_0 dpdpquery_7, float kappa_8, uint2 globalPixel_12, inout DiffPair_3 dpdporigin_11, inout DiffPair_3 dpdpbaseDirection_1, inout DiffPair_8 dpdpdirection_13, DiffPair_array_float3_0 dpdpwarpedDirection_1, UniformSampleGenerator_0 sg_33, s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _s_diff_ctx_27)
{

#line 515 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-ReparameterizeRay.slang"
    DiffPair_3 _S4078 = dpdporigin_11;

#line 515
    DiffPair_3 _S4079 = dpdpbaseDirection_1;

#line 515
    float3 _S4080 = (float3)0.0;

#line 515
    DiffPair_DifferentiableSceneQuery_0 _S4081 = { dpdpquery_7.primal_0.primal_0, dpdpquery_7.primal_0.differential_0 };

#line 515
    DiffPair_float3_0 _S4082 = { dpdporigin_11.primal_0.primal_0, dpdporigin_11.primal_0.differential_0 };

#line 515
    DiffPair_array_float3_0 _S4083 = { dpdpdirection_13.primal_0.primal_0, dpdpdirection_13.primal_0.differential_0 };

#line 515
    DiffPair_float3_0 _S4084 = { _S4080, _S4080 };

#line 515
    DiffPair_float3_0 _S4085;

#line 515
    DiffPair_float3_0 _S4086;

#line 515
    DiffPair_float3_0 _S4087;

#line 515
    if(_s_diff_ctx_27._S1067)
    {

#line 515
        float3 _S4088 = _s_diff_ctx_27._S1065.primal_0[int(0)] - _S4078.primal_0.primal_0;

#line 515
        float3 _S4089 = _s_diff_ctx_27._S1065.differential_0[int(0)] - _S4078.primal_0.differential_0;

#line 515
        float3 _S4090 = _s_diff_ctx_27._S1065.primal_0[int(1)] - _S4078.primal_0.primal_0;

#line 515
        float3 _S4091 = _s_diff_ctx_27._S1065.differential_0[int(1)] - _S4078.primal_0.differential_0;

#line 515
        float3 _S4092 = _s_diff_ctx_27._S1065.differential_0[int(2)] - _S4078.primal_0.differential_0;

#line 515
        _S4085.primal_0 = _s_diff_ctx_27._S1065.primal_0[int(2)] - _S4078.primal_0.primal_0;

#line 515
        _S4085.differential_0 = _S4092;

#line 515
        _S4086.primal_0 = _S4090;

#line 515
        _S4086.differential_0 = _S4091;

#line 515
        _S4087.primal_0 = _S4088;

#line 515
        _S4087.differential_0 = _S4089;

#line 515
    }
    else
    {

#line 515
        _S4085.primal_0 = _S4080;

#line 515
        _S4085.differential_0 = _S4080;

#line 515
        _S4086.primal_0 = _S4080;

#line 515
        _S4086.differential_0 = _S4080;

#line 515
        _S4087.primal_0 = _S4080;

#line 515
        _S4087.differential_0 = _S4080;

#line 515
    }

#line 515
    float3  _S4093[int(3)] = { _S4080, _S4080, _S4080 };

#line 515
    DiffPair_array_float3_0 _S4094 = { _S4093, _S4093 };

#line 515
    float3  _S4095[int(3)];

#line 515
    float3  _S4096[int(3)];

#line 515
    float3 _S4097;

#line 515
    float3 _S4098;

#line 515
    if(_s_diff_ctx_27._S1067)
    {

#line 515
        DiffPair_float3_0 _S4099 = { dpdpwarpedDirection_1.primal_0[int(2)], dpdpwarpedDirection_1.differential_0[int(2)] };

#line 515
        DiffPair_3 _S4100;

#line 515
        _S4100.primal_0 = _S4085;

#line 515
        _S4100.differential_0 = _S4084;

#line 515
        s_bwd_s_fwd_safeNormalize_0(_S4100, _S4099);

#line 515
        float3 _S4101 = - _S4100.differential_0.differential_0;

#line 515
        float3 _S4102 = - _S4100.differential_0.primal_0;

#line 515
        DiffPair_float3_0 _S4103 = { dpdpwarpedDirection_1.primal_0[int(1)], dpdpwarpedDirection_1.differential_0[int(1)] };

#line 515
        DiffPair_3 _S4104;

#line 515
        _S4104.primal_0 = _S4086;

#line 515
        _S4104.differential_0 = _S4084;

#line 515
        s_bwd_s_fwd_safeNormalize_0(_S4104, _S4103);

#line 515
        float3 _S4105 = - _S4104.differential_0.differential_0;

#line 515
        float3 _S4106 = - _S4104.differential_0.primal_0;

#line 515
        DiffPair_float3_0 _S4107 = { dpdpwarpedDirection_1.primal_0[int(0)], dpdpwarpedDirection_1.differential_0[int(0)] };

#line 515
        DiffPair_3 _S4108;

#line 515
        _S4108.primal_0 = _S4087;

#line 515
        _S4108.differential_0 = _S4084;

#line 515
        s_bwd_s_fwd_safeNormalize_0(_S4108, _S4107);

#line 515
        float3 _S4109 = - _S4108.differential_0.primal_0;

#line 1189 "core.meta.slang"
        float3 _S4110 = _S4101 + _S4105 + - _S4108.differential_0.differential_0;

#line 1189
        float3  _S4111[int(3)];

#line 1189
        _S4111[int(0)] = _S4080;

#line 1189
        _S4111[int(1)] = _S4080;

#line 1189
        _S4111[int(2)] = _S4080;

#line 1189
        _S4111[int(2)] = _S4100.differential_0.primal_0;

#line 1189
        _S4111[int(1)] = _S4104.differential_0.primal_0;

#line 1189
        _S4111[int(0)] = _S4108.differential_0.primal_0;

#line 1189
        float3 _S4112 = _S4102 + _S4106 + _S4109;

#line 1189
        float3  _S4113[int(3)];

#line 1189
        _S4113[int(0)] = _S4080;

#line 1189
        _S4113[int(1)] = _S4080;

#line 1189
        _S4113[int(2)] = _S4080;

#line 1189
        _S4113[int(2)] = _S4100.differential_0.differential_0;

#line 1189
        _S4113[int(1)] = _S4104.differential_0.differential_0;

#line 1189
        _S4113[int(0)] = _S4108.differential_0.differential_0;

#line 1189
        _S4095[int(0)] = _S4113[int(0)];

#line 1189
        _S4095[int(1)] = _S4113[int(1)];

#line 1189
        _S4095[int(2)] = _S4113[int(2)];

#line 1189
        _S4096[int(0)] = _S4111[int(0)];

#line 1189
        _S4096[int(1)] = _S4111[int(1)];

#line 1189
        _S4096[int(2)] = _S4111[int(2)];

#line 1189
        _S4097 = _S4112;

#line 1189
        _S4098 = _S4110;

#line 1189
    }
    else
    {

#line 1189
        _S4095[int(0)] = _S4080;

#line 1189
        _S4095[int(1)] = _S4080;

#line 1189
        _S4095[int(2)] = _S4080;

#line 1189
        _S4096[int(0)] = _S4080;

#line 1189
        _S4096[int(1)] = _S4080;

#line 1189
        _S4096[int(2)] = _S4080;

#line 1189
        _S4097 = _S4080;

#line 1189
        _S4098 = _S4080;

#line 1189
    }

#line 1189
    float3  _S4114[int(3)] = { _S4096[int(0)], _S4096[int(1)], _S4096[int(2)] };

#line 1189
    float3  _S4115[int(3)] = { _S4095[int(0)], _S4095[int(1)], _S4095[int(2)] };

#line 1189
    DiffPair_array_float3_0 _S4116 = { _S4114, _S4115 };

#line 208 "core"
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4117 = DifferentiableSceneQuery_Differential_x24_syn_dzero_0();

#line 208
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S4118 = { DifferentiableSceneQuery_x24_syn_dzero_0(), _S4117 };

#line 208
    DiffPair_0 _S4119;

#line 208
    _S4119.primal_0 = _S4081;

#line 208
    _S4119.differential_0 = _S4118;

#line 208
    DiffPair_3 _S4120;

#line 208
    _S4120.primal_0 = _S4082;

#line 208
    _S4120.differential_0 = _S4084;

#line 208
    DiffPair_8 _S4121;

#line 208
    _S4121.primal_0 = _S4083;

#line 208
    _S4121.differential_0 = _S4094;

#line 208
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_1(_S4119, kappa_8, globalPixel_12, _S4079.primal_0.primal_0, _S4120, _S4121, _S4116, _s_diff_ctx_27._S1066, _s_diff_ctx_27._S1064);

#line 1189 "core.meta.slang"
    float3 _S4122 = _S4120.differential_0.primal_0 + _S4097;

#line 1189
    float3 _S4123 = _S4120.differential_0.differential_0 + _S4098;

#line 1189
    float3  _S4124[int(3)] = { _S4121.differential_0.primal_0[int(0)], _S4121.differential_0.primal_0[int(1)], _S4121.differential_0.primal_0[int(2)] };

#line 1189
    float3  _S4125[int(3)] = { _S4121.differential_0.differential_0[int(0)], _S4121.differential_0.differential_0[int(1)], _S4121.differential_0.differential_0[int(2)] };

#line 1189
    DiffPair_array_float3_0 _S4126 = { _S4124, _S4125 };

#line 1189
    dpdpdirection_13.primal_0 = dpdpdirection_13.primal_0;

#line 1189
    dpdpdirection_13.differential_0 = _S4126;

#line 1189
    dpdpbaseDirection_1.primal_0 = dpdpbaseDirection_1.primal_0;

#line 1189
    dpdpbaseDirection_1.differential_0 = _S4084;

#line 1189
    DiffPair_float3_0 _S4127 = { _S4122, _S4123 };

#line 1189
    dpdporigin_11.primal_0 = dpdporigin_11.primal_0;

#line 1189
    dpdporigin_11.differential_0 = _S4127;

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S4128 = { DifferentiableSceneQuery_x24_syn_dadd_0(_S4119.differential_0.primal_0, _S4117), DifferentiableSceneQuery_Differential_x24_syn_dadd_0(_S4117, _S4119.differential_0.differential_0) };

#line 1189
    dpdpquery_7.primal_0 = dpdpquery_7.primal_0;

#line 1189
    dpdpquery_7.differential_0 = _S4128;

#line 1189
    return;
}


#line 1189
void s_bwd_reparameterizeRay_0(inout DiffPair_DifferentiableSceneQuery_0 dpquery_3, inout DiffPair_DiffRay_0 dpray_7, UniformSampleGenerator_0 sg_34, float dpweight_3, s_diff_s_diff_DiffRay_0 _s_dOut_28, s_bwd_reparameterizeRay_Intermediates_0 _s_diff_ctx_28)
{

#line 1189
    float3 _S4129 = dpray_7.primal_0.direction_1;

#line 1189
    float3  _S4130[int(3)] = { _S4129, _S4129, _S4129 };

#line 1189
    float3  _S4131[int(3)] = { float3(1.0, 0.0, 0.0), float3(0.0, 1.0, 0.0), float3(0.0, 0.0, 1.0) };

#line 1189
    DiffPair_array_float3_0 _S4132 = { _S4130, _S4131 };

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4133 = { _s_diff_ctx_28._S1071 };

#line 1189
    DiffPair_DifferentiableSceneQuery_0 _S4134 = { dpquery_3.primal_0, _S4133 };

#line 1189
    float _S4135 = ReparamCB_0.gVMFConcentration_0;

#line 1189
    float3 _S4136 = (float3)0.0;

#line 1189
    DiffPair_float3_0 _S4137 = { dpray_7.primal_0.origin_2, _S4136 };

#line 1189
    DiffPair_float3_0 _S4138 = { dpray_7.primal_0.direction_1, _S4136 };

#line 1189
    float3 _S4139 = (float3)0.0;

#line 1189
    matrix<float,int(3),int(3)>  _S4140 = matrix<float,int(3),int(3)> (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

#line 1189
    matrix<float,int(3),int(3)>  _S4141 = _S4140;

#line 1189
    _S4141[int(0)][int(0)] = 1.0;

#line 1189
    _S4141[int(1)][int(1)] = 1.0;

#line 1189
    _S4141[int(2)][int(2)] = 1.0;

#line 1189
    float3  _S4142[int(3)] = { _S4139, _S4139, _S4139 };

#line 1189
    DiffPair_array_float3_0 _S4143 = { _S4142, _S4142 };

#line 1189
    DiffPair_float3_0 _S4144;

#line 1189
    _S4144.primal_0 = dpray_7.primal_0.origin_2;

#line 1189
    _S4144.differential_0 = _S4139;

#line 1189
    DiffPair_float3_0 _S4145;

#line 1189
    _S4145.primal_0 = dpray_7.primal_0.direction_1;

#line 1189
    _S4145.differential_0 = _S4139;

#line 1189
    s_bwd_DiffRay_x24init_0(_S4144, _S4145, dpray_7.primal_0.pixel_1, _s_dOut_28);

#line 1189
    DiffPair_float3x3_0 _S4146;

#line 1189
    _S4146.primal_0 = _S4141;

#line 1189
    _S4146.differential_0 = _S4140;

#line 1189
    s_bwd_determinant_3(_S4146, dpweight_3);

#line 1189
    float3  _S4147[int(3)];

#line 1189
    _S4147[int(0)] = _S4139;

#line 1189
    _S4147[int(1)] = _S4139;

#line 1189
    _S4147[int(2)] = _S4139;

#line 1189
    _S4147[int(2)] = _S4146.differential_0[int(2)];

#line 1189
    float3  _S4148[int(3)];

#line 1189
    _S4148[int(0)] = _S4139;

#line 1189
    _S4148[int(1)] = _S4139;

#line 1189
    _S4148[int(2)] = _S4139;

#line 1189
    _S4148[int(1)] = _S4146.differential_0[int(1)];

#line 1189
    float3  _S4149[int(3)];

#line 1189
    _S4149[int(0)] = _S4139;

#line 1189
    _S4149[int(1)] = _S4139;

#line 1189
    _S4149[int(2)] = _S4139;

#line 1189
    _S4149[int(0)] = _S4146.differential_0[int(0)];

#line 1189
    float3  _S4150[int(3)];

#line 1189
    _S4150[int(0)] = _S4139;

#line 1189
    _S4150[int(1)] = _S4139;

#line 1189
    _S4150[int(2)] = _S4139;

#line 1189
    _S4150[int(0)] = _S4145.differential_0;

#line 1189
    float3  _S4151[int(3)] = { _S4147[int(0)] + _S4148[int(0)] + _S4149[int(0)], _S4147[int(1)] + _S4148[int(1)] + _S4149[int(1)], _S4147[int(2)] + _S4148[int(2)] + _S4149[int(2)] };

#line 1189
    float3  _S4152[int(3)] = { _S4150[int(0)], _S4150[int(1)], _S4150[int(2)] };

#line 1189
    DiffPair_array_float3_0 _S4153 = { _S4152, _S4151 };

#line 1189
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 _S4154 = { DifferentiableSceneQuery_x24_syn_dzero_0(), DifferentiableSceneQuery_Differential_x24_syn_dzero_0() };

#line 1189
    DiffPair_0 _S4155;

#line 1189
    _S4155.primal_0 = _S4134;

#line 1189
    _S4155.differential_0 = _S4154;

#line 1189
    DiffPair_float3_0 _S4156 = { _S4139, _S4139 };

#line 1189
    DiffPair_3 _S4157;

#line 1189
    _S4157.primal_0 = _S4137;

#line 1189
    _S4157.differential_0 = _S4156;

#line 1189
    DiffPair_3 _S4158;

#line 1189
    _S4158.primal_0 = _S4138;

#line 1189
    _S4158.differential_0 = _S4156;

#line 1189
    DiffPair_8 _S4159;

#line 1189
    _S4159.primal_0 = _S4132;

#line 1189
    _S4159.differential_0 = _S4143;

#line 1189
    s_bwd_s_fwd_computeWarpedRay_0(_S4155, _S4135, dpray_7.primal_0.pixel_1, _S4157, _S4158, _S4159, _S4153, _s_diff_ctx_28._S1070, _s_diff_ctx_28._S1068);

#line 1189
    float3 _S4160 = _S4144.differential_0 + _S4157.differential_0.primal_0;

#line 1189
    float3 _S4161 = _S4145.differential_0 + _S4158.differential_0.primal_0 + _S4159.differential_0.primal_0[int(0)] + _S4159.differential_0.primal_0[int(1)] + _S4159.differential_0.primal_0[int(2)];

#line 1189
    s_diff_s_diff_DiffRay_0 _S4162 = DiffRay_x24_syn_dzero_0();

#line 1189
    _S4162.origin_0 = _S4160;

#line 1189
    _S4162.direction_0 = _S4161;

#line 1189
    dpray_7.primal_0 = dpray_7.primal_0;

#line 1189
    dpray_7.differential_0 = _S4162;

#line 1189
    dpquery_3.primal_0 = dpquery_3.primal_0;

#line 1189
    dpquery_3.differential_0 = _S4155.differential_0.primal_0;

#line 1189
    return;
}


#line 1189
void s_bwd_dsq_computeRayOrigin_1(inout DiffPair_float3_0 _S4163, inout DiffPair_float3_0 _S4164, float3 _S4165)
{

#line 1189
    dsq_bwd_computeRayOrigin_0(_S4163, _S4164, _S4165);

#line 1189
    return;
}


#line 1189
void s_bwd_generateScatterRay_0(inout DiffPair_DifferentiableSceneQuery_0 dpsceneQuery_5, inout DiffPair_ShadingData_0 dpsd_4, Tuple_0 mi_5, inout DiffPair_IntersectionInfo_0 dpisectInfo_5, inout DiffPair_DiffRay_0 dpray_8, inout DiffPair_PathData_0 dppathData_3, UniformSampleGenerator_0 sg_35, bool shouldReparameterize_3, s_bwd_generateScatterRay_Intermediates_0 _s_diff_ctx_29)
{

#line 229 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float3 _S4166 = (float3)0.0;

#line 229
    uint2 _S4167 = (uint2)0U;

#line 229
    DiffPair_DifferentiableSceneQuery_0 _S4168 = dpsceneQuery_5;

#line 229
    DiffPair_ShadingData_0 _S4169 = dpsd_4;

#line 229
    DiffPair_IntersectionInfo_0 _S4170 = dpisectInfo_5;

#line 229
    DiffPair_DiffRay_0 _S4171 = dpray_8;

#line 229
    s_diff_s_diff_DiffRay_0 dpray_9 = DiffRay_x24_syn_dzero_0();

#line 229
    DiffPair_PathData_0 _S4172 = dppathData_3;

#line 229
    s_diff_PathData_0 dppathData_4 = PathData_x24_syn_dzero_0();

#line 229
    DiffRay_0 _S4173;

#line 229
    float3 _S4174;

#line 229
    float3 _S4175;

#line 229
    float3 _S4176;

#line 229
    float3 _S4177;

#line 229
    float3 _S4178;

#line 229
    float3 _S4179;

#line 229
    float3 _S4180;

#line 229
    float3 _S4181;

#line 229
    float3 _S4182;

#line 229
    float _S4183;

#line 229
    bool _S4184;

#line 229
    if(_s_diff_ctx_29._S1081)
    {

#line 229
        _S4173 = _s_diff_ctx_29._S1079;

#line 229
        _S4173.direction_1 = _s_diff_ctx_29._S1078.wo_0;

#line 229
        if(_S4169.primal_0.frontFacing_0)
        {

#line 229
            _S4174 = _S4169.primal_0.faceN_0;

#line 229
        }
        else
        {

#line 229
            _S4174 = - _S4169.primal_0.faceN_0;

#line 229
        }

#line 229
        _S4173.origin_2 = s_bwd_dsq_computeRayOrigin_0(_S4170.primal_0.posW_5, _S4174);

#line 229
        DiffRay_0 _S4185;

#line 229
        PathData_0 _S4186;

#line 229
        if(shouldReparameterize_3)
        {

#line 229
            bool _S4187 = CB_0.gDisableDivergence_0;

#line 229
            if(CB_0.gDisableDivergence_0)
            {

#line 229
                _S4183 = 1.0;

#line 229
            }
            else
            {

#line 229
                _S4183 = _s_diff_ctx_29._S1076;

#line 229
            }

#line 229
            float3 _S4188 = (float3)_S4183;

#line 229
            float3 _S4189 = _s_diff_ctx_29._S1080.thp_1 * _S4183;

#line 229
            _S4186 = _s_diff_ctx_29._S1080;

#line 229
            _S4186.thp_1 = _S4189;

#line 229
            _S4185 = _s_diff_ctx_29._S1074;

#line 229
            _S4175 = _s_diff_ctx_29._S1080.thp_1;

#line 229
            _S4176 = _S4188;

#line 229
            _S4184 = _S4187;

#line 229
        }
        else
        {

#line 229
            _S4185 = _S4173;

#line 229
            _S4186 = _s_diff_ctx_29._S1080;

#line 229
            _S4175 = _S4166;

#line 229
            _S4176 = _S4166;

#line 229
            _S4184 = false;

#line 229
        }

#line 229
        float3 _S4190 = (float3)_s_diff_ctx_29._S1078.pdf_2;

#line 229
        float3 weight_9 = _s_diff_ctx_29._S1072 / _s_diff_ctx_29._S1078.pdf_2;

#line 229
        float3 _S4191 = _S4174;

#line 229
        float3 _S4192 = _S4175;

#line 229
        float3 _S4193 = _S4176;

#line 229
        _S4174 = _S4186.thp_1;

#line 229
        _S4175 = weight_9;

#line 229
        _S4176 = _S4190;

#line 229
        _S4177 = _S4185.direction_1;

#line 229
        _S4178 = _S4170.primal_0.normalW_2;

#line 229
        _S4179 = _S4192;

#line 229
        _S4180 = _S4193;

#line 229
        _S4181 = _S4170.primal_0.posW_5;

#line 229
        _S4182 = _S4191;

#line 229
    }
    else
    {

#line 229
        _S4174 = _S4166;

#line 229
        _S4175 = _S4166;

#line 229
        _S4176 = _S4166;

#line 229
        _S4177 = _S4166;

#line 229
        _S4178 = _S4166;

#line 229
        _S4179 = _S4166;

#line 229
        _S4180 = _S4166;

#line 229
        _S4184 = false;

#line 229
        _S4173.origin_2 = _S4166;

#line 229
        _S4173.direction_1 = _S4166;

#line 229
        _S4173.pixel_1 = _S4167;

#line 229
        _S4181 = _S4166;

#line 229
        _S4182 = _S4166;

#line 229
    }

#line 229
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4194 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 229
    s_diff_ShadingData_0 _S4195 = ShadingData_x24_syn_dzero_0();

#line 229
    s_diff_s_diff_IntersectionInfo_0 _S4196 = IntersectionInfo_x24_syn_dzero_0();

#line 229
    s_diff_PathData_0 _S4197 = PathData_x24_syn_dadd_0(PathData_x24_syn_dadd_0(_S4172.differential_0, dppathData_4), dppathData_4);

#line 229
    s_diff_s_diff_DiffRay_0 _S4198 = DiffRay_x24_syn_dadd_0(DiffRay_x24_syn_dadd_0(_S4171.differential_0, dpray_9), dpray_9);

#line 229
    s_diff_PathData_0 dppathData_5;

#line 229
    s_diff_s_diff_DiffRay_0 dpray_10;

#line 229
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4199;

#line 229
    s_diff_s_diff_IntersectionInfo_0 _S4200;

#line 229
    s_diff_ShadingData_0 _S4201;

#line 229
    if(_s_diff_ctx_29._S1081)
    {

#line 229
        dppathData_5 = _S4197;

#line 229
        dppathData_5.thp_0 = _S4166;

#line 229
        float3 _S4202 = _S4175 * _S4197.thp_0;

#line 229
        float3 _S4203 = _S4174 * _S4197.thp_0 / _S4176;

#line 229
        DiffPair_ShadingData_0 _S4204;

#line 229
        _S4204.primal_0 = _S4169.primal_0;

#line 229
        _S4204.differential_0 = _S4195;

#line 229
        DiffPair_float3_0 _S4205;

#line 229
        _S4205.primal_0 = _S4177;

#line 229
        _S4205.differential_0 = _S4166;

#line 229
        DiffPair_float3_0 _S4206;

#line 229
        _S4206.primal_0 = _S4178;

#line 229
        _S4206.differential_0 = _S4166;

#line 229
        s_bwd_temporaryBsdfEval_0(mi_5, _S4204, _S4205, _S4206, _S4203, _s_diff_ctx_29._S1073);

#line 229
        s_diff_s_diff_DiffRay_0 _S4207 = dpray_9;

#line 229
        _S4207.direction_0 = _S4205.differential_0;

#line 229
        s_diff_s_diff_DiffRay_0 _S4208 = DiffRay_x24_syn_dadd_0(_S4198, _S4207);

#line 229
        s_diff_PathData_0 _S4209 = dppathData_4;

#line 229
        _S4209.thp_0 = _S4202;

#line 229
        s_diff_PathData_0 _S4210 = PathData_x24_syn_dadd_0(dppathData_5, _S4209);

#line 229
        s_diff_s_diff_IntersectionInfo_0 _S4211 = _S4196;

#line 229
        _S4211.normalW_0 = _S4206.differential_0;

#line 229
        s_diff_s_diff_IntersectionInfo_0 _S4212 = IntersectionInfo_x24_syn_dadd_0(_S4196, _S4211);

#line 229
        s_diff_ShadingData_0 _S4213 = ShadingData_x24_syn_dadd_0(_S4204.differential_0, _S4195);

#line 229
        if(shouldReparameterize_3)
        {

#line 229
            dppathData_5 = _S4210;

#line 229
            dppathData_5.thp_0 = _S4166;

#line 229
            float3 _S4214 = _S4179 * _S4210.thp_0;

#line 229
            float3 _S4215 = _S4180 * _S4210.thp_0;

#line 229
            s_diff_PathData_0 _S4216 = dppathData_4;

#line 229
            _S4216.thp_0 = _S4215;

#line 229
            s_diff_PathData_0 _S4217 = PathData_x24_syn_dadd_0(dppathData_5, _S4216);

#line 483 "core.meta.slang"
            float _S4218 = _S4214[int(0)] + _S4214[int(1)] + _S4214[int(2)];

#line 483
            s_diff_s_diff_DiffRay_0 _S4219 = DiffRay_x24_syn_dadd_0(_S4208, dpray_9);

#line 483
            if(_S4184)
            {

#line 483
                _S4183 = 0.0;

#line 483
            }
            else
            {

#line 483
                _S4183 = _S4218;

#line 483
            }

#line 483
            DiffPair_DifferentiableSceneQuery_0 _S4220;

#line 483
            _S4220.primal_0 = _S4168.primal_0;

#line 483
            _S4220.differential_0 = _S4194;

#line 483
            DiffPair_DiffRay_0 _S4221;

#line 483
            _S4221.primal_0 = _S4173;

#line 483
            _S4221.differential_0 = dpray_9;

#line 483
            s_bwd_reparameterizeRay_0(_S4220, _S4221, _s_diff_ctx_29._S1077, _S4183, _S4219, _s_diff_ctx_29._S1075);

#line 483
            s_diff_s_diff_DifferentiableSceneQuery_0 _S4222 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4220.differential_0, _S4194);

#line 483
            dpray_10 = DiffRay_x24_syn_dadd_0(_S4221.differential_0, dpray_9);

#line 483
            dppathData_5 = _S4217;

#line 483
            _S4199 = _S4222;

#line 483
        }
        else
        {

#line 483
            s_diff_PathData_0 _S4223 = PathData_x24_syn_dadd_0(_S4210, dppathData_4);

#line 483
            dpray_10 = DiffRay_x24_syn_dadd_0(_S4208, dpray_9);

#line 483
            dppathData_5 = _S4223;

#line 483
            _S4199 = _S4194;

#line 483
        }

#line 483
        s_diff_s_diff_DiffRay_0 _S4224 = dpray_10;

#line 483
        dpray_10.origin_0 = _S4166;

#line 483
        DiffPair_float3_0 _S4225;

#line 483
        _S4225.primal_0 = _S4181;

#line 483
        _S4225.differential_0 = _S4166;

#line 483
        DiffPair_float3_0 _S4226;

#line 483
        _S4226.primal_0 = _S4182;

#line 483
        _S4226.differential_0 = _S4166;

#line 483
        s_bwd_dsq_computeRayOrigin_1(_S4225, _S4226, _S4224.origin_0);

#line 483
        DiffPair_float3_0 _S4227 = _S4225;

#line 483
        s_diff_s_diff_DiffRay_0 _S4228 = DiffRay_x24_syn_dadd_0(dpray_10, dpray_9);

#line 483
        dpray_10 = _S4228;

#line 483
        dpray_10.direction_0 = _S4166;

#line 483
        s_diff_s_diff_IntersectionInfo_0 _S4229 = _S4196;

#line 483
        _S4229.posW_2 = _S4227.differential_0;

#line 483
        _S4200 = IntersectionInfo_x24_syn_dadd_0(_S4212, _S4229);

#line 483
        _S4201 = _S4213;

#line 483
    }
    else
    {

#line 483
        s_diff_s_diff_DiffRay_0 _S4230 = DiffRay_x24_syn_dadd_0(_S4198, dpray_9);

#line 483
        dppathData_5 = PathData_x24_syn_dadd_0(_S4197, dppathData_4);

#line 483
        dpray_10 = _S4230;

#line 483
        _S4200 = _S4196;

#line 483
        _S4201 = _S4195;

#line 483
        _S4199 = _S4194;

#line 483
    }

#line 483
    s_diff_PathData_0 dppathData_6 = PathData_x24_syn_dadd_0(dppathData_4, dppathData_5);

#line 483
    s_diff_s_diff_DiffRay_0 dpray_11 = DiffRay_x24_syn_dadd_0(dpray_9, dpray_10);

#line 483
    dpisectInfo_5.primal_0 = dpisectInfo_5.primal_0;

#line 483
    dpisectInfo_5.differential_0 = _S4200;

#line 483
    dpsd_4.primal_0 = dpsd_4.primal_0;

#line 483
    dpsd_4.differential_0 = _S4201;

#line 483
    dpsceneQuery_5.primal_0 = dpsceneQuery_5.primal_0;

#line 483
    dpsceneQuery_5.differential_0 = _S4199;

#line 483
    dpray_8.primal_0 = _S4171.primal_0;

#line 483
    dpray_8.differential_0 = dpray_11;

#line 483
    dppathData_3.primal_0 = _S4172.primal_0;

#line 483
    dppathData_3.differential_0 = dppathData_6;

#line 483
    return;
}


#line 483
void s_bwd_computeNEE_0(inout DiffPair_DifferentiableSceneQuery_0 dpsceneQuery_6, inout DiffPair_ShadingData_0 dpsd_5, Tuple_0 mi_6, inout DiffPair_IntersectionInfo_0 dpisectInfo_6, LightSample_0 ls_5, uint2 globalPixel_13, inout DiffPair_PathData_0 dppathData_7, UniformSampleGenerator_0 sg_36, bool shouldReparameterize_4, s_bwd_computeNEE_Intermediates_0 _s_diff_ctx_30)
{

#line 302 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float3 _S4231 = (float3)0.0;

#line 302
    DiffPair_DifferentiableSceneQuery_0 _S4232 = dpsceneQuery_6;

#line 302
    DiffPair_ShadingData_0 _S4233 = dpsd_5;

#line 302
    DiffPair_IntersectionInfo_0 _S4234 = dpisectInfo_6;

#line 302
    DiffPair_PathData_0 _S4235 = dppathData_7;

#line 302
    s_diff_PathData_0 _S4236 = PathData_x24_syn_dzero_0();

#line 302
    float3 wo_22 = ls_5.lightPos_0 - dpisectInfo_6.primal_0.posW_5;

#line 302
    float3 _S4237 = ls_5.Li_0 * _s_diff_ctx_30._S1088;

#line 302
    float _S4238 = s_bwd_length_0(wo_22);

#line 302
    float3 _S4239 = (float3)_S4238;

#line 302
    float3 wo_23 = wo_22 / _S4238;

#line 302
    float _S4240 = _S4238 * _S4238;

#line 302
    float3 _S4241 = (float3)_S4240;

#line 302
    float3 thp_4;

#line 302
    if(dpsd_5.primal_0.frontFacing_0)
    {

#line 302
        thp_4 = _S4233.primal_0.faceN_0;

#line 302
    }
    else
    {

#line 302
        thp_4 = - _S4233.primal_0.faceN_0;

#line 302
    }

#line 302
    float3 _S4242 = s_bwd_dsq_computeRayOrigin_0(_S4234.primal_0.posW_5, thp_4);

#line 302
    DiffRay_0 _S4243 = s_bwd_primal_DiffRay_x24init_0(_S4242, wo_23, globalPixel_13);

#line 302
    float3 thp_5;

#line 302
    float3 _S4244;

#line 302
    float _S4245;

#line 302
    DiffRay_0 ray_9;

#line 302
    bool _S4246;

#line 302
    if(shouldReparameterize_4)
    {

#line 302
        bool _S4247 = CB_0.gDisableDivergence_0;

#line 302
        if(CB_0.gDisableDivergence_0)
        {

#line 302
            _S4245 = 1.0;

#line 302
        }
        else
        {

#line 302
            _S4245 = _s_diff_ctx_30._S1085;

#line 302
        }

#line 302
        float3 _S4248 = (float3)_S4245;

#line 302
        float3 thp_6 = _s_diff_ctx_30._S1087.thp_1 * _S4245;

#line 302
        ray_9 = _s_diff_ctx_30._S1083;

#line 302
        thp_5 = thp_6;

#line 302
        _S4244 = _S4248;

#line 302
        _S4246 = _S4247;

#line 302
    }
    else
    {

#line 302
        ray_9 = _S4243;

#line 302
        thp_5 = _s_diff_ctx_30._S1087.thp_1;

#line 302
        _S4244 = _S4231;

#line 302
        _S4246 = false;

#line 302
    }

#line 302
    DiffRay_0 _S4249 = ray_9;

#line 302
    float3 _S4250 = - ray_9.direction_1;

#line 302
    float _S4251 = s_bwd_dot_0(ls_5.lightNormal_0, _S4250);

#line 302
    float areaToSolidAngle_1 = _S4240 / _S4251;

#line 302
    float3 _S4252 = (float3)areaToSolidAngle_1;

#line 302
    float _S4253 = _S4251 * _S4251;

#line 302
    float3 weight_10 = _S4237 * areaToSolidAngle_1 / areaToSolidAngle_1;

#line 302
    s_diff_s_diff_DiffRay_0 _S4254 = DiffRay_x24_syn_dzero_0();

#line 302
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4255 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 302
    s_diff_ShadingData_0 _S4256 = ShadingData_x24_syn_dzero_0();

#line 302
    s_diff_s_diff_IntersectionInfo_0 _S4257 = IntersectionInfo_x24_syn_dzero_0();

#line 302
    s_diff_PathData_0 _S4258 = PathData_x24_syn_dadd_0(_S4235.differential_0, _S4236);

#line 302
    s_diff_PathData_0 _S4259 = _S4258;

#line 302
    _S4259.radiance_0 = _S4231;

#line 302
    float3 _S4260 = weight_10 * _S4258.radiance_0;

#line 302
    float3 _S4261 = thp_5 * _S4258.radiance_0 / _S4252;

#line 302
    float3 _S4262 = _S4237 * _S4261;

#line 302
    float3 _S4263 = ls_5.Li_0 * (_S4252 * _S4261);

#line 302
    DiffPair_ShadingData_0 _S4264;

#line 302
    _S4264.primal_0 = _S4233.primal_0;

#line 302
    _S4264.differential_0 = _S4256;

#line 302
    DiffPair_float3_0 _S4265;

#line 302
    _S4265.primal_0 = _S4249.direction_1;

#line 302
    _S4265.differential_0 = _S4231;

#line 302
    DiffPair_float3_0 _S4266;

#line 302
    _S4266.primal_0 = _S4234.primal_0.normalW_2;

#line 302
    _S4266.differential_0 = _S4231;

#line 302
    s_bwd_temporaryBsdfEval_0(mi_6, _S4264, _S4265, _S4266, _S4263, _s_diff_ctx_30._S1082);

#line 302
    float _S4267 = (_S4262[int(0)] + _S4262[int(1)] + _S4262[int(2)]) / _S4253;

#line 302
    float _S4268 = _S4240 * - _S4267;

#line 302
    float _S4269 = _S4251 * _S4267;

#line 302
    DiffPair_float3_0 _S4270;

#line 302
    _S4270.primal_0 = ls_5.lightNormal_0;

#line 302
    _S4270.differential_0 = _S4231;

#line 302
    DiffPair_float3_0 _S4271;

#line 302
    _S4271.primal_0 = _S4250;

#line 302
    _S4271.differential_0 = _S4231;

#line 302
    s_bwd_dot_2(_S4270, _S4271, _S4268);

#line 1189 "core.meta.slang"
    float3 _S4272 = _S4265.differential_0 + - _S4271.differential_0;

#line 1189
    float _S4273 = _S4238 * _S4269;

#line 1189
    s_diff_PathData_0 _S4274 = _S4236;

#line 1189
    _S4274.radiance_0 = _S4258.radiance_0;

#line 1189
    s_diff_PathData_0 dppathData_8 = PathData_x24_syn_dadd_0(_S4259, _S4274);

#line 1189
    s_diff_s_diff_DiffRay_0 _S4275 = _S4254;

#line 1189
    _S4275.direction_0 = _S4272;

#line 1189
    s_diff_s_diff_DiffRay_0 _S4276 = _S4275;

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4277 = _S4257;

#line 1189
    _S4277.normalW_0 = _S4266.differential_0;

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4278 = IntersectionInfo_x24_syn_dadd_0(_S4257, _S4277);

#line 1189
    s_diff_ShadingData_0 _S4279 = ShadingData_x24_syn_dadd_0(_S4264.differential_0, _S4256);

#line 483
    float _S4280 = _S4273 + _S4273;

#line 483
    s_diff_s_diff_DiffRay_0 _S4281;

#line 483
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4282;

#line 483
    if(shouldReparameterize_4)
    {

#line 483
        float3 _S4283 = _s_diff_ctx_30._S1087.thp_1 * _S4260;

#line 483
        float3 _S4284 = _S4244 * _S4260;

#line 483
        float _S4285 = _S4283[int(0)] + _S4283[int(1)] + _S4283[int(2)];

#line 483
        s_diff_s_diff_DiffRay_0 _S4286 = DiffRay_x24_syn_dadd_0(_S4276, _S4254);

#line 483
        if(_S4246)
        {

#line 483
            _S4245 = 0.0;

#line 483
        }
        else
        {

#line 483
            _S4245 = _S4285;

#line 483
        }

#line 483
        DiffPair_DifferentiableSceneQuery_0 _S4287;

#line 483
        _S4287.primal_0 = _S4232.primal_0;

#line 483
        _S4287.differential_0 = _S4255;

#line 483
        DiffPair_DiffRay_0 _S4288;

#line 483
        _S4288.primal_0 = _S4243;

#line 483
        _S4288.differential_0 = _S4254;

#line 483
        s_bwd_reparameterizeRay_0(_S4287, _S4288, _s_diff_ctx_30._S1086, _S4245, _S4286, _s_diff_ctx_30._S1084);

#line 483
        s_diff_s_diff_DifferentiableSceneQuery_0 _S4289 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4287.differential_0, _S4255);

#line 483
        s_diff_s_diff_DiffRay_0 _S4290 = DiffRay_x24_syn_dadd_0(_S4288.differential_0, _S4254);

#line 483
        thp_5 = _S4284;

#line 483
        _S4281 = _S4290;

#line 483
        _S4282 = _S4289;

#line 483
    }
    else
    {

#line 483
        s_diff_s_diff_DiffRay_0 _S4291 = DiffRay_x24_syn_dadd_0(_S4276, _S4254);

#line 483
        thp_5 = _S4260;

#line 483
        _S4281 = _S4291;

#line 483
        _S4282 = _S4255;

#line 483
    }

#line 483
    DiffPair_float3_0 _S4292;

#line 483
    _S4292.primal_0 = _S4242;

#line 483
    _S4292.differential_0 = _S4231;

#line 483
    DiffPair_float3_0 _S4293;

#line 483
    _S4293.primal_0 = wo_23;

#line 483
    _S4293.differential_0 = _S4231;

#line 483
    s_bwd_DiffRay_x24init_0(_S4292, _S4293, globalPixel_13, _S4281);

#line 483
    DiffPair_float3_0 _S4294 = _S4293;

#line 483
    DiffPair_float3_0 _S4295;

#line 483
    _S4295.primal_0 = _S4234.primal_0.posW_5;

#line 483
    _S4295.differential_0 = _S4231;

#line 483
    DiffPair_float3_0 _S4296;

#line 483
    _S4296.primal_0 = thp_4;

#line 483
    _S4296.differential_0 = _S4231;

#line 483
    s_bwd_dsq_computeRayOrigin_1(_S4295, _S4296, _S4292.differential_0);

#line 483
    DiffPair_float3_0 _S4297 = _S4295;

#line 483
    s_diff_PathData_0 _S4298 = _S4236;

#line 483
    _S4298.thp_0 = thp_5;

#line 483
    s_diff_PathData_0 dppathData_9 = PathData_x24_syn_dadd_0(_S4298, dppathData_8);

#line 483
    float3 _S4299 = _S4294.differential_0 / _S4241;

#line 483
    float3 _S4300 = wo_22 * - _S4299;

#line 483
    float3 _S4301 = _S4239 * _S4299;

#line 483
    float _S4302 = _S4300[int(0)] + _S4300[int(1)] + _S4300[int(2)] + _S4280;

#line 483
    DiffPair_float3_0 _S4303;

#line 483
    _S4303.primal_0 = wo_22;

#line 483
    _S4303.differential_0 = _S4231;

#line 483
    s_bwd_length_1(_S4303, _S4302);

#line 1189
    float3 _S4304 = - (_S4301 + _S4303.differential_0) + _S4297.differential_0;

#line 1189
    s_diff_PathData_0 dppathData_10 = PathData_x24_syn_dadd_0(_S4236, dppathData_9);

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4305 = _S4257;

#line 1189
    _S4305.posW_2 = _S4304;

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4306 = IntersectionInfo_x24_syn_dadd_0(_S4278, _S4305);

#line 1189
    dpisectInfo_6.primal_0 = dpisectInfo_6.primal_0;

#line 1189
    dpisectInfo_6.differential_0 = _S4306;

#line 1189
    dpsd_5.primal_0 = dpsd_5.primal_0;

#line 1189
    dpsd_5.differential_0 = _S4279;

#line 1189
    dpsceneQuery_6.primal_0 = dpsceneQuery_6.primal_0;

#line 1189
    dpsceneQuery_6.differential_0 = _S4282;

#line 1189
    dppathData_7.primal_0 = _S4235.primal_0;

#line 1189
    dppathData_7.differential_0 = dppathData_10;

#line 1189
    return;
}


#line 1189
void s_bwd_handleHit_0(inout DiffPair_DifferentiableSceneQuery_0 dpsceneQuery_7, inout DiffPair_IntersectionInfo_0 dpisectInfo_7, inout DiffPair_PathData_0 dppathData_11, inout DiffPair_DiffRay_0 dpray_12, UniformSampleGenerator_0 sg_37, bool shouldReparameterize_5, s_bwd_handleHit_Intermediates_0 _s_diff_ctx_31)
{

#line 349 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    float3 _S4307 = (float3)0.0;

#line 349
    uint2 _S4308 = (uint2)0U;

#line 349
    DiffPair_DifferentiableSceneQuery_0 _S4309 = dpsceneQuery_7;

#line 349
    DiffPair_IntersectionInfo_0 _S4310 = dpisectInfo_7;

#line 349
    DiffPair_PathData_0 _S4311 = dppathData_11;

#line 349
    s_diff_PathData_0 dppathData_12 = PathData_x24_syn_dzero_0();

#line 349
    DiffPair_DiffRay_0 _S4312 = dpray_12;

#line 349
    s_diff_s_diff_DiffRay_0 dpray_13 = DiffRay_x24_syn_dzero_0();

#line 349
    bool isPrimaryHit_0 = _s_diff_ctx_31._S1101.length_0 == 0U;

#line 349
    PathData_0 _S4313;

#line 349
    float3 _S4314;

#line 349
    if(isPrimaryHit_0)
    {

#line 349
        float3 _S4315 = _s_diff_ctx_31._S1101.radiance_1 + _s_diff_ctx_31._S1101.thp_1 * _s_diff_ctx_31._S1100.emission_0;

#line 349
        _S4313 = _s_diff_ctx_31._S1101;

#line 349
        _S4313.radiance_1 = _S4315;

#line 349
        _S4314 = _s_diff_ctx_31._S1100.emission_0;

#line 349
    }
    else
    {

#line 349
        _S4313 = _s_diff_ctx_31._S1101;

#line 349
        _S4314 = _S4307;

#line 349
    }

#line 349
    bool _S4316 = _S4313.length_0 >= 1U;

#line 349
    bool _S4317 = !_S4316;

#line 349
    uint2 _S4318;

#line 349
    bool _bflag_9;

#line 349
    bool _S4319;

#line 349
    LightSample_0 _S4320;

#line 349
    if(_S4317)
    {

#line 349
        if(_s_diff_ctx_31._S1098)
        {

#line 349
            if(_s_diff_ctx_31._S1097)
            {

#line 349
                _S4318 = _s_diff_ctx_31._S1102.pixel_1;

#line 349
            }
            else
            {

#line 349
                _S4318 = _S4308;

#line 349
            }

#line 349
        }
        else
        {

#line 349
            _S4318 = _S4308;

#line 349
        }

#line 417
        bool _S4321 = !_s_diff_ctx_31._S1089;

#line 417
        if(_S4321)
        {

#line 417
            _bflag_9 = false;

#line 417
        }
        else
        {

#line 417
            _bflag_9 = _S4317;

#line 417
        }

#line 417
        _S4319 = _S4321;

#line 417
        _S4320 = _s_diff_ctx_31._S1099;

#line 417
    }
    else
    {

#line 417
        _bflag_9 = false;

#line 417
        _S4319 = false;

#line 417
        _S4320.Li_0 = _S4307;

#line 417
        _S4320.pdf_1 = 0.0;

#line 417
        _S4320.origin_4 = _S4307;

#line 417
        _S4320.distance_1 = 0.0;

#line 417
        _S4320.dir_4 = _S4307;

#line 417
        _S4320.lightPos_0 = _S4307;

#line 417
        _S4320.lightNormal_0 = _S4307;

#line 417
        _S4318 = _S4308;

#line 417
    }

#line 417
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4322 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 417
    s_diff_s_diff_IntersectionInfo_0 _S4323 = IntersectionInfo_x24_syn_dzero_0();

#line 417
    s_diff_s_diff_DiffRay_0 _S4324 = DiffRay_x24_syn_dadd_0(DiffRay_x24_syn_dadd_0(_S4312.differential_0, dpray_13), dpray_13);

#line 417
    s_diff_PathData_0 _S4325 = PathData_x24_syn_dadd_0(PathData_x24_syn_dadd_0(_S4311.differential_0, dppathData_12), dppathData_12);

#line 417
    s_diff_PathData_0 dppathData_13;

#line 417
    s_diff_s_diff_IntersectionInfo_0 _S4326;

#line 417
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4327;

#line 417
    s_diff_s_diff_DiffRay_0 dpray_14;

#line 417
    if(_S4317)
    {

#line 417
        if(_bflag_9)
        {

#line 417
            dppathData_13 = PathData_x24_syn_dadd_0(_S4325, dppathData_12);

#line 417
        }
        else
        {

#line 417
            dppathData_13 = PathData_x24_syn_dadd_0(_S4325, dppathData_12);

#line 417
        }

#line 417
        if(_S4319)
        {

#line 417
        }
        else
        {

#line 417
            dppathData_13 = PathData_x24_syn_dadd_0(dppathData_13, dppathData_12);

#line 417
        }

#line 417
        s_diff_PathData_0 _S4328 = PathData_x24_syn_dadd_0(dppathData_12, dppathData_13);

#line 417
        s_diff_s_diff_DiffRay_0 _S4329 = DiffRay_x24_syn_dadd_0(dpray_13, _S4324);

#line 417
        DiffPair_DifferentiableSceneQuery_0 _S4330;

#line 417
        _S4330.primal_0 = _S4309.primal_0;

#line 417
        _S4330.differential_0 = _S4322;

#line 417
        s_diff_ShadingData_0 _S4331 = ShadingData_x24_syn_dzero_0();

#line 417
        DiffPair_ShadingData_0 _S4332;

#line 417
        _S4332.primal_0 = _s_diff_ctx_31.sd_8;

#line 417
        _S4332.differential_0 = _S4331;

#line 417
        DiffPair_IntersectionInfo_0 _S4333;

#line 417
        _S4333.primal_0 = _S4310.primal_0;

#line 417
        _S4333.differential_0 = _S4323;

#line 417
        DiffPair_DiffRay_0 _S4334;

#line 417
        _S4334.primal_0 = _s_diff_ctx_31._S1092;

#line 417
        _S4334.differential_0 = _S4329;

#line 417
        DiffPair_PathData_0 _S4335;

#line 417
        _S4335.primal_0 = _s_diff_ctx_31._S1091;

#line 417
        _S4335.differential_0 = _S4328;

#line 417
        s_bwd_generateScatterRay_0(_S4330, _S4332, _s_diff_ctx_31._S1103, _S4333, _S4334, _S4335, _s_diff_ctx_31._S1093, shouldReparameterize_5, _s_diff_ctx_31._S1090);

#line 417
        s_diff_s_diff_DiffRay_0 _S4336 = DiffRay_x24_syn_dadd_0(_S4334.differential_0, dpray_13);

#line 417
        s_diff_PathData_0 _S4337 = PathData_x24_syn_dadd_0(PathData_x24_syn_dadd_0(_S4335.differential_0, dppathData_12), dppathData_12);

#line 417
        s_diff_s_diff_IntersectionInfo_0 _S4338 = IntersectionInfo_x24_syn_dadd_0(_S4333.differential_0, _S4323);

#line 417
        s_diff_s_diff_DifferentiableSceneQuery_0 _S4339 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4330.differential_0, _S4322);

#line 417
        if(_s_diff_ctx_31._S1098)
        {

#line 417
            if(_s_diff_ctx_31._S1097)
            {

#line 417
                s_diff_PathData_0 _S4340 = PathData_x24_syn_dadd_0(_S4337, dppathData_12);

#line 417
                DiffPair_DifferentiableSceneQuery_0 _S4341;

#line 417
                _S4341.primal_0 = _S4309.primal_0;

#line 417
                _S4341.differential_0 = _S4322;

#line 417
                DiffPair_ShadingData_0 _S4342;

#line 417
                _S4342.primal_0 = _s_diff_ctx_31.sd_8;

#line 417
                _S4342.differential_0 = _S4331;

#line 417
                DiffPair_IntersectionInfo_0 _S4343;

#line 417
                _S4343.primal_0 = _S4310.primal_0;

#line 417
                _S4343.differential_0 = _S4323;

#line 417
                DiffPair_PathData_0 _S4344;

#line 417
                _S4344.primal_0 = _s_diff_ctx_31._S1095;

#line 417
                _S4344.differential_0 = _S4340;

#line 417
                s_bwd_computeNEE_0(_S4341, _S4342, _s_diff_ctx_31._S1103, _S4343, _S4320, _S4318, _S4344, _s_diff_ctx_31._S1096, shouldReparameterize_5, _s_diff_ctx_31._S1094);

#line 417
                s_diff_s_diff_IntersectionInfo_0 _S4345 = IntersectionInfo_x24_syn_dadd_0(_S4343.differential_0, _S4338);

#line 417
                s_diff_s_diff_DifferentiableSceneQuery_0 _S4346 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4341.differential_0, _S4339);

#line 417
                dppathData_13 = PathData_x24_syn_dadd_0(PathData_x24_syn_dadd_0(_S4344.differential_0, dppathData_12), dppathData_12);

#line 417
                _S4326 = _S4345;

#line 417
                _S4327 = _S4346;

#line 417
            }
            else
            {

#line 417
                dppathData_13 = PathData_x24_syn_dadd_0(_S4337, dppathData_12);

#line 417
                _S4326 = _S4338;

#line 417
                _S4327 = _S4339;

#line 417
            }

#line 417
        }
        else
        {

#line 417
            dppathData_13 = PathData_x24_syn_dadd_0(_S4337, dppathData_12);

#line 417
            _S4326 = _S4338;

#line 417
            _S4327 = _S4339;

#line 417
        }

#line 417
        dpray_14 = _S4336;

#line 417
    }
    else
    {

#line 417
        s_diff_s_diff_DiffRay_0 _S4347 = DiffRay_x24_syn_dadd_0(_S4324, dpray_13);

#line 417
        dppathData_13 = PathData_x24_syn_dadd_0(_S4325, dppathData_12);

#line 417
        dpray_14 = _S4347;

#line 417
        _S4326 = _S4323;

#line 417
        _S4327 = _S4322;

#line 417
    }

#line 417
    if(_S4316)
    {

#line 417
        dppathData_13 = PathData_x24_syn_dadd_0(dppathData_13, dppathData_12);

#line 417
    }
    else
    {

#line 417
        dppathData_13 = PathData_x24_syn_dadd_0(dppathData_13, dppathData_12);

#line 417
    }

#line 417
    if(isPrimaryHit_0)
    {

#line 417
        s_diff_PathData_0 _S4348 = dppathData_13;

#line 417
        dppathData_13.radiance_0 = _S4307;

#line 417
        float3 _S4349 = _S4314 * _S4348.radiance_0;

#line 417
        s_diff_PathData_0 _S4350 = dppathData_12;

#line 417
        _S4350.radiance_0 = _S4348.radiance_0;

#line 417
        _S4350.thp_0 = _S4349;

#line 417
        dppathData_13 = PathData_x24_syn_dadd_0(dppathData_13, _S4350);

#line 417
    }
    else
    {

#line 417
        dppathData_13 = PathData_x24_syn_dadd_0(dppathData_13, dppathData_12);

#line 417
    }

#line 1182 "core.meta.slang"
    float2 _S4351 = (float2)0.0;

#line 1189
    float3 _S4352 = float3(0.0, 0.0, _S4351[int(1)]) + float3(0.0, _S4351[int(0)], 0.0);

#line 1189
    s_diff_s_diff_DiffRay_0 _S4353 = dpray_13;

#line 1189
    _S4353.direction_0 = _S4307;

#line 1189
    _S4353.origin_0 = _S4307;

#line 1189
    s_diff_s_diff_DiffRay_0 dpray_15 = DiffRay_x24_syn_dadd_0(DiffRay_x24_syn_dadd_0(dpray_13, _S4353), dpray_14);

#line 1189
    s_diff_PathData_0 dppathData_14 = PathData_x24_syn_dadd_0(dppathData_12, dppathData_13);

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4354 = _S4323;

#line 1189
    _S4354.barycentrics_0 = _S4352;

#line 1189
    s_diff_s_diff_IntersectionInfo_0 _S4355 = IntersectionInfo_x24_syn_dadd_0(_S4326, _S4354);

#line 1189
    dpisectInfo_7.primal_0 = dpisectInfo_7.primal_0;

#line 1189
    dpisectInfo_7.differential_0 = _S4355;

#line 1189
    dpsceneQuery_7.primal_0 = dpsceneQuery_7.primal_0;

#line 1189
    dpsceneQuery_7.differential_0 = _S4327;

#line 1189
    dppathData_11.primal_0 = _S4311.primal_0;

#line 1189
    dppathData_11.differential_0 = dppathData_14;

#line 1189
    dpray_12.primal_0 = _S4312.primal_0;

#line 1189
    dpray_12.differential_0 = dpray_15;

#line 1189
    return;
}


#line 1189
void s_bwd_tracePath_0(inout DiffPair_DifferentiableSceneQuery_0 dpsceneQuery_8, inout DiffPair_float2_0 dppixel_1, inout DiffPair_float2_0 dporientation_1, float2 uPixel_1, uint2 frameDim_6, uint2 globalPixel_14, UniformSampleGenerator_0 sg_38, bool isEdgePath_1, float3 _s_dOut_29, s_bwd_tracePath_Intermediates_0 _s_diff_ctx_32)
{

#line 460 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    HitInfo_0 _S4356 = { (uint4)0U };

#line 460
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S4357;

#line 460
    _S4357._S1548 = _S4356;

#line 460
    _S4357.isHit_1 = false;

#line 460
    float3 _S4358 = (float3)0.0;

#line 460
    GeometryInstanceID_0 _S4359 = { 0U };

#line 460
    DiffPair_DifferentiableSceneQuery_0 _S4360 = dpsceneQuery_8;

#line 460
    DiffPair_float2_0 _S4361 = dppixel_1;

#line 460
    DiffPair_float2_0 _S4362 = dporientation_1;

#line 460
    float2 _S4363 = _s_diff_ctx_32._S1138 - uPixel_1;

#line 460
    float _S4364 = _s_diff_ctx_32._S1139;

#line 460
    float3 _S4365 = _s_diff_ctx_32._S1137.thp_1 * (_S4364 / _S4364);

#line 460
    PathData_0 pathData_1 = _s_diff_ctx_32._S1137;

#line 460
    pathData_1.thp_1 = _S4365;

#line 460
    if(isEdgePath_1)
    {

#line 460
        pathData_1.thp_1 = _S4365 * s_bwd_dot_1(_S4362.primal_0, (float2)0.0);

#line 460
    }
    else
    {

#line 460
        if(!CB_0.gDisableDivergence_0)
        {

#line 460
            pathData_1.thp_1 = _S4358;

#line 460
        }
        else
        {

#line 460
        }

#line 460
    }

#line 460
    float3 _S4366 = Camera_getPosition_0(gScene_0.camera_0);

#line 510
    float2 _S4367 = float2(frameDim_6);

#line 510
    float3 _S4368 = s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(_S4360.primal_0, _s_diff_ctx_32._S1138, _S4367);

#line 510
    DiffRay_0 _S4369 = s_bwd_primal_DiffRay_x24init_0(_S4366, _S4368, globalPixel_14);

#line 510
    IntersectionInfo_0 _S4370;

#line 510
    _S4370.triangleID_2 = 0U;

#line 510
    _S4370.instanceID_7 = _S4359;

#line 510
    _S4370.barycentrics_2 = _S4358;

#line 510
    _S4370.normalW_2 = _S4358;

#line 510
    _S4370.posW_5 = _S4358;

#line 510
    _S4370.hitT_5 = 0.0;

#line 510
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S4371;

#line 510
    _S4371._S1548 = _S4356;

#line 510
    _S4371.isHit_1 = false;

#line 510
    bool _S4372 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4360.primal_0, _S4369, _S4370, int(0), _S4371);

#line 510
    IntersectionInfo_0 _S4373 = _S4370;
    bool _S4374 = !_S4372;

#line 511
    bool _bflag_10;

#line 511
    bool _bflag_11;

#line 511
    int _dc_2;

#line 511
    if(!_S4374)
    {

#line 511
        BSDFProperties_0 _S4375 = { _S4358, 0.0, _S4358, 0U, _S4358, _S4358, _S4358, _S4358, _S4358 };

#line 511
        s_bwd_temporaryBsdfEval_Intermediates_0 _S4376 = { _S4375 };

#line 511
        uint2 _S4377 = (uint2)0U;

#line 511
        DiffRay_0 _S4378 = { _S4358, _S4358, _S4377 };

#line 511
        DiffPair_float_0 _S4379 = { 0.0, 0.0 };

#line 511
        DiffPair_float_0  _S4380[int(18)] = { _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379, _S4379 };

#line 511
        s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _S4381 = { 0.0 };

#line 511
        s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0  _S4382[int(18)] = { _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381, _S4381 };

#line 511
        float3  _S4383[int(18)] = { _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358, _S4358 };

#line 511
        int  _S4384[int(18)] = { int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0), int(0) };

#line 511
        float3  _S4385[int(3)] = { _S4358, _S4358, _S4358 };

#line 511
        float  _S4386[int(3)] = { 0.0, 0.0, 0.0 };

#line 511
        float  _S4387[int(16)] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

#line 511
        s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S4388 = { _S4380, _S4382, _S4380, _S4382, _S4380, _S4382, _S4383, _S4383, int(0), _S4384, _S4385, _S4385, _S4386, _S4386, int(0), _S4387, _S4384 };

#line 511
        DiffPair_array_float3_0 _S4389 = { _S4385, _S4385 };

#line 511
        uint  _S4390[int(4)] = { 0U, 0U, 0U, 0U };

#line 511
        Xoshiro128StarStar_0 _S4391 = { _S4390 };

#line 511
        UniformSampleGenerator_0 _S4392 = { _S4391 };

#line 511
        s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S4393 = { _S4388, _S4389, _S4392, false };

#line 511
        s_diff_s_diff_SceneDerivativeFlags_0 _S4394 = { int(0) };

#line 511
        s_bwd_reparameterizeRay_Intermediates_0 _S4395 = { _S4393, _S4389, _S4392, _S4394 };

#line 511
        BSDFSample_0 _S4396 = { _S4358, 0.0, _S4358, 0U };

#line 511
        PathData_0 _S4397 = { _S4358, _S4358, 0U, false };

#line 511
        s_bwd_generateScatterRay_Intermediates_0 _S4398 = { _S4358, _S4376, _S4378, _S4395, 0.0, _S4392, _S4396, _S4378, _S4397, false };

#line 511
        s_bwd_computeNEE_Intermediates_0 _S4399 = { _S4376, _S4378, _S4395, 0.0, _S4392, _S4397, _S4358 };

#line 511
        LightSample_0 _S4400 = { _S4358, 0.0, _S4358, 0.0, _S4358, _S4358, _S4358 };

#line 511
        ShadingFrame_0 _S4401 = { _S4358, _S4358, _S4358 };

#line 511
        MaterialHeader_0 _S4402 = { _S4377 };

#line 511
        ShadingData_0 _S4403 = { _S4358, _S4358, (float2)0.0, _S4401, _S4358, (float4)0.0, false, 0.0, 0.0, _S4402, 0U, 0.0, 0.0, 0U, 0U, 0U };

#line 511
        AnyValue128 _S4404 = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U };

#line 511
        Tuple_0 _S4405 = { _S4377, _S4377, _S4404 };

#line 511
        _bflag_10 = true;

#line 511
        IntersectionInfo_0 isectInfo_2 = _S4373;

#line 511
        UniformSampleGenerator_0 _S4406 = sg_38;

#line 511
        DiffRay_0 currentRay_1 = _S4369;

#line 511
        _dc_2 = int(0);

#line 511
        for(;;)
        {

#line 511
            if(!pathData_1.terminated_0 && _bflag_10)
            {
            }
            else
            {

#line 511
                break;
            }

#line 511
            UniformSampleGenerator_0 _S4407 = _S4406;

#line 511
            PathData_0 _S4408 = pathData_1;

#line 511
            DiffRay_0 _S4409 = currentRay_1;

#line 511
            s_bwd_handleHit_Intermediates_0 _S4410;

#line 511
            _S4410._S1089 = false;

#line 511
            _S4410._S1090 = _S4398;

#line 511
            _S4410._S1091 = _S4397;

#line 511
            _S4410._S1092 = _S4378;

#line 511
            _S4410._S1093 = _S4392;

#line 511
            _S4410._S1094 = _S4399;

#line 511
            _S4410._S1095 = _S4397;

#line 511
            _S4410._S1096 = _S4392;

#line 511
            _S4410._S1097 = false;

#line 511
            _S4410._S1098 = false;

#line 511
            _S4410._S1099 = _S4400;

#line 511
            _S4410._S1100 = _S4375;

#line 511
            _S4410._S1101 = _S4397;

#line 511
            _S4410._S1102 = _S4378;

#line 511
            _S4410.sd_8 = _S4403;

#line 511
            _S4410._S1103 = _S4405;

#line 511
            s_bwd_primal_handleHit_0(_S4360.primal_0, isectInfo_2, _S4408, _S4409, _S4407, true, _S4410);

#line 511
            PathData_0 _S4411 = _S4408;

#line 511
            DiffRay_0 _S4412 = _S4409;

#line 511
            UniformSampleGenerator_0 _S4413 = _S4407;

#line 511
            if(_S4408.terminated_0)
            {

#line 511
                _bflag_11 = false;

#line 511
            }
            else
            {

#line 511
                _bflag_11 = _bflag_10;

#line 511
            }

#line 511
            if(_bflag_11)
            {

#line 511
                IntersectionInfo_0 _S4414;

#line 511
                _S4414.triangleID_2 = 0U;

#line 511
                _S4414.instanceID_7 = _S4359;

#line 511
                _S4414.barycentrics_2 = _S4358;

#line 511
                _S4414.normalW_2 = _S4358;

#line 511
                _S4414.posW_5 = _S4358;

#line 511
                _S4414.hitT_5 = 0.0;

#line 511
                s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S4415;

#line 511
                _S4415._S1548 = _S4356;

#line 511
                _S4415.isHit_1 = false;

#line 511
                bool _S4416 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4360.primal_0, _S4412, _S4414, int(0), _S4415);

#line 511
                IntersectionInfo_0 _S4417 = _S4414;

#line 511
                bool _bflag_12;

#line 511
                if(!_S4416)
                {

#line 511
                    _bflag_12 = false;

#line 511
                }
                else
                {

#line 511
                    _bflag_12 = _bflag_11;

#line 511
                }

#line 511
                _bflag_10 = _bflag_12;

#line 511
                isectInfo_2 = _S4417;

#line 511
            }
            else
            {

#line 511
                _bflag_10 = _bflag_11;

#line 511
            }

#line 511
            int _S4418 = _dc_2 + int(1);

#line 511
            pathData_1 = _S4411;

#line 511
            _S4406 = _S4413;

#line 511
            currentRay_1 = _S4412;

#line 511
            _dc_2 = _S4418;

#line 511
        }

#line 511
    }
    else
    {

#line 511
    }

#line 511
    float2 _S4419 = (float2)0.0;

#line 511
    float3 _S4420 = (float3)_s_diff_ctx_32._S1135;

#line 511
    float3 _S4421;

#line 511
    if(isEdgePath_1)
    {

#line 511
        float3 _S4422 = (float3)s_bwd_dot_1(_S4362.primal_0, _S4419);

#line 511
        _bflag_10 = false;

#line 511
        _S4421 = _S4422;

#line 511
    }
    else
    {

#line 511
        _bflag_10 = !CB_0.gDisableDivergence_0;

#line 511
        _S4421 = _S4358;

#line 511
    }

#line 511
    IntersectionInfo_0 _S4423;

#line 511
    _S4423.triangleID_2 = 0U;

#line 511
    _S4423.instanceID_7 = _S4359;

#line 511
    _S4423.barycentrics_2 = _S4358;

#line 511
    _S4423.normalW_2 = _S4358;

#line 511
    _S4423.posW_5 = _S4358;

#line 511
    _S4423.hitT_5 = 0.0;

#line 511
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _S4424;

#line 511
    _S4424._S1548 = _S4356;

#line 511
    _S4424.isHit_1 = false;

#line 511
    bool _S4425 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4360.primal_0, _S4369, _S4423, int(0), _S4424);

#line 511
    bool _S4426 = !_S4425;

#line 511
    s_diff_PathData_0 _S4427 = PathData_x24_syn_dzero_0();

#line 511
    s_diff_s_diff_DiffRay_0 _S4428 = DiffRay_x24_syn_dzero_0();

#line 511
    s_diff_s_diff_IntersectionInfo_0 _S4429 = IntersectionInfo_x24_syn_dzero_0();

#line 511
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4430 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 511
    float3 _S4431;

#line 511
    s_diff_PathData_0 _S4432;

#line 511
    s_diff_s_diff_IntersectionInfo_0 _S4433;

#line 511
    s_diff_s_diff_DiffRay_0 _S4434;

#line 511
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4435;

#line 511
    if(!_S4426)
    {

#line 511
        s_diff_PathData_0 _S4436 = _S4427;

#line 511
        _S4436.radiance_0 = _s_dOut_29;

#line 511
        s_diff_PathData_0 _S4437 = PathData_x24_syn_dadd_0(_S4427, _S4436);

#line 511
        _dc_2 = _s_diff_ctx_32._S1131 - int(1);

#line 511
        _S4432 = _S4437;

#line 511
        _S4433 = _S4429;

#line 511
        _S4434 = _S4428;

#line 511
        _S4435 = _S4430;

#line 511
        for(;;)
        {

#line 511
            if(_dc_2 >= int(0))
            {
            }
            else
            {

#line 511
                break;
            }

#line 511
            int _S4438 = _dc_2;

#line 511
            int _S4439 = _dc_2;

#line 511
            if(_s_diff_ctx_32._S1129[_dc_2].terminated_0)
            {

#line 511
                _bflag_11 = false;

#line 511
            }
            else
            {

#line 511
                _bflag_11 = _s_diff_ctx_32._S1133[_dc_2];

#line 511
            }

#line 511
            if(_bflag_11)
            {

#line 511
                IntersectionInfo_0 _S4440;

#line 511
                _S4440.triangleID_2 = 0U;

#line 511
                _S4440.instanceID_7 = _S4359;

#line 511
                _S4440.barycentrics_2 = _S4358;

#line 511
                _S4440.normalW_2 = _S4358;

#line 511
                _S4440.posW_5 = _S4358;

#line 511
                _S4440.hitT_5 = 0.0;

#line 511
                bool _S4441 = s_bwd_primal_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4360.primal_0, _s_diff_ctx_32._S1128[_S4439], _S4440, int(0), _S4357);

#line 511
            }
            else
            {

#line 511
            }

#line 511
            s_diff_s_diff_IntersectionInfo_0 _S4442;

#line 511
            s_diff_s_diff_DiffRay_0 _S4443;

#line 511
            s_diff_s_diff_DifferentiableSceneQuery_0 _S4444;

#line 511
            if(_bflag_11)
            {

#line 511
                s_diff_s_diff_IntersectionInfo_0 _S4445 = IntersectionInfo_x24_syn_dadd_0(_S4429, _S4433);

#line 511
                DiffPair_DifferentiableSceneQuery_0 _S4446;

#line 511
                _S4446.primal_0 = _S4360.primal_0;

#line 511
                _S4446.differential_0 = _S4430;

#line 511
                DiffPair_DiffRay_0 _S4447;

#line 511
                _S4447.primal_0 = _s_diff_ctx_32._S1128[_S4439];

#line 511
                _S4447.differential_0 = _S4428;

#line 511
                s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4446, _S4447, _S4445, int(0), _S4357);

#line 511
                s_diff_s_diff_DifferentiableSceneQuery_0 _S4448 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4446.differential_0, _S4435);

#line 511
                _S4443 = DiffRay_x24_syn_dadd_0(_S4447.differential_0, _S4434);

#line 511
                _S4442 = _S4429;

#line 511
                _S4444 = _S4448;

#line 511
            }
            else
            {

#line 511
                s_diff_s_diff_IntersectionInfo_0 _S4449 = IntersectionInfo_x24_syn_dadd_0(_S4433, _S4429);

#line 511
                _S4443 = _S4434;

#line 511
                _S4442 = _S4449;

#line 511
                _S4444 = _S4435;

#line 511
            }

#line 511
            s_diff_s_diff_DiffRay_0 _S4450 = DiffRay_x24_syn_dadd_0(_S4428, _S4443);

#line 511
            s_diff_PathData_0 _S4451 = PathData_x24_syn_dadd_0(_S4427, _S4432);

#line 511
            DiffPair_DifferentiableSceneQuery_0 _S4452;

#line 511
            _S4452.primal_0 = _S4360.primal_0;

#line 511
            _S4452.differential_0 = _S4430;

#line 511
            DiffPair_IntersectionInfo_0 _S4453;

#line 511
            _S4453.primal_0 = _s_diff_ctx_32._S1132[_dc_2];

#line 511
            _S4453.differential_0 = _S4429;

#line 511
            DiffPair_PathData_0 _S4454;

#line 511
            _S4454.primal_0 = _s_diff_ctx_32._S1129[_S4438];

#line 511
            _S4454.differential_0 = _S4451;

#line 511
            DiffPair_DiffRay_0 _S4455;

#line 511
            _S4455.primal_0 = _s_diff_ctx_32._S1128[_S4439];

#line 511
            _S4455.differential_0 = _S4450;

#line 511
            s_bwd_handleHit_0(_S4452, _S4453, _S4454, _S4455, _s_diff_ctx_32._S1130[_dc_2], true, _s_diff_ctx_32._S1127[_dc_2]);

#line 511
            s_diff_s_diff_IntersectionInfo_0 _S4456 = IntersectionInfo_x24_syn_dadd_0(_S4453.differential_0, _S4442);

#line 511
            s_diff_PathData_0 _S4457 = PathData_x24_syn_dadd_0(PathData_x24_syn_dadd_0(_S4454.differential_0, _S4427), _S4427);

#line 511
            s_diff_s_diff_DiffRay_0 _S4458 = DiffRay_x24_syn_dadd_0(DiffRay_x24_syn_dadd_0(_S4455.differential_0, _S4428), _S4428);

#line 511
            s_diff_s_diff_DifferentiableSceneQuery_0 _S4459 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4452.differential_0, _S4444);

#line 511
            _dc_2 = _dc_2 - int(1);

#line 511
            _S4432 = _S4457;

#line 511
            _S4433 = _S4456;

#line 511
            _S4434 = _S4458;

#line 511
            _S4435 = _S4459;

#line 511
        }

#line 511
        s_diff_s_diff_DiffRay_0 _S4460 = DiffRay_x24_syn_dadd_0(_S4434, _S4428);

#line 511
        s_diff_PathData_0 _S4461 = PathData_x24_syn_dadd_0(_S4432, _S4427);

#line 511
        _S4431 = _S4358;

#line 511
        _S4432 = _S4461;

#line 511
        _S4434 = _S4460;

#line 511
    }
    else
    {

#line 511
        _S4431 = _s_dOut_29;

#line 511
        _S4432 = _S4427;

#line 511
        _S4433 = _S4429;

#line 511
        _S4434 = _S4428;

#line 511
        _S4435 = _S4430;

#line 511
    }

#line 511
    if(_S4426)
    {

#line 511
        s_diff_PathData_0 _S4462 = _S4427;

#line 511
        _S4462.radiance_0 = _S4431;

#line 511
        _S4432 = PathData_x24_syn_dadd_0(_S4432, _S4462);

#line 511
    }
    else
    {

#line 511
    }

#line 511
    s_diff_s_diff_IntersectionInfo_0 _S4463 = IntersectionInfo_x24_syn_dadd_0(_S4429, _S4433);

#line 511
    DiffPair_DifferentiableSceneQuery_0 _S4464;

#line 511
    _S4464.primal_0 = _S4360.primal_0;

#line 511
    _S4464.differential_0 = _S4430;

#line 511
    DiffPair_DiffRay_0 _S4465;

#line 511
    _S4465.primal_0 = _S4369;

#line 511
    _S4465.differential_0 = _S4428;

#line 511
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_0(_S4464, _S4465, _S4463, int(0), _S4424);

#line 511
    s_diff_s_diff_DiffRay_0 _S4466 = DiffRay_x24_syn_dadd_0(_S4465.differential_0, _S4434);

#line 511
    DiffPair_float3_0 _S4467;

#line 511
    _S4467.primal_0 = _S4366;

#line 511
    _S4467.differential_0 = _S4358;

#line 511
    DiffPair_float3_0 _S4468;

#line 511
    _S4468.primal_0 = _S4368;

#line 511
    _S4468.differential_0 = _S4358;

#line 511
    s_bwd_DiffRay_x24init_0(_S4467, _S4468, globalPixel_14, _S4466);

#line 511
    DiffPair_DifferentiableSceneQuery_0 _S4469;

#line 511
    _S4469.primal_0 = _S4360.primal_0;

#line 511
    _S4469.differential_0 = _S4430;

#line 511
    DiffPair_float2_0 _S4470;

#line 511
    _S4470.primal_0 = _s_diff_ctx_32._S1138;

#line 511
    _S4470.differential_0 = _S4419;

#line 511
    DiffPair_float2_0 _S4471;

#line 511
    _S4471.primal_0 = _S4367;

#line 511
    _S4471.differential_0 = _S4419;

#line 511
    s_bwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S4469, _S4470, _S4471, _S4468.differential_0);

#line 511
    DiffPair_float2_0 _S4472 = _S4470;

#line 511
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4473 = DifferentiableSceneQuery_x24_syn_dadd_0(DifferentiableSceneQuery_x24_syn_dadd_0(_S4464.differential_0, _S4469.differential_0), _S4435);

#line 511
    float2 _S4474;

#line 511
    float2 _S4475;

#line 511
    if(isEdgePath_1)
    {

#line 511
        s_diff_PathData_0 _S4476 = _S4432;

#line 511
        _S4432.thp_0 = _S4358;

#line 511
        float3 _S4477 = _S4365 * _S4476.thp_0;

#line 511
        float3 _S4478 = _S4421 * _S4476.thp_0;

#line 483 "core.meta.slang"
        float _S4479 = _S4477[int(0)] + _S4477[int(1)] + _S4477[int(2)];

#line 483
        DiffPair_float2_0 _S4480;

#line 483
        _S4480.primal_0 = _S4362.primal_0;

#line 483
        _S4480.differential_0 = _S4419;

#line 483
        DiffPair_float2_0 _S4481;

#line 483
        _S4481.primal_0 = _S4419;

#line 483
        _S4481.differential_0 = _S4419;

#line 483
        s_bwd_dot_3(_S4480, _S4481, _S4479);

#line 1189
        float2 _S4482 = _S4481.differential_0 + _S4472.differential_0;

#line 1189
        _S4432 = PathData_x24_syn_dadd_0(_S4432, _S4427);

#line 1189
        _S4421 = _S4478;

#line 1189
        _S4431 = _S4358;

#line 1189
        _S4474 = _S4482;

#line 1189
        _S4475 = _S4480.differential_0;

#line 1189
    }
    else
    {

#line 1189
        if(_bflag_10)
        {

#line 1189
            s_diff_PathData_0 _S4483 = _S4432;

#line 1189
            _S4432.thp_0 = _S4358;

#line 1189
            float3 _S4484 = _S4365 * _S4483.thp_0;

#line 1189
            float3 _S4485 = _S4420 * _S4483.thp_0;

#line 1189
            _S4432 = PathData_x24_syn_dadd_0(_S4432, _S4427);

#line 1189
            _S4421 = _S4485;

#line 1189
            _S4431 = _S4484;

#line 1189
        }
        else
        {

#line 1189
            _S4432 = PathData_x24_syn_dadd_0(_S4432, _S4427);

#line 1189
            _S4421 = _S4358;

#line 1189
            _S4431 = _S4358;

#line 1189
        }

#line 1189
        _S4474 = _S4472.differential_0;

#line 1189
        _S4475 = _S4419;

#line 1189
    }

#line 1189
    float3 _S4486 = _s_diff_ctx_32._S1137.thp_1 * (_S4432.thp_0 + _S4421);

#line 1189
    float _S4487 = (_S4486[int(0)] + _S4486[int(1)] + _S4486[int(2)]) / _s_diff_ctx_32._S1139;

#line 1189
    DiffPair_float2_0 _S4488;

#line 1189
    _S4488.primal_0 = _S4363;

#line 1189
    _S4488.differential_0 = _S4419;

#line 1189
    s_bwd_evalGaussian_0(_S4488, 0.5, 2.0, _S4487);

#line 483
    float _S4489 = _S4431[int(0)] + _S4431[int(1)] + _S4431[int(2)];

#line 1189
    float2 _S4490 = _S4488.differential_0 + _S4474;

#line 1189
    DiffPair_DifferentiableSceneQuery_0 _S4491;

#line 1189
    _S4491.primal_0 = _S4360.primal_0;

#line 1189
    _S4491.differential_0 = _S4430;

#line 1189
    DiffPair_float2_0 _S4492;

#line 1189
    _S4492.primal_0 = _S4361.primal_0;

#line 1189
    _S4492.differential_0 = _S4419;

#line 1189
    s_bwd_reparameterizeScreenSample_0(_S4491, _S4492, frameDim_6, globalPixel_14, _s_diff_ctx_32._S1136, _S4489, _S4490, _s_diff_ctx_32._S1134);

#line 1189
    dporientation_1.primal_0 = dporientation_1.primal_0;

#line 1189
    dporientation_1.differential_0 = _S4475;

#line 1189
    dppixel_1.primal_0 = dppixel_1.primal_0;

#line 1189
    dppixel_1.differential_0 = _S4492.differential_0;

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4493 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4491.differential_0, _S4473);

#line 1189
    dpsceneQuery_8.primal_0 = dpsceneQuery_8.primal_0;

#line 1189
    dpsceneQuery_8.differential_0 = _S4493;

#line 1189
    return;
}


#line 1189
void s_bwd_FalcorSceneIO_loadCameraPositionW_0(inout DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 dpmode_1, float3 _s_dOut_30)
{

#line 1189
    s_diff_s_diff_SceneDerivativeFlags_0 _S4494 = SceneDerivativeFlags_dzero_0();

#line 1189
    dpmode_1.primal_0 = dpmode_1.primal_0;

#line 1189
    dpmode_1.differential_0 = _S4494;

#line 1189
    return;
}


#line 1189
void s_bwd_DifferentiableSceneQuery_loadCameraPosition_0(inout DiffPair_DifferentiableSceneQuery_0 dpthis_13, float3 _s_dOut_31)
{

#line 1189
    s_diff_s_diff_SceneDerivativeFlags_0 _S4495 = SceneDerivativeFlags_dzero_0();

#line 1189
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 _S4496;

#line 1189
    _S4496.primal_0 = dpthis_13.primal_0.gradientFlags_1;

#line 1189
    _S4496.differential_0 = _S4495;

#line 1189
    s_bwd_FalcorSceneIO_loadCameraPositionW_0(_S4496, _s_dOut_31);

#line 1189
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4497 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1189
    _S4497.gradientFlags_0 = _S4496.differential_0;

#line 1189
    dpthis_13.primal_0 = dpthis_13.primal_0;

#line 1189
    dpthis_13.differential_0 = _S4497;

#line 1189
    return;
}


#line 1189
void s_bwd_tracePaths_0(inout DiffPair_DifferentiableSceneQuery_0 dpsceneQuery_9, uint2 pixel_15, uint2 frameDim_7, uint2 globalPixel_15, float3 _s_dOut_32, s_bwd_tracePaths_Intermediates_0 _s_diff_ctx_33)
{

#line 542 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
    DiffPair_DifferentiableSceneQuery_0 _S4498 = dpsceneQuery_9;

#line 542
    float3 _S4499 = s_bwd_primal_DifferentiableSceneQuery_loadCameraPosition_0(dpsceneQuery_9.primal_0);

#line 542
    uint _S4500 = CB_0.gFrameCount_0;

#line 542
    bool _S4501 = CB_0.gUseFixedSeed_0;

#line 542
    uint _S4502 = CB_0.gFixedSeed_0;

#line 542
    uint frameSeed_1;

#line 542
    if(CB_0.gUseFixedSeed_0)
    {

#line 542
        frameSeed_1 = _S4502;

#line 542
    }
    else
    {

#line 542
        frameSeed_1 = _S4500;

#line 542
    }

#line 542
    float2 pixelf_1 = float2(pixel_15) + float2(0.5, 0.5);

#line 542
    float2 jitter2D_1;

#line 542
    if(frameSeed_1 % 2U == 0U)
    {

#line 542
        jitter2D_1 = - _s_diff_ctx_33._S1145;

#line 542
    }
    else
    {

#line 542
        jitter2D_1 = _s_diff_ctx_33._S1145;

#line 542
    }

#line 585
    float2 _S4503 = float2(frameDim_7);

#line 585
    float3 _S4504 = s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(_S4498.primal_0, pixelf_1 + jitter2D_1, _S4503);

#line 585
    HitInfo_0 _S4505 = HitInfo_x24init_0();

#line 585
    if(_s_diff_ctx_33._S1146)
    {

#line 585
        TriangleHit_0 triHit_2 = HitInfo_getTriangleHit_0(_S4505);

#line 585
        IntersectionInfo_0 _S4506 = s_bwd_primal_IntersectionInfo_x24init_0();

#line 585
        _S4506.triangleID_2 = triHit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 585
        _S4506.instanceID_7 = triHit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 585
        float3 _S4507 = GeometryHit_getBarycentricWeights_0(triHit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit);

#line 585
        _S4506.barycentrics_2 = _S4507;

#line 585
        _S4506.normalW_2 = s_bwd_primal_DifferentiableSceneQuery_computeShadingNormal_0(_S4498.primal_0, triHit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2, triHit_2._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0, _S4507);

#line 585
        gBoundaryTerm_0[globalPixel_15] = (float4)computeBoundaryTermMitsuba_0(_S4506, _S4499, _S4504);

#line 585
    }
    else
    {

#line 585
    }

#line 585
    float2 _S4508 = float2(0.0, 0.0);

#line 585
    if(_S4501)
    {

#line 585
        frameSeed_1 = _S4502;

#line 585
    }
    else
    {

#line 585
        frameSeed_1 = _S4500;

#line 585
    }

#line 585
    if(frameSeed_1 % 2U == 0U)
    {

#line 585
        jitter2D_1 = - _s_diff_ctx_33._S1145;

#line 585
    }
    else
    {

#line 585
        jitter2D_1 = _s_diff_ctx_33._S1145;

#line 585
    }

#line 585
    float2 _S4509 = pixelf_1 + jitter2D_1;

#line 585
    float3 _S4510 = s_bwd_primal_DifferentiableSceneQuery_computeCameraRayDirection_0(_S4498.primal_0, _S4509, _S4503);

#line 585
    GeometryInstanceID_0 _S4511;

#line 585
    if(_s_diff_ctx_33._S1146)
    {

#line 585
        frameSeed_1 = _s_diff_ctx_33._S1143._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.primitiveIndex_0;

#line 585
        _S4511 = _s_diff_ctx_33._S1143._SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit.instanceID_2;

#line 585
    }
    else
    {

#line 585
        frameSeed_1 = 0U;

#line 585
        _S4511.index_0 = 0U;

#line 585
    }

#line 1182 "core.meta.slang"
    float3 _S4512 = (float3)0.0;

#line 1182
    float2 _S4513 = (float2)0.0;

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4514 = DifferentiableSceneQuery_x24_syn_dzero_0();

#line 1182
    s_diff_s_diff_DiffRay_0 _S4515 = DiffRay_x24_syn_dzero_0();

#line 1182
    DiffPair_DifferentiableSceneQuery_0 _S4516;

#line 1182
    _S4516.primal_0 = _S4498.primal_0;

#line 1182
    _S4516.differential_0 = _S4514;

#line 1182
    DiffPair_float2_0 _S4517;

#line 1182
    _S4517.primal_0 = _S4509;

#line 1182
    _S4517.differential_0 = _S4513;

#line 1182
    DiffPair_float2_0 _S4518;

#line 1182
    _S4518.primal_0 = _S4508;

#line 1182
    _S4518.differential_0 = _S4513;

#line 1182
    s_bwd_tracePath_0(_S4516, _S4517, _S4518, pixelf_1, frameDim_7, globalPixel_15, _s_diff_ctx_33._S1141, false, _s_dOut_32, _s_diff_ctx_33._S1140);

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4519 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4516.differential_0, _S4514);

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4520;

#line 1182
    if(_s_diff_ctx_33._S1146)
    {

#line 1182
        s_diff_s_diff_IntersectionInfo_0 _S4521 = IntersectionInfo_x24_syn_dzero_0();

#line 1182
        DiffPair_DifferentiableSceneQuery_0 _S4522;

#line 1182
        _S4522.primal_0 = _S4498.primal_0;

#line 1182
        _S4522.differential_0 = _S4514;

#line 1182
        DiffPair_float3_0 _S4523;

#line 1182
        _S4523.primal_0 = _s_diff_ctx_33._S1142;

#line 1182
        _S4523.differential_0 = _S4512;

#line 1182
        s_bwd_DifferentiableSceneQuery_computeShadingNormal_0(_S4522, _S4511, frameSeed_1, _S4523, _S4521.normalW_0);

#line 1182
        _S4520 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4522.differential_0, _S4519);

#line 1182
    }
    else
    {

#line 1182
        _S4520 = _S4519;

#line 1182
    }

#line 1182
    DiffPair_float3_0 _S4524;

#line 1182
    _S4524.primal_0 = _S4499;

#line 1182
    _S4524.differential_0 = _S4512;

#line 1182
    DiffPair_float3_0 _S4525;

#line 1182
    _S4525.primal_0 = _S4510;

#line 1182
    _S4525.differential_0 = _S4512;

#line 1182
    s_bwd_DiffRay_x24init_0(_S4524, _S4525, globalPixel_15, _S4515);

#line 1182
    DiffPair_float3_0 _S4526 = _S4524;

#line 1182
    DiffPair_DifferentiableSceneQuery_0 _S4527;

#line 1182
    _S4527.primal_0 = _S4498.primal_0;

#line 1182
    _S4527.differential_0 = _S4514;

#line 1182
    DiffPair_float2_0 _S4528;

#line 1182
    _S4528.primal_0 = _S4509;

#line 1182
    _S4528.differential_0 = _S4513;

#line 1182
    DiffPair_float2_0 _S4529;

#line 1182
    _S4529.primal_0 = _S4503;

#line 1182
    _S4529.differential_0 = _S4513;

#line 1182
    s_bwd_DifferentiableSceneQuery_computeCameraRayDirection_0(_S4527, _S4528, _S4529, _S4525.differential_0);

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4530 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4527.differential_0, _S4520);

#line 1182
    DiffPair_DifferentiableSceneQuery_0 _S4531;

#line 1182
    _S4531.primal_0 = _S4498.primal_0;

#line 1182
    _S4531.differential_0 = _S4514;

#line 1182
    s_bwd_DifferentiableSceneQuery_loadCameraPosition_0(_S4531, _S4526.differential_0);

#line 1182
    s_diff_s_diff_DifferentiableSceneQuery_0 _S4532 = DifferentiableSceneQuery_x24_syn_dadd_0(_S4531.differential_0, _S4530);

#line 1182
    dpsceneQuery_9.primal_0 = dpsceneQuery_9.primal_0;

#line 1182
    dpsceneQuery_9.differential_0 = _S4532;

#line 1182
    return;
}


#line 1182
void s_bwd_tracePaths_1(inout DiffPair_DifferentiableSceneQuery_0 _S4533, uint2 _S4534, uint2 _S4535, uint2 _S4536, float3 _S4537)
{

#line 1182
    s_bwd_tracePaths_Intermediates_0 _S4538;

#line 1182
    float3 _S4539 = s_bwd_primal_tracePaths_0(_S4533.primal_0, _S4534, _S4535, _S4536, _S4538);

#line 1182
    s_bwd_tracePaths_0(_S4533, _S4534, _S4535, _S4536, _S4537, _S4538);

#line 1182
    return;
}


#line 686 "C:/Falcor/build/python-3.8/bin/Release/shaders/RenderPasses/MinimalWASPathTracer/Checkpoint-MinimalWASPathTracer.rt.slang"
[shader("raygeneration")]void rayGen()
{
    uint3 _S4540 = DispatchRaysIndex();

#line 688
    uint2 globalPixel_16 = _S4540.xy;
    uint3 _S4541 = DispatchRaysDimensions();

#line 689
    uint2 fullFrameDim_0 = _S4541.xy;


    uint2 pixel_16 = globalPixel_16 / CB_0.gSubpixelCount_0;


    uint2 frameDim_8 = fullFrameDim_0 / CB_0.gSubpixelCount_0;

#line 700
    if(globalPixel_16.x >= frameDim_8.x * CB_0.gSubpixelCount_0 || globalPixel_16.y >= frameDim_8.y * CB_0.gSubpixelCount_0)
    {

#line 701
        return;
    }

#line 762
    s_diff_s_diff_SceneDerivativeFlags_0 _S4542 = SceneDerivativeFlags_make_0(int(1));

#line 762
    DifferentiableSceneQuery_0 _S4543 = DifferentiableSceneQuery_x24init_0(_S4542);

    s_diff_s_diff_DifferentiableSceneQuery_0 diffSceneQuery_0;
    diffSceneQuery_0.gradientFlags_0 = _S4542;

    DiffPair_DifferentiableSceneQuery_0 dpSceneQuery_0;

#line 767
    dpSceneQuery_0.primal_0 = _S4543;

#line 767
    dpSceneQuery_0.differential_0 = diffSceneQuery_0;
    s_bwd_tracePaths_1(dpSceneQuery_0, pixel_16, frameDim_8, globalPixel_16, float3(1.0, 0.0, 0.0));

#line 775
    float4 _S4544 = gOutputDColor_0[globalPixel_16];
    gOutputDColor_0[globalPixel_16] = float4(_S4544.xyz, 1.0);

    return;
}

