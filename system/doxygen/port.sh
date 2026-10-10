#!/bin/bash
cd /usr/ports
curl -LO https://www.doxygen.nl/files/doxygen-1.14.0.src.tar.gz
tar -xf doxygen-1.14.0.src.tar.gz
cd doxygen-1.14.0
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j"$(nproc)"
make install
