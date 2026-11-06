
#!/bin/sh

curl -LO https://github.com/lloyd/yajl/archive/refs/tags/2.1.0/yajl-2.1.0.tar.gz
curl -LO https://www.linuxfromscratch.org/slfs/view/13.1/download/yajl/yajl-2.1.0-third_party_fixes-1.patch

tar -xf yajl-2.1.0.tar.gz
cd yajl-2.1.0

patch -Np1 -i ../yajl-2.1.0-third_party_fixes-1.patch

cmake -S . -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install

