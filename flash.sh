#!/bin/bash

# this is a script used to flash plank rev6 keyboards
# first build the binary file (.bin) by running
# make planck/rev6:default

# ensure filename was passed
if [ -z ${1+x} ]; then
    echo "error: missing binary file to flash to keyboard"
    echo "usage: $0 <binary file>"
    exit 1
fi

# ensure file exists
if [ ! -f "$1" ]; then
    echo "error: file '$1' does not exist"
    echo "usage: $0 <binary file>"
    exit 1
fi

# ensure script is running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script should be run as root" 2>&1
  exit 1
fi

echo "Preparing to flash firmware. Please enter bootloader now!"
COUNTDOWN=5
while [[ $COUNTDOWN -ge 1 ]]; do
    echo -ne "\rFlashing in $COUNTDOWN...\033[0K"
    sleep 1
    ((COUNTDOWN = COUNTDOWN - 1))
done
echo -e "\rFlashing '$1'"

# flash plank keyboard
dfu-util -d 0483:df11 -a 0 -s 0x08000000:leave -D "$1"
