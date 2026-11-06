
#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/utils/mandoc

curl -LO https://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
tar -xf mandoc-1.14.6.tar.gz
cd mandoc-1.14.6

cat > configure.local <<'EOF'
PREFIX="/usr"
BINDIR="${PREFIX}/bin"
SBINDIR="${PREFIX}/sbin"
MANDIR="${PREFIX}/share/man"
BINM_PAGER="less"
LN="ln -sf"
EOF

./configure
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

