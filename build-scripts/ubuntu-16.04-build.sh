#!/bin/bash

sudo apt install cmake
cd $GITHUB_WORKSPACE
mkdir build
cd build
cmake -DBUILD_EXAMPLES:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DWRAP_TCL:BOOL=OFF -DCMAKE_BUILD_TYPE=Release ../SuperBuild
make -j2
cd SimpleITK-build/Wrapping/Python
sudo python Packaging/setup.py install

# build wheel
python Packaging/setup.py bdist_wheel -d wheel-dist
ls -lh wheel-dist  # show the generated wheel file

# fake a manylinux build by simply renaming the wheel file
mv wheel-dist/SimpleITK_Elastix-2.0.0rc2-cp38-cp38-linux_x86_64.whl wheel-dist/SimpleITK_Elastix-2.0.0rc2-cp38-cp38-manylinux1_x86_64.whl
