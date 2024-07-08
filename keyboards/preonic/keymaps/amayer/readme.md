# The amayer Preonic Layout

## Building

Install dependancies and fetch a fresh version of the qmk image

```sh
git submodule sync
podman pull ghcr.io/qmk/qmk_cli
```

Cleanup old build artifacts

```sh
podman run --rm -v "$PWD:/qmk_firmware:z" -w /qmk_firmware ghcr.io/qmk/qmk_cli make clean
```

Build the firmware in a container

```sh
util/docker_build.sh preonic/rev3:amayer
```

## Flashing

```sh
sudo ./flash.sh preonic_rev3_amayer.bin
```
