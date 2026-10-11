#!/bin/bash
if [ ! -f "/usr/ports/installed/devel" ]; then
    slate install dev/dev
fi
if [ ! -f "/usr/ports/installed/python3" ]; then
    slate install dev/python
fi
cd /usr/ports/dev/ninja

git clone https://github.com/ninja-build/ninja.git

cd ninja

python3 configure.py --bootstrap

install -Dm755 ninja /usr/bin/ninja
touch /usr/ports/installed/ninja
