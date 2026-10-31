#!/bin/bash
cd /usr/ports/dev/meson

git clone --depth 1 https://github.com/mesonbuild/meson.git

cd meson

python3 -m pip install .

