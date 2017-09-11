#!/bin/bash -

# crt_to_pem.sh
#
# Very simple openssl script to get a cert.pem certificate when you have a
# cert.crt one

i_file=${1}             # which cert.crt file ?

echo |  \
    openssl x509 -in ${i_file} -outform PEM
exit 0
