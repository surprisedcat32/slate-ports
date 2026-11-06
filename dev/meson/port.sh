#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/mesonbuild/meson/archive/refs/tags/1.12.1.tar.gz
tar -xf 1.12.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

python3 -m pip install .

