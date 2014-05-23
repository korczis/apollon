#!/usr/bin/env bash

packer build \
    -var 'aws_access_key=MUST_BE_FILLED' \
    -var 'aws_secret_key=MUST_BE_FILLED' \
    packer.json