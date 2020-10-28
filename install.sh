#! /bin/sh


#   get it from: https://git.io/JT11Y:
#   curl -L https://git.io/JT11Y

set -e -- "${1:-tbd}"

curl -L "https://raw.githubusercontent.com/luis-lavaire/tbd/main/tbd" > "$1"
chmod +x "$1"
