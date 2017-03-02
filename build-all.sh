#!/bin/bash
ARGS=$@
echo ARGS: $ARGS

build-network.sh

build-jumpserver.sh

build-proxy.sh

