#!/bin/bash

# this is a script used to flash plank rev6 keyboards
# see keyboards/planck/keymaps/amayer/readme.md

# ensure filename was passed
if [ -z ${1+x} ]; then
    echo "error: missing binary file to flash to keyboard" >&2
    echo "usage: $0 <binary file>" >&2
    exit 1
fi

# ensure file exists
if [ ! -f "$1" ]; then
    echo "error: file '$1' does not exist" >&2
    echo "usage: $0 <binary file>" >&2
    exit 1
fi

# ensure script is running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script should be run as root" >&2
  exit 1
fi

# flash plank keyboard
# details found using `dfu-util --list`
dfu-util -w -d 0483:df11 -a 0 -s 0x08000000:leave -D "$1"
