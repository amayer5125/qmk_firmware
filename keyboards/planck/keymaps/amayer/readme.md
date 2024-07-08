# The amayer Planck Layout

## Building

Install dependancies and fetch a fresh version of the qmk image

```sh
git submodule update --recursive
podman pull ghcr.io/qmk/qmk_cli
```

Cleanup old build artifacts

```sh
podman run --rm -v "$(pwd):/qmk_firmware:z" -w /qmk_firmware ghcr.io/qmk/qmk_cli make clean
```

Build the firmware in a container

```sh
util/docker_build.sh planck/rev6:amayer
# to flash as well
util/docker_build.sh planck/rev6:amayer:flash
```

## Flashing

```sh
sudo ./flash.sh planck_rev6_amayer.bin
```
