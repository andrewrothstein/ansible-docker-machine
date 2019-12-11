#!/usr/bin/env sh
#set -x
DIR=~/Downloads
MIRROR=https://github.com/docker/machine/releases/download

dl()
{
    local ver=$1
    local lshafile=$2
    local os=$3
    local arch=$4
    local dotexe=${5:-}
    local platform="${os}-${arch}"
    local file=docker-machine-${platform}${dotexe}
    local url=$MIRROR/$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `grep $file $lshafile | awk '{print $1}'`
}

dl_ver()
{
    local ver=$1
    local rshafile=sha256sum.txt
    local lshafile=$DIR/docker-machine-${ver}-sha256sum.txt

    if [ ! -e $lshafile ];
    then
        wget -q -O $lshafile $MIRROR/${ver}/$rshafile
    fi

    printf "  # %s\n" $MIRROR/${ver}/$rshafile
    printf "  %s:\n" $ver
    dl $ver $lshafile Darwin x86_64
    dl $ver $lshafile Linux aarch64
    dl $ver $lshafile Linux armhf
    dl $ver $lshafile Linux x86_64
    dl $ver $lshafile Windows i386 .exe
    dl $ver $lshafile Windows x86_64 .exe
}


dl_ver ${1:-v0.16.2}
