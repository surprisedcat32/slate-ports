#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.6p2.tar.gz
tar -xf openssh-10.6p2.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --sysconfdir=/etc/ssh \
    --libexecdir=/usr/lib/ssh \
    --with-privsep-path=/var/empty \
    --with-privsep-user=sshd \
    --with-pid-dir=/run \
    --with-ssl-dir=/usr \
    --with-zlib=/usr \
    --without-pam \
    --without-selinux \
    --without-kerberos5 \
    --without-libedit

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install

