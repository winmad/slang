//TEST_IGNORE_FILE:

__exported import IMaterialInstance;
__exported import IBSDF;

struct GlossyMaterialInstance : IMaterialInstance
{
    float3 albedo;

    [Differentiable]
    __init(float3 albedo)
    {
        this.albedo = albedo;
    }

    [Differentiable]
    float3 eval(const float3 wi, const float3 wo)
    {
        return albedo * albedo;
    }
};
