
rmdir /S /Q build 2> nul
mkdir build 2> nul
cd build

cmake -A x64 -DCMAKE_BUILD_TYPE=relwithdebinfo -T ClangCL ..
cmake --build . --config relwithdebinfo -- /m:%NUMBER_OF_PROCESSORS%
echo "cd build && ctest -C relwithdebinfo --output-on-failure --output-junit report.xml && cd .."
cd ..

rem pause