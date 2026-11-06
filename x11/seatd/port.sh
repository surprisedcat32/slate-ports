
#!/bin/sh

curl -LO https://github.com/kennylevinsen/seatd/archive/0.9.3/seatd-0.9.3.tar.gz
tar -xf seatd-0.9.3.tar.gz
cd seatd-0.9.3

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install
echo '#!/bin/sh

case "$1" in
    stop)
        killall seatd
        ;;
    restart)
        killall seatd
        /usr/bin/seatd -g video
        ;;
    *)
        /usr/bin/seatd -g video
        ;;
esac' > /etc/init.d/seatd

chmod +x /etc/init.d/seatd
