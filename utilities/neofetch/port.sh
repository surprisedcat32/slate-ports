#!/bin/bash

cd /usr/ports/utilities/neofetch

git clone --depth=1 https://github.com/dylanaraps/neofetch.git

cd neofetch

make install
