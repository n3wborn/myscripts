#!/bin/bash -

# fetch_certs.sh
#
# Very simple script using bash, openssl and sed to fetch certificates

host=$1             # which host ?
port=${2:-443}      # which port ? (443 by default)

echo |  \
    openssl s_client -connect ${host}:${port} 2>&1 |        \
    sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >  \
    ${host}_cert.pem

exit 0
