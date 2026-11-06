#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/dev/meson"

curl -LO https://github.com/mesonbuild/meson/archive/refs/tags/1.12.1.tar.gz
tar -xf 1.12.1.tar.gz
cd meson-1.12.1

python3 -m pip install .

