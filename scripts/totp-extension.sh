#!/bin/env bash
# Create and download a specific version of the guacamole auth-totp
set -euf -o pipefail
declare -r GUAC_VER=1.2.0
declare -r EXTENSION=auth-totp

mkdir extensions || true
pushd extensions
tmp_dir=$(mktemp -d -t guac-XXXXXXXXXX)
pushd "$tmp_dir"
curl -SLO "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${GUAC_VER}/binary/guacamole-${EXTENSION}-${GUAC_VER}.tar.gz"
tar -xzf guacamole-"${EXTENSION}"-"${GUAC_VER}".tar.gz
popd
cp "$tmp_dir"/guacamole-"${EXTENSION}"-"${GUAC_VER}"/guacamole-"${EXTENSION}"-"${GUAC_VER}".jar  "$(pwd)"
rm -rf "$tmp_dir"