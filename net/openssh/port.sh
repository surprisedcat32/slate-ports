#!/bin/bash
set -e

cd /usr/ports/net/openssh

curl -LO https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.6p1.tar.gz
tar -xf openssh-10.6p1.tar.gz
cd openssh-10.6p1

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

