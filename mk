#!/bin/bash

#       Building on Linux.  Note: only compiles in OGG and MP3 support
#       if the libraries are already setup within libs/, otherwise
#       omits them.  To build the libraries, see the 'mk-libmad-linux'
#       and 'mk-tremor-linux' scripts.

OPT="-DT_LINUX -Wall -O3 -s -lm -lpthread"
LIBS=''

[ -f libs/linux-libmad.a ] && {
    OPT="-DMP3_DECODE $OPT"
    LIBS="$LIBS libs/linux-libmad.a"
}
[ -f libs/linux-libvorbisidec.a ] && {
    OPT="-DOGG_DECODE $OPT"
    LIBS="$LIBS libs/linux-libvorbisidec.a"
}

cc $OPT sbagen.c $LIBS -o sbagen || exit 1

