# The amayer 1upkeyboard 60 HSE Layout

## Building

Install dependancies and fetch a fresh version of the qmk image

```sh
git submodule update --recursive
podman pull ghcr.io/qmk/qmk_cli
```

Build the firmware in a container

```sh
util/docker_build.sh 1upkeyboards/1up60hse:amayer
```

## Flashing

```sh
sudo dfu-programmer atmega32u4 erase
sudo dfu-programmer atmega32u4 flash 1upkeyboards_1up60hse_amayer.hex
sudo dfu-programmer atmega32u4 reset
```
