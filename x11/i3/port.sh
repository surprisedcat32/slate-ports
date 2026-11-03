
#!/bin/bash

curl -LO https://i3wm.org/downloads/i3-4.25.1.tar.xz
tar -xf i3-4.25.1.tar.xz
cd i3-4.25.1

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    -Ddocs=false \
    -Dmans=false
sed -i "/run_command.*hacking-howto.html/c\if fs.exists('docs/hacking-howto.html')" meson.build
grep -q "fs = import('fs')" meson.build || sed -i '1ifs = import('\''fs'\'')' meson.build
ninja -j"$(nproc)"
DESTDIR="$DESTDIR" ninja install

