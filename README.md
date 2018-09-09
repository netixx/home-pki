# Home PKI

Collection of scripts and directory structure to manage
a home pki using [cfssl](https://github.com/cloudflare/cfssl) as a backend

## Project structure
* `scripts/*` : bash scripts to sign CAs and certificates
* `example` : example directory structure and config files

## Pki structure

This implementation uses the directory structure to
figure out ca/certificate relationship (which ca should
sign which certificate - or other ca): certificate or ca will be signed with the ca contained
in the parent folder.

## Usage
### Initial setup
1. Copy `example/config.json` to `config.json` and adjust settings (see cfssl documentation).
2. Create root folder (say `ca-root`) and define `csr.json` (or copy from `example/`)
3. Use `./scripts/sign-root.sh ca-root/csr.json` to auto-sign root key

### General usage
When generating/signing an element, make sure the parent folder has been generated (recursively).

The scripts will not overwrite existing certificates and private keys.

Workflow:
1. Create subfolder in root folder
2. Populate csr.json
3. Use `./scripts/sign.sh <path/to/csr.json>` to sign this CA or certificate

You can also use `./scripts/sign-all.sh <path/to/dir>` to sign all `csr.json` in path recursively.