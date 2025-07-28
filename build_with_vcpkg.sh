#!/bin/bash

rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=relwithdebinfo -DCMAKE_TOOLCHAIN_FILE=${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --config relwithdebinfo -- -j$(nproc)
echo "cd build && ctest -C relwithdebinfo --output-on-failure --output-junit report.xml && cd .."
cd ..

# popd

# echo continue && read -n 1
