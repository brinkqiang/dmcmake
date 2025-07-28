
#include "dmcmake.h"
#include "gtest.h"

class env_dmcmake
{
public:
    void init(){}
    void uninit(){}
};

class frame_dmcmake : public testing::Test
{
public:
    virtual void SetUp()
    {
        env.init();
    }
    virtual void TearDown()
    {
        env.uninit();
    }
protected:
    env_dmcmake env;
};

TEST_F(frame_dmcmake, init)
{
    IDMCMake* module = DMCMakeGetModule();
    if (module)
    {
        module->Test();
        module->Release();
    }
}
