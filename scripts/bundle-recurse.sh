#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
  echo "> bundling $1 in $2"
  exit 1
fi

source scripts/extract-info.sh
if [ ! -f "$ca_cert_path" ]; then
  exit 0
fi
cat "$ca_cert_path" >> "$2"

./scripts/bundle-recurse.sh "$ca_dir" "$2"
