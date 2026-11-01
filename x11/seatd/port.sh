
#!/bin/bash

curl -LO https://github.com/kennylevinsen/seatd/archive/0.9.3/seatd-0.9.3.tar.gz
tar -xf seatd-0.9.3.tar.gz
cd seatd-0.9.3

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback

ninja -j"$(nproc)"
DESTDIR="$DESTDIR" ninja install

