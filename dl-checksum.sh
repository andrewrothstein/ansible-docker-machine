#!/usr/bin/env sh
VER=v0.16.2
DIR=~/Downloads
MIRROR=https://github.com/docker/machine/releases/download/${VER}

RSHAFILE=sha256sum.txt
LSHAFILE=$DIR/docker-machine-${VER}-sha256sum.txt

if [ ! -e $LSHAFILE ];
then
    wget -q -O $LSHAFILE $MIRROR/$RSHAFILE
fi

dl()
{
    OS=$1
    ARCH=$2
    EXESUFFIX=${3:-}
    PLATFORM=${OS}-${ARCH}
    FILE=docker-machine-${PLATFORM}${EXESUFFIX}
    URL=$MIRROR/$FILE

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `grep $FILE $LSHAFILE | awk '{print $1}'`
}

printf "  # %s\n" $MIRROR/$RSHAFILE
printf "  %s:\n" $VER
dl Darwin x86_64
dl Linux aarch64
dl Linux armhf
dl Linux x86_64
dl Windows i386 .exe
dl Windows x86_64 .exe



