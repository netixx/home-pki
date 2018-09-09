#!/usr/bin/env bash
set -e

if [ -z $1 ]; then
echo "Sign given csr:"
echo "Certificate filename is derived from directory"
echo "Certificate authority is derived from parent directory"
echo "If certificate name starts with 'ca-'', then the scripts assumes you are trying to sign an intermediate certificate authority"
echo "usage:"
echo "./scripts/sign.sh <path/to/csr.json>"
exit 1
fi

source scripts/extract-info.sh

cert_file="$sign_path/$cert_name.pem"
if [ -f "$cert_file" ]; then
  echo "Certificate $cert_name exists in $cert_file, not overwriting"
  exit 1
fi

if [[ $cert_name == ca-* ]]; then
  profile=intermediate
else
  profile=server
fi

cfssl gencert -ca="$ca_cert_path" -ca-key="$ca_key_path" -profile="$profile" -config="$config" "$csr_path" | cfssljson -bare "$cert_output" -
