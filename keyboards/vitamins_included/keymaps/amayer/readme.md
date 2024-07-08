# The amayer Vitamins Included Layout

[QMK Docs](https://qmk.fm/keyboards/vitamins_included/)

## Building

Install dependancies and fetch a fresh version of the qmk image

```sh
git submodule update --recursive
podman pull ghcr.io/qmk/qmk_cli
```

Cleanup old build artifacts

```sh
podman run --rm -v "$PWD:/qmk_firmware:z" -w /qmk_firmware ghcr.io/qmk/qmk_cli make clean
```

Build the firmware in a container

```sh
util/docker_build.sh vitamins_included/rev2:amayer
```

## Flashing

```sh
sudo dfu-programmer atmega32u4 erase
sudo dfu-programmer atmega32u4 flash vitamins_included_rev2_amayer.hex
sudo dfu-programmer atmega32u4 reset
```
