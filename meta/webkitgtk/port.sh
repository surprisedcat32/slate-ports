#!/bin/sh
set -e
slate install meta/web-deps
slate install meta/gtk3
slate install lib/icu
slate install lib/lcms2
slate install lib/libtasn1
slate install lib/libwebp
slate install lib/openjpeg
slate install lib/sqlite
slate install lib/libsecret
slate install lib/libsoup
slate install lib/glib-networking
slate install lib/enchant
slate install lib/gudev
slate install lib/libxml2
slate install media/gstreamer
slate install media/gst-plugins-base
slate install media/gst-plugins-bad
slate install system/libseccomp
slate install system/bubblewrap
slate install system/xdg-dbus-proxy
slate install www/webkitgtk
