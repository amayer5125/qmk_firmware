# The amayer Planck Layout

## Building

Install dependancies and fetch a fresh version of the qmk image

```sh
make git-submodule
docker pull qmkfm/base_container
```

Cleanup old build artifacts

```sh
make clean
```

Build the firmware in a docker container

```sh
docker run --rm -it -v "$PWD:/qmk_firmware" qmkfm/qmk_firmware qmk compile -c -kb planck/rev6 -km amayer
```

## Flashing

```sh
sudo ./flash.sh planck_rev6_amayer.bin
```
