#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
  echo "Create bundle compatible with haproxy"
  exit 1
fi

source scripts/extract-info.sh
bundle_file="$cert_output.bundle"

cat "$cert_file" > "$bundle_file"

./scripts/bundle-recurse.sh "$1" "$bundle_file"

cat "$key_file" >> "$bundle_file"

echo -e "Bundle done in \n$bundle_file"