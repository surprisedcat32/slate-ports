
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/Kitware/CMake/releases/download/v4.4.5/cmake-4.4.5.tar.gz
tar -xf cmake-4.4.5.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./bootstrap \
    --prefix=/usr \
    --parallel="$(nproc)" \
    -- -DCMAKE_USE_OPENSSL=OFF

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

