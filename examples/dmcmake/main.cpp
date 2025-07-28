#include "dmcmake.h"

int main(int argc, char* argv[]) {
    IDMCMake* module = DMCMakeGetModule();
    if (module) {
        module->Release();
    }
    return 0;
}