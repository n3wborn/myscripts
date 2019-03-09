#!/bin/bash -

# fetch_certs.sh
#
# Very simple script using bash, openssl and sed to fetch certificates

host=${1}             # which host ?
port=${2:-443}

#echo |  \
#    openssl s_client -connect ${host}:${port} 2>&1 |        \
#    sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >  \
#    ${host}_cert.pem
#
#exit 0
#

echo | \
    openssl s_client -servername ${host} -connect ${host}:${port} 2>/dev/null | \
    sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >  \
    ${host}.${port}.cert.pem

exit 0
