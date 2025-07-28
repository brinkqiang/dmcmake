

rmdir /S /Q build 2> nul
mkdir build 2> nul
cd  build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=relwithdebinfo ..
cmake --build . --config relwithdebinfo
echo "cd build && ctest -C relwithdebinfo --output-on-failure --output-junit report.xml && cd .."
popd

rem pause