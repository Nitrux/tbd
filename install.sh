#! /bin/sh


set -e -- "{$1:-tbd}"

curl -L "https://raw.githubusercontent.com/luis-lavaire/tbd/main/tbd" > "$1"
chmod +x "$1"
