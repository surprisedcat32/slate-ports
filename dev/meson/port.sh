#!/bin/bash
slate install dev/dev
slate install dev/python
cd /usr/ports/dev/meson

git clone https://github.com/mesonbuild/meson.git

cd meson

python3 -m pip install .

