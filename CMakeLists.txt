cmake_minimum_required(VERSION 3.2)

PROJECT(dmcmake)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()
ModuleSetWinCompilerFlags()

SET(DMCMAKE_VERSION_MAJOR "1")
SET(DMCMAKE_VERSION_MINOR "0")
SET(DMCMAKE_VERSION_PATCH "1")
SET(DMCMAKE_VERSION "${DMCMAKE_VERSION_MAJOR}.${DMCMAKE_VERSION_MINOR}.${DMCMAKE_VERSION_PATCH}")

MESSAGE(STATUS "VERSION: ${DMCMAKE_VERSION}")

OPTION(USE_DMCMAKE "use dmcmake" OFF)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/include/dmcmake_config.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/dmcmake_config.h)

ShowEnvironment()

ModuleImportAll("thirdparty")
LibImport("dmcmake_module" "src/dmcmake_module")
ExeImport("test" "dmcmake_module")

#ADD_CUSTOM_COMMAND(
#TARGET dmcmaketest
#PRE_BUILD
#COMMAND ${CMAKE_COMMAND} -E copy_if_different
#${CMAKE_CURRENT_SOURCE_DIR}/config/test.csv
#$<TARGET_FILE_DIR:dmcmaketest>
#)

#INSTALL(DIRECTORY include/ DESTINATION include)
#INSTALL(TARGETS dmcmake
#        RUNTIME DESTINATION bin
#        LIBRARY DESTINATION lib
#        ARCHIVE DESTINATION lib)

#SET(DMCMAKE_LIBS "dmcmake")
#MARK_AS_ADVANCED(${DMCMAKE_LIBS})