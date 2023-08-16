//TEST_IGNORE_FILE:

__exported import IMaterial;
__exported import DiffuseMaterialInstance;

struct DiffuseMaterial : IMaterial
{
    float3 baseColor;

    typedef DiffuseMaterialInstance MaterialInstance;

    [TreatAsDifferentiable]
    float3 getAlbedo(float3 albedo)
    {
        return albedo;
    }

    [Differentiable]
    DiffuseMaterialInstance setupMaterialInstance()
    {
        float3 albedo = getAlbedo(baseColor);
        DiffuseMaterialInstance mi = DiffuseMaterialInstance(baseColor);
        return mi;
    }
};
