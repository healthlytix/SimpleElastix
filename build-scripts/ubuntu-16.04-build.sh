#!/bin/bash

sudo apt install cmake
cd $GITHUB_WORKSPACE
mkdir build
cd build
cmake ../SuperBuild
make -j2
cd SimpleITK-build/Wrapping/Python
sudo python Packaging/setup.py install

# build wheel
python Packaging/setup.py bdist_wheel -d wheel-dist
ls -lh wheel-dist  # show the generated wheel file

# fake a manylinux build by simply renaming the wheel file
cd wheel-dist
SRC_WHEEL_FILENAME=`ls`
DEST_WHEEL_FILENAME=`echo $WHEEL_FILENAME | sed 's/m-linux/-manylinux1/'`
mv $SRC_WHEEL_FILENAME $DEST_WHEEL_FILENAME

# upload to pypi
pip install twine
twine upload --username cortechslabs --password $PYPI_PASSWORD *
