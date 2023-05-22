// main.cpp

#include <stdio.h>

// This file implements an extremely simple example of loading and
// executing a Slang shader program on the CPU. 
//
// More information about generation C++ or CPU code can be found in docs/cpu-target.md
//
// NOTE! This test will only run on a system correctly where slang can find a suitable
// C++ compiler - such as clang/gcc/visual studio
//
// The comments in the file will attempt to explain concepts as
// they are introduced.
//
// Of course, in order to use the Slang API, we need to include
// its header. We have set up the build options for this project
// so that it is as simple as:
#include <slang.h>

// Allows use of ComPtr - which we can use to scope any 'com-like' pointers easily
#include <slang-com-ptr.h>
// Provides macros for handling SlangResult values easily 
#include <slang-com-helper.h>

// This includes a useful small function for setting up the prelude (described more further below).
#include "../../source/core/slang-test-tool-util.h"

// Slang namespace is used for elements support code (like core) which we use here
// for ComPtr<> and TestToolUtil
using namespace Slang;

// Slang source is converted into C++ code which is compiled by a backend compiler.
// That process uses a 'prelude' which defines types and functions that are needed
// for everything else to work.
// 
// We include the prelude here, so we can directly use the types as were used by the
// compiled code. It is not necessary to include the prelude, as long as memory is
// laid out in the manner that the generated slang code expects. 
//#define SLANG_PRELUDE_NAMESPACE CPPPrelude
#include "../../prelude/slang-cpp-types.h"
#include "../../prelude/slang-cpp-prelude.h"
#include "../../prelude/slang-cpp-types-core.h"

#include "checkpoint_structs.h"
//#include "recompute_structs.h"

int main(int argc, char** argv)
{
    //printf("%zu\n", sizeof(s_bwd_tracePath_Intermediates_0));
    printf("%zu\n", sizeof(s_bwd_handleHit_Intermediates_0) +
        sizeof(DiffRay_0) +
        sizeof(PathData_0) +
        sizeof(UniformSampleGenerator_0) +
        sizeof(IntersectionInfo_0) +
        sizeof(bool));
    return 0;
    //return SLANG_SUCCEEDED(_innerMain(argc, argv)) ? 0 : -1;
}
