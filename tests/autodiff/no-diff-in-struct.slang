//TEST(compute):COMPARE_COMPUTE_EX:-slang -compute -shaderobj -output-using-type
//TEST(compute, vulkan):COMPARE_COMPUTE_EX:-vk -compute -shaderobj -output-using-type

//TEST_INPUT:ubuffer(data=[0], stride=4):out,name=outputBuffer
RWStructuredBuffer<float> outputBuffer;

struct PathState : IDifferentiable
{
    no_diff float a;
    float b;
}

[BackwardDifferentiable]
void updatePath(inout PathState path, float x)
{
    path.b *= x;
}

[numthreads(1, 1, 1)]
void computeMain(uint3 dispatchThreadID: SV_DispatchThreadID)
{
    PathState path = {};
    path.a = 1.0;
    path.b = 2.0;
    DifferentialPair<PathState> dp_path = diffPair(path, { 1.0 });
    DifferentialPair<float> dp_x = DifferentialPair<float>(5.0, 0.0);
    __bwd_diff(updatePath)(dp_path, dp_x);

    outputBuffer[0] = dp_path.d.b;
}
