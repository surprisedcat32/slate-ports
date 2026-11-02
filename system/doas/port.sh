#!/bin/sh
cd /usr/ports/system/doas
curl -LO https://github.com/Duncaen/OpenDoas/releases/download/v6.8.2/opendoas-6.8.2.tar.gz
tar -xf opendoas-6.8.2.tar.gz
cd opendoas-6.8.2
./configure --prefix=/usr --sysconfdir=/etc --with-shadow --without-pam
make clean
make -j"$(toybox nproc)"
make DESTDIR="$DESTDIR" install
echo "Doas install completed"
