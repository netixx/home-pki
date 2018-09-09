#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
echo "Autosign root ca"
echo "usage:"
echo "./scripts/sign-root.sh <path/to/csr.json>"
exit 1
fi

source scripts/extract-info.sh

cert_file="$sign_path/$cert_name.pem"
if [ -f "$cert_file" ]; then
  echo "Certificate $cert_name exists in $cert_file, not overwriting"
  return 0
fi

cfssl gencert -initca -config="$config" "$csr_path" | cfssljson -bare "$cert_output" -