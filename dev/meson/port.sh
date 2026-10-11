#!/bin/bash
if [ ! -f "/usr/ports/installed/devel" ]; then
    slate install dev/dev
fi
if [ ! -f "/usr/ports/installed/python3" ]; then
    slate install dev/python
fi
cd /usr/ports/dev/meson

git clone https://github.com/mesonbuild/meson.git

cd meson

python3 -m pip install .
touch /usr/ports/installed/meson

