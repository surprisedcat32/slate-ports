#!/bin/bash

cd /usr/ports/dev/ninja

git clone https://github.com/ninja-build/ninja.git

cd ninja

python3 configure.py --bootstrap

install -Dm755 ninja /usr/bin/ninja
