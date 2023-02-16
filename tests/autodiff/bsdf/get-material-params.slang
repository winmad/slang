//TEST(compute, vulkan):COMPARE_COMPUTE_EX:-vk -compute -shaderobj -output-using-type
//TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -shaderobj -output-using-type

//TEST_INPUT:ubuffer(data=[0 0 0 0 0 0 0 0 0], stride=4):out,name=outputBuffer
RWStructuredBuffer<float> outputBuffer;

__exported import bsdf_auto_rev;

[BackwardDifferentiable]
Auto_Bwd_BSDFParameters getMaterialParams(uint materialID)
{
    Auto_Bwd_BSDFParameters bsdfParams;
    if (materialID == 0)
    {
        bsdfParams.albedo = float3(0.7, 0.7, 0.7);
        bsdfParams.roughness = 0.1f;
    }
    else if (materialID == 1)
    {
        bsdfParams.albedo = float3(0.9, 0.6, 0.4);
        bsdfParams.roughness = 0.1f;
    }
    else
    {
        bsdfParams.albedo = float3(0.5, 0.5, 0.5);
        bsdfParams.roughness = 0.5f;
    }
    return bsdfParams;
}

[BackwardDerivativeOf(getMaterialParams)]
void __bwd_d_getMaterialParams(uint materialID, Auto_Bwd_BSDFParameters.Differential dOut)
{
    for (int j = 0; j < 3; ++j)
        outputBuffer[materialID * 3 + j] += dOut.albedo[j];
}

[BackwardDifferentiable]
void tracePath(inout float3 radiance)
{
    [ForceUnroll]
    for (uint i = 0; i <= 2; ++i)
    {
        Auto_Bwd_BSDFParameters bsdfParams = getMaterialParams(i);
        float3 weight = float3(i + 1.0);
        radiance += bsdfParams.albedo * weight;
    }
}

[numthreads(1, 1, 1)]
void computeMain(uint3 dispatchThreadID: SV_DispatchThreadID)
{
    /*
    DifferentialPair<Auto_Bwd_BSDFParameters> dp_bsdfParams = DifferentialPair<Auto_Bwd_BSDFParameters>(
        { float3(0.9, 0.6, 0.4), 0.1f },
        { float3(0), 1.f }
    );
    __bwd_diff(getMaterialParams)(1, dp_bsdfParams.d);
    */

    DifferentialPair<float3> dp_radiance = DifferentialPair<float3>(float3(0), float3(1, 0, 0));
    __bwd_diff(tracePath)(dp_radiance);
}
