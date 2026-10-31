
#!/bin/bash
set -euo pipefail

VERSION="0.4"
URL="https://github.com/surprisedcat32/slate/releases/download/${VERSION}/dev.tar.gz"

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

# 1. Download.
curl -fsSL "$URL" -o "$WORK/dev.tar.gz"

# 2. Extract into a scratch directory.
mkdir "$WORK/extract"
tar -xzf "$WORK/dev.tar.gz" -C "$WORK/extract"

# 3. Strip the top-level directory by hand. Fail if there isn't exactly one.
entries=("$WORK"/extract/*)
if [ "${#entries[@]}" -ne 1 ] || [ ! -d "${entries[0]}" ]; then
    echo "dev: expected exactly one top-level directory in the archive" >&2
    exit 1
fi
SRC="${entries[0]}"

# 4. Install the stripped tree into the staged root.
cp -a "$SRC"/. "$DESTDIR"/
