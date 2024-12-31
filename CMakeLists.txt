cmake_minimum_required(VERSION 3.21)

PROJECT(dmcmake)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()
ModuleSetWinCompilerFlags()

ShowEnvironment()

include(FetchContent)

# 声明依赖
FetchContent_Declare(
    fmtlib
    GIT_REPOSITORY git@github.com:fmtlib/fmt.git
    GIT_TAG 9.1.0  # 指定版本
)

# 自动下载、解压、配置并添加到构建中
FetchContent_MakeAvailable(fmtlib)

ModuleImportAll("thirdparty")
LibImportDepends("dmcmake_module" "src/dmcmake_module" "fmt::fmt")
ExeImport("test" "dmcmake_module")
