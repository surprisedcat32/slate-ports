#!/bin/bash
set -e
cd /usr/ports/x11/xcb-util-xrm
curl -LO https://archive.ubuntu.com/ubuntu/pool/universe/x/xcb-util-xrm/xcb-util-xrm_1.3+git20230724.a17de57.orig.tar.xz
tar -xf xcb-util-xrm_1.3+git20230724.a17de57.orig.tar.xz
cd xcb-util-xrm-1.3+git20230724.a17de57 

./autogen.sh --prefix=/usr --disable-static

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
