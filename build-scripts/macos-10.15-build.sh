#!/bin/bash

brew install cmake rbenv
rbenv install 2.6.6  # need to reinstall to add headers

cd $GITHUB_WORKSPACE
mkdir build
cd build
cmake -DBUILD_EXAMPLES:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DWRAP_TCL:BOOL=OFF -DCMAKE_BUILD_TYPE=Release ../SuperBuild
make -j2
cd SimpleITK-build/Wrapping/Python
sudo python Packaging/setup.py install