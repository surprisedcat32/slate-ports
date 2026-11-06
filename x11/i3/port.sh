
#!/bin/sh

curl -LO https://i3wm.org/downloads/i3-4.25.1.tar.xz
tar -xf i3-4.25.1.tar.xz
cd i3-4.25.1

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    -Ddocs=false \
    -Dmans=false
ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install

