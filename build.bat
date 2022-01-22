
rmdir /S /Q build
mkdir build
pushd build

rem setlocal ENABLEDELAYEDEXPANSION
set core_str="NumberOfCores"

for /F %%j in ( 'wmic cpu get /value^|findstr %core_str%' ) do ( set core_count=%%j )

echo core_count=%core_count:~14,2%

set buildstr=-- /maxcpucount:%core_count:~14,2%

cmake -A x64 -DCMAKE_BUILD_TYPE=relwithdebinfo ..
cmake --build . --config relwithdebinfo %buildstr%
popd

rem pause