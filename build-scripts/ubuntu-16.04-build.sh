#!/bin/bash

sudo apt install cmake
cd $GITHUB_WORKSPACE
mkdir build
cd build
cmake ../SuperBuild
make -j2
cd SimpleITK-build/Wrapping/Python
sudo python Packaging/setup.py install