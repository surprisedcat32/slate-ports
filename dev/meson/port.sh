#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/mesonbuild/meson/archive/refs/tags/1.12.1.tar.gz
tar -xf 1.12.1.tar.gz
cd "$(tar -tf 1.12.1.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

python3 -m pip install .

