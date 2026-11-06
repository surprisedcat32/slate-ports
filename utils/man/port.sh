
#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
tar -xf mandoc-1.14.6.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

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

