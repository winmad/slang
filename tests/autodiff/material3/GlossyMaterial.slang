//TEST_IGNORE_FILE:

__exported import IMaterial;
__exported import GlossyMaterialInstance;

struct GlossyMaterial : IMaterial
{
    float3 baseColor;

    typedef GlossyMaterialInstance MaterialInstance;

    float3 getAlbedo(float3 albedo)
    {
        return albedo;
    }

    [ForwardDerivativeOf(getAlbedo)]
    [TreatAsDifferentiable]
    DifferentialPair<float3> __fwd_d_getAlbedo(DifferentialPair<float3> dpAlbedo)
    {
        return diffPair(dpAlbedo.p, float3(1.f));
    }

    [BackwardDerivativeOf(getAlbedo)]
    [TreatAsDifferentiable]
    void __bwd_d_getAlbedo(inout DifferentialPair<float3> dpAlbedo, float3 dOut)
    {
        [unroll]
        for (int j = 0; j < 3; j++) outputBuffer[j + 3] += dOut[j];
    }

    [Differentiable]
    GlossyMaterialInstance setupMaterialInstance()
    {
        float3 albedo = getAlbedo(baseColor);
        GlossyMaterialInstance mi = GlossyMaterialInstance(albedo);
        return mi;
    }
};
