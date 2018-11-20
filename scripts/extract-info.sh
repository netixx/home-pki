set -xe

config="./config.json"

csr_path="$1"
sign_path="$(dirname "${csr_path}")"

cert_name="$(basename $sign_path)"
cert_output="$sign_path/$cert_name"
cert_file="$sign_path/$cert_name.pem"
key_file="$sign_path/$cert_name-key.pem"

ca_dir="$(cd "${sign_path}/..";pwd)"
ca_name="$(basename "$ca_dir")"
ca_cert_path="$ca_dir/$ca_name.pem"
ca_key_path="$ca_dir/$ca_name-key.pem"
