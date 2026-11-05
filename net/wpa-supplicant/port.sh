#!/bin/bash
set -e
cd /usr/ports/net/wpa-supplicant

curl -LO https://w1.fi/releases/wpa_supplicant-2.11.tar.gz
tar -xf wpa_supplicant-2.11.tar.gz
cd wpa_supplicant-2.11/wpa_supplicant

cat > .config <<'EOF'
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_NL80211=y
CONFIG_CTRL_IFACE=y
CONFIG_CTRL_IFACE_UNIX=y
CONFIG_LIBNL32=y
CONFIG_TLS=openssl
CONFIG_EAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_TLS=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TTLS=y
CONFIG_EAP_PWD=y
CONFIG_PKCS12=y
CONFIG_MATCH_IFACE=y
CONFIG_BACKEND=file
EOF

make BINDIR=/usr/sbin -j"$MAKETHREADS"
make BINDIR=/usr/sbin DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
