#!/bin/sh
set -e

slate install lib/glib
slate install lib/cairo
slate install lib/pango
slate install lib/pcre2
slate install lib/libev
slate install lib/yajl

slate install x11/libxcb
slate install x11/libxkbcommon
slate install x11/libxkbcommon-x11
slate install x11/startup-notification

slate install x11/xcb-util
slate install x11/xcb-util-wm
slate install x11/xcb-util-image
slate install x11/xcb-util-keysyms
slate install x11/xcb-util-renderutil
slate install x11/xcb-util-cursor
slate install x11/xcb-util-errors
slate install x11/xcb-util-xrm

slate install x11/i3
