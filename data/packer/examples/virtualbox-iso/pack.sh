#! /usr/bin/env bash

ARCH='i386'
ISO_CHECKSUM='08d25bf879e353686a974b7b14ae7d81'

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    ARCH="amd64"
    ISO_CHECKSUM="01545fa976c8367b4f0d59169ac4866c"
fi

packer build \
    -var "arch=$ARCH" \
    -var "iso_checksum=$ISO_CHECKSUM" \
    packer.json