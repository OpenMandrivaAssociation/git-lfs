#!/bin/sh
V=$(cat *.spec |grep ^Version: |awk '{ print $2; }')
git clone --depth 1 -b v$V https://github.com/git-lfs/git-lfs git-lfs-$V
tar cJf git-lfs-$V.tar.xz git-lfs-$V
D="$(pwd)"

cd git-lfs-$V
export GOPATH=/tmp/.godeps
rm -rf /tmp/.godeps
go mod download
cd /tmp
tar cJf $D/godeps-for-git-lfs-$V.tar.xz .godeps
