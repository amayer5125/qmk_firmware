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
docker run --rm -u 1000:1000 -v "$PWD:/qmk_firmware:rw" -w /qmk_firmware qmkfm/base_container make planck/rev6:amayer
```

## Flashing

```sh
sudo ./flash.sh planck_rev6_amayer.bin
```
