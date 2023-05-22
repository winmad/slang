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

struct LightCollection_0
{
    uint triangleCount_0;
    uint activeTriangleCount_0;
    uint meshCount_0;
};

struct LightProfile_0
{
    float fluxFactor_0;
};

struct EnvMapData_0
{
    float3 tint_0;
    float intensity_0;
};

struct EnvMap_0
{
    EnvMapData_0 data_0;
};

struct CameraData_0
{
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

struct Camera_0
{
    CameraData_0 data_1;
};

struct Grid_0
{
    int3 minIndex_0;
    float minValue_0;
    int3 maxIndex_0;
    float maxValue_0;
};

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

struct _S1
{
};

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

struct PackedStaticVertexData_0
{
    float3 position_0;
    float3 packedNormalTangentCurveRadius_0;
    float2 texCrd_0;
};

struct PrevVertexData_0
{
    float3 position_1;
};

struct CurveDesc_0
{
    uint vbOffset_2;
    uint ibOffset_2;
    uint vertexCount_1;
    uint indexCount_1;
    uint degree_0;
    uint materialID_2;
};

struct StaticCurveVertexData_0
{
    float3 position_2;
    float radius_0;
    float2 texCrd_1;
};

struct DynamicCurveVertexData_0
{
    float3 position_3;
};

struct AABB_0
{
    float3 minPoint_0;
    float3 maxPoint_0;
};

struct CustomPrimitiveDesc_0
{
    uint userID_0;
    uint aabbOffset_0;
};

struct MaterialHeader_0
{
    uint2 packedData_0;
};

struct MaterialPayload_0
{
    uint  data_2[int(30)];
};

struct MaterialDataBlob_0
{
    MaterialHeader_0 header_0;
    MaterialPayload_0 payload_0;
};

struct NetworkParamStorageFP16_0
{
};

struct NetworkParamStorageFP32_0
{
    float4 a_1;
    float4 b_1;
};

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
};

struct PackedEmissiveTriangle_0
{
    float4  posAndTexCoords_0[int(3)];
    uint normal_0;
    uint area_0;
    uint materialID_3;
    uint lightIdx_0;
};

struct EmissiveFlux_0
{
    float flux_0;
    float3 averageRadiance_0;
};

struct MeshLightData_0
{
    uint instanceID_0;
    uint triangleOffset_0;
    uint triangleCount_1;
    uint materialID_4;
};

struct GridVolumeData_0
{
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

struct GridVolume_0
{
    GridVolumeData_0 data_3;
};

struct SLANG_ParameterGroup_ReparamCB_0
{
    uint gMaxFacesPerVertex_0;
    float gVMFConcentrationScreen_0;
    float gVMFConcentration_0;
    uint gAuxSampleCount_0;
    float gBoundaryTermBeta_0;
};

struct EmissiveUniformSampler_0
{
    uint4 _dummy_0;
};

struct PathTracerData_0
{
    EmissiveUniformSampler_0 emissiveSampler_0;
};

struct s_diff_s_diff_SceneDerivativeFlags_0
{
    int gradientMode_0;
};

struct s_diff_s_diff_DifferentiableSceneQuery_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 gradientFlags_0;
};

struct DifferentiableSceneQuery_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 gradientFlags_1;
};

struct s_diff_s_diff_DiffRay_0
{
    float3 origin_0;
    float3 direction_0;
};

struct s_diff_s_diff_IntersectionInfo_0
{
    float3 barycentrics_0;
    float3 normalW_0;
    float3 posW_2;
    float hitT_0;
};

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

struct Xoshiro128StarStar_0
{
    uint  state_0[int(4)];
};

struct UniformSampleGenerator_0
{
    Xoshiro128StarStar_0 rng_0;
};

struct SplitMix64_0
{
    uint64_t state_1;
};

struct DiffPair_float_0
{
    float primal_0;
    float differential_0;
};

struct DiffPair_float3_0
{
    float3 primal_0;
    float3 differential_0;
};

struct DiffPair_float2_0
{
    float2 primal_0;
    float2 differential_0;
};

struct HitInfo_0
{
    uint4 data_4;
};

struct GeometryInstanceID_0
{
    uint index_0;
};

struct GeometryHit_0
{
    GeometryInstanceID_0 instanceID_2;
    uint primitiveIndex_0;
    float2 barycentrics_1;
};

struct TriangleHit_0
{
    GeometryHit_0 _SR16Scene_2FxHitInfo11TriangleHitIR16Scene_2FxHitInfo11GeometryHit;
};

struct Ray_0
{
    float3 origin_1;
    float tMin_0;
    float3 dir_0;
    float tMax_0;
};

struct StaticVertexData_0
{
    float3 position_4;
    float3 normal_1;
    float4 tangent_1;
    float2 texCrd_2;
    float curveRadius_0;
};

struct AnyValue16
{
    uint field0_2;
    uint field1_2;
    uint field2_2;
    uint field3_2;
};

struct ExplicitLodTextureSampler_0
{
    float lod_0;
};

struct s_diff_ShadingFrame_0
{
    float3 T_0;
    float3 B_0;
    float3 N_0;
};

struct s_diff_ShadingData_0
{
    float3 V_0;
    float2 uv_0;
    s_diff_ShadingFrame_0 frame_0;
    float IoR_0;
};

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

struct Tuple_0
{
    uint2 value0_0;
    uint2 value1_0;
    AnyValue128 value2_0;
};

struct Tuple_1
{
    uint2 value0_1;
    uint2 value1_1;
    AnyValue16 value2_1;
};

struct MaterialBase_0
{
    MaterialHeader_0 header_1;
};

struct TextureHandle_0
{
    uint packedData_1;
};

struct BasicMaterialData_0
{
    uint flags_4;
    float emissiveFactor_0;
    float3 emissive_0;
    float displacementScale_0;
    float displacementOffset_0;
    TextureHandle_0 texBaseColor_0;
    TextureHandle_0 texSpecular_0;
    TextureHandle_0 texEmissive_0;
    TextureHandle_0 texNormalMap_0;
    TextureHandle_0 texTransmission_0;
    TextureHandle_0 texDisplacementMap_0;
};

struct PBRTDiffuseMaterial_0
{
    MaterialBase_0 _S3tu019PBRTDiffuseMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase;
    BasicMaterialData_0 data_5;
};

struct StandardMaterial_0
{
    MaterialBase_0 _S3tu116StandardMaterialIR35Rendering_2FxMaterials_2FxIMaterial12MaterialBase;
    BasicMaterialData_0 data_6;
};

struct DiffRay_0
{
    float3 origin_2;
    float3 direction_1;
    uint2 pixel_1;
};

struct DiffPair_s_diff_s_diff_SceneDerivativeFlags_0
{
    s_diff_s_diff_SceneDerivativeFlags_0 primal_0;
    s_diff_s_diff_SceneDerivativeFlags_0 differential_0;
};

struct IntersectionInfo_0
{
    uint triangleID_2;
    GeometryInstanceID_0 instanceID_7;
    float3 barycentrics_2;
    float3 normalW_2;
    float3 posW_5;
    float hitT_5;
};

struct s_diff_PathData_0
{
    float3 radiance_0;
    float3 thp_0;
};

struct DiffPair_float2x2_0
{
};

struct DiffPair_float3x3_0
{
};

struct ShadingFrame_0
{
    float3 T_1;
    float3 B_1;
    float3 N_2;
};

struct EmissiveTriangle_0
{
    float3  posW_6[int(3)];
    float2  texCoords_0[int(3)];
    float3 normal_3;
    float area_1;
    uint materialID_5;
    uint lightIdx_1;
};

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

struct PBRTDiffuseBSDF_0
{
    float3 albedo_1;
};

struct PBRTDiffuseMaterialInstance_0
{
    ShadingFrame_0 sf_1;
    PBRTDiffuseBSDF_0 bsdf_0;
};

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

struct StandardMaterialInstance_0
{
    ShadingFrame_0 sf_2;
    StandardBSDFData_0 data_7;
    float3 emission_1;
};

struct BSDFSample_0
{
    float3 wo_0;
    float pdf_2;
    float3 weight_0;
    uint lobeType_0;
};

struct FrostbiteDiffuseBRDF_0
{
    float3 albedo_2;
    float roughness_2;
};

struct LambertDiffuseBTDF_0
{
    float3 albedo_3;
};

struct SpecularMicrofacetBRDF_0
{
    float3 albedo_4;
    float alpha_2;
    uint activeLobes_0;
};

struct SpecularMicrofacetBSDF_0
{
    float3 transmissionAlbedo_0;
    float alpha_3;
    float eta_1;
    uint activeLobes_1;
};

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

struct DiffPair_DifferentiableSceneQuery_0
{
    DifferentiableSceneQuery_0 primal_0;
    s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};

struct s_bwd_temporaryBsdfEval_Intermediates_0
{
    BSDFProperties_0 _S1046;
};

struct s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0
{
    float boundaryTerm_0;
};

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

struct DiffPair_array_float3_0
{
    float3  primal_0[int(3)];
    float3  differential_0[int(3)];
};

struct s_bwd_s_fwd_computeWarpedRay_Intermediates_0
{
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _S1064;
    DiffPair_array_float3_0 _S1065;
    UniformSampleGenerator_0 _S1066;
    bool _S1067;
};

struct s_bwd_reparameterizeRay_Intermediates_0
{
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _S1068;
    DiffPair_array_float3_0 _S1069;
    UniformSampleGenerator_0 _S1070;
    s_diff_s_diff_SceneDerivativeFlags_0 _S1071;
};

struct PathData_0
{
    float3 radiance_1;
    float3 thp_1;
    uint length_0;
    bool terminated_0;
};

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

struct DiffPair_array_float3_1
{
    float3  primal_0[int(2)];
    float3  differential_0[int(2)];
};

struct s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0
{
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _S1119;
    DiffPair_array_float3_1 _S1120;
    UniformSampleGenerator_0 _S1121;
    bool _S1122;
};

struct DiffPair_array_float2_0
{
    float2  primal_0[int(2)];
    float2  differential_0[int(2)];
};

struct s_bwd_reparameterizeScreenSample_Intermediates_0
{
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _S1123;
    DiffPair_array_float2_0 _S1124;
    UniformSampleGenerator_0 _S1125;
    s_diff_s_diff_SceneDerivativeFlags_0 _S1126;
};

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

struct DiffPair_DiffRay_0
{
    DiffRay_0 primal_0;
    s_diff_s_diff_DiffRay_0 differential_0;
};

struct DiffPair_IntersectionInfo_0
{
    IntersectionInfo_0 primal_0;
    s_diff_s_diff_IntersectionInfo_0 differential_0;
};

struct s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0
{
    HitInfo_0 _S1199;
    bool isHit_0;
};

struct s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0
{
    float3 _S1205;
    TriangleHit_0 hit_8;
};

struct s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0
{
    HitInfo_0 _S1548;
    bool isHit_1;
};

struct s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0
{
    float3 _S1549;
    TriangleHit_0 hit_10;
};

struct DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0
{
    s_diff_s_diff_DifferentiableSceneQuery_0 primal_0;
    s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};

struct DiffPair_0
{
    DiffPair_DifferentiableSceneQuery_0 primal_0;
    DiffPair_s_diff_s_diff_DifferentiableSceneQuery_0 differential_0;
};

struct DiffPair_1
{
    DiffPair_float2_0 primal_0;
    DiffPair_float2_0 differential_0;
};

struct DiffPair_2
{
    DiffPair_array_float2_0 primal_0;
    DiffPair_array_float2_0 differential_0;
};

struct DiffPair_3
{
    DiffPair_float3_0 primal_0;
    DiffPair_float3_0 differential_0;
};

struct DiffPair_4
{
    DiffPair_float_0 primal_0;
    DiffPair_float_0 differential_0;
};

struct DiffPair_5
{
    DiffPair_array_float3_1 primal_0;
    DiffPair_array_float3_1 differential_0;
};

struct DiffPair_s_diff_s_diff_DiffRay_0
{
    s_diff_s_diff_DiffRay_0 primal_0;
    s_diff_s_diff_DiffRay_0 differential_0;
};

struct DiffPair_s_diff_s_diff_IntersectionInfo_0
{
    s_diff_s_diff_IntersectionInfo_0 primal_0;
    s_diff_s_diff_IntersectionInfo_0 differential_0;
};

struct DiffPair_6
{
    DiffPair_DiffRay_0 primal_0;
    DiffPair_s_diff_s_diff_DiffRay_0 differential_0;
};

struct DiffPair_7
{
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 primal_0;
    DiffPair_s_diff_s_diff_SceneDerivativeFlags_0 differential_0;
};

struct DiffPair_PathData_0
{
    PathData_0 primal_0;
    s_diff_PathData_0 differential_0;
};

struct DiffPair_ShadingData_0
{
    ShadingData_0 primal_0;
    s_diff_ShadingData_0 differential_0;
};

struct DiffPair_8
{
    DiffPair_array_float3_0 primal_0;
    DiffPair_array_float3_0 differential_0;
};

struct Total
{
    s_bwd_temporaryBsdfEval_Intermediates_0 _data0;
    s_bwd_fwd_computeHarmonicWeightMisuba_Intermediates_0 _data1;
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_0 _data2;
    s_bwd_s_fwd_computeWarpedRay_Intermediates_0 _data3;
    s_bwd_reparameterizeRay_Intermediates_0 _data4;
    s_bwd_generateScatterRay_Intermediates_0 _data5;
    s_bwd_computeNEE_Intermediates_0 _data6;
    s_bwd_handleHit_Intermediates_0 _data7;
    s_bwd_s_fwd_traceAsymptoticWeightedMeanIntersection_Intermediates_1 _data8;
    s_bwd_s_fwd_computeWarpedPrimalSample_Intermediates_0 _data9;
    s_bwd_reparameterizeScreenSample_Intermediates_0 _data10;
    s_bwd_tracePath_Intermediates_0 _data11;
    s_bwd_tracePaths_Intermediates_0 _data12;
    s_bwd_s_fwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _data13;
    s_bwd_s_fwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _data14;
    s_bwd_DifferentiableSceneQuery_traceRayInlineDifferentiable_Intermediates_0 _data15;
    s_bwd_DifferentiableSceneQuery_loadIntersectionInfo_Intermediates_0 _data16;
};
