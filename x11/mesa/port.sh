#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/mesa"

curl -LO https://archive.mesa3d.org/mesa-26.2.6.tar.xz
tar -xf mesa-26.2.6.tar.xz
cd mesa-26.2.6

export PYTHON=/usr/bin/python3.13
export PYTHONPATH=/usr/lib/python3.13/site-packages
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
python3 -m pip install pyyaml mako
meson setup build \
  --prefix=/usr \
  -Dplatforms=x11 \
  -Dgallium-drivers=softpipe \
  -Dvulkan-drivers= \
  -Dgbm=enabled \
  -Dglx=dri \
  -Dllvm=disabled \
  -Degl=enabled \
  -Dbuild-tests=false

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
