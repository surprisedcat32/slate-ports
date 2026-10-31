#!/bin/bash
slate install dev/dev
slate install dev/python
cd /usr/ports/dev/ninja
curl -LO https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.2.tar.gz
tar -xf v1.13.2.tar.gz
cd ninja-1.13.2/

python3 configure.py --bootstrap

install -Dm755 ninja ${DESTDIR:-}/usr/bin/ninja
