#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
echo "Finds all csr in dir and signs them"
echo "usage:"
echo "./scripts/sign-all.sh <path>"
exit 1
fi

find "$1" -name "csr.json" -type f -exec ./scripts/sign.sh {} \;