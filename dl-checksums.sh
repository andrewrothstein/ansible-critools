#!/usr/bin/env sh
set -e

DIR=~/Downloads
MIRROR=https://github.com/kubernetes-sigs/cri-tools/releases/download

# https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.24.2/crictl-v1.24.2-darwin-amd64.tar.gz.sha256

dl()
{
    local app=$1
    local ver=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local url=$MIRROR/v$ver/${app}-v${ver}-${platform}.${archive_type}.sha256
    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $platform $(curl -sSLf $url | awk '{print $1}')
}

dl_crictl() {
    local ver=$1
    local app="crictl"
    dl $app $ver darwin amd64
    dl $app $ver linux 386
    dl $app $ver linux amd64
    dl $app $ver linux arm
    dl $app $ver linux arm64
    dl $app $ver linux mips64le
    dl $app $ver linux ppc64le
    dl $app $ver linux s390x
    dl $app $ver windows 386
    dl $app $ver windows amd64
}

dl_critest() {
    local ver=$1
    local app="critest"
    dl $app $ver darwin amd64
    dl $app $ver linux 386
    dl $app $ver linux amd64
    dl $app $ver linux arm
    dl $app $ver linux arm64
    dl $app $ver windows 386
    dl $app $ver windows amd64
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    printf "    crictl:\n"
    dl_crictl $ver
    printf "    critest:\n"
    dl_critest $ver
}

dl_ver ${1:-1.27.1}
