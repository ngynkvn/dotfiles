#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  tag='latest'
else
  tag=$1
fi

podman build -t "kepp-debian:$tag" .
