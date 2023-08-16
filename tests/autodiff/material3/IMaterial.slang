//TEST_IGNORE_FILE:

__exported import IMaterialInstance;

interface IMaterial
{
    associatedtype MaterialInstance : IMaterialInstance;

    [Differentiable]
    MaterialInstance setupMaterialInstance();
}
