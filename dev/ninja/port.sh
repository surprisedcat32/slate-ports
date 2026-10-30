#!/bin/bash
slate install dev/dev
slate install dev/python
slate install utilities/unzip
cd /usr/ports/dev/ninja

curl -LO https://github.com/ninja-build/ninja/releases/download/v1.13.2/ninja-linux.zip
unzip ninja-linux.zip
cd ninja

python3 configure.py --bootstrap

install -Dm755 ninja ${DESTDIR:-}/usr/bin/ninja
