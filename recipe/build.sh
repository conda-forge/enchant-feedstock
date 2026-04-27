#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export GLIB_CFLAGS="-I$PREFIX/include/glib-2.0 -I$PREFIX/lib/glib-2.0/include"
export GLIB_LIBS="-L$PREFIX/lib -lglib-2.0 -lgobject-2.0 -lgmodule-2.0 -lgio-2.0"
export ACLOCAL_FLAGS="-I ${PREFIX}/share/aclocal"
export ACLOCAL_PATH="${PREFIX}/share/aclocal"

autoreconf -vfi
./configure --prefix=$PREFIX \
  --disable-static \
  --enable-relocatable \
  --disable-vala
make
make install
