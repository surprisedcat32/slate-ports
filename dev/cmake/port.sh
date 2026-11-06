
#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/dev/cmake

curl -LO https://github.com/Kitware/CMake/releases/download/v4.4.5/cmake-4.4.5.tar.gz
tar -xf cmake-4.4.5.tar.gz
cd cmake-4.4.5

./bootstrap \
    --prefix=/usr \
    --parallel="$(nproc)" \
    -- -DCMAKE_USE_OPENSSL=OFF

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

