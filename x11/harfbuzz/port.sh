
#!/bin/sh

curl -LO https://github.com/harfbuzz/harfbuzz/releases/download/14.5.0/harfbuzz-14.5.0.tar.xz
tar -xf harfbuzz-14.5.0.tar.xz
cd harfbuzz-14.5.0

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install

