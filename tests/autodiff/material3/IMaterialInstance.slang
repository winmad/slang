//TEST_IGNORE_FILE:

interface IMaterialInstance : IDifferentiable
{
    [Differentiable]
    float3 eval(const float3 wi, const float3 wo);
}
