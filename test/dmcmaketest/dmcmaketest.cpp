
#include "dmcmake.h"

int main( int argc, char* argv[] ) {

    Idmcmake* module = dmcmakeGetModule();
    if (module)
    {
        module->Test();
        module->Release();
    }
    return 0;
}
