#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/Duncaen/OpenDoas/releases/download/v6.8.2/opendoas-6.8.2.tar.gz
tar -xf opendoas-6.8.2.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --sysconfdir=/etc --with-shadow --without-pam
make clean -j"$MAKETHREADS"
make nproc)" -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
echo "Doas install completed"
