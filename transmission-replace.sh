#!/bin/bash

# transmission-replace.sh:
#
#   Script using transmission-edit to quickly modify .torrent files annouce
#   URL's. Useful when a tracker changed it's annouce or if you changed your
#   passcode, perfect when you have many .torrent files to modify !

usage() {
    echo "usage: "
    echo "  transmission-replace.sh <text-to-replace> <new-text> <torrent-file>"
    echo
    exit 0
}

if [[ $# -eq 3  ]] ;then
    transmission-edit -r "${1}" "${2}" "${3}"
    exit 0
else
    usage
fi

