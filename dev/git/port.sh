#!/bin/bash

cd /usr/ports/dev/git

curl -LO https://www.kernel.org/pub/software/scm/git/git-2.51.0.tar.xz

tar -xf git-2.51.0.tar.xz

cd git-2.51.0
make prefix=/usr NO_TCLTK=1 NO_GETTEXT=1 -j"$MAKETHREADS"
make install prefix=/usr NO_TCLTK=1 NO_GETTEXT=1 -j"$MAKETHREADS"

