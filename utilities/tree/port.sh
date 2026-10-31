#!/bin/bash

cd /usr/ports/utilities/tree

git clone --depth=1 https://gitlab.com/OldManProgrammer/unix-tree.git

cd unix-tree

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
