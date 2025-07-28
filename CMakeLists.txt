cmake_minimum_required(VERSION 3.21)

PROJECT(dmcmake)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()

SET(DMCMAKE_VERSION_MAJOR "1")
SET(DMCMAKE_VERSION_MINOR "0")
SET(DMCMAKE_VERSION_PATCH "1")
SET(DMCMAKE_VERSION "${DMCMAKE_VERSION_MAJOR}.${DMCMAKE_VERSION_MINOR}.${DMCMAKE_VERSION_PATCH}")

MESSAGE(STATUS "VERSION: ${DMCMAKE_VERSION}")

OPTION(USE_DMCMAKE "use dmcmake" OFF)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/include/dmcmake_config.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/dmcmake_config.h)

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
set(CMAKE_STATIC_LIBRARY_PREFIX "")
set(CMAKE_SHARED_LIBRARY_PREFIX "")

enable_testing()

ModuleImportAll("thirdparty")

LibImport("libdmcmake" "src/libdmcmake")

if(PROJECT_IS_TOP_LEVEL)
    ExeImportAndTest("test" "libdmcmake;dmtest")
    ExeImportAndTest("examples" "libdmcmake")
endif()

AddInstall("libdmcmake" "${CMAKE_CURRENT_SOURCE_DIR}/include")
