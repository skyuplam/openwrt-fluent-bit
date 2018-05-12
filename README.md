# Cross compile fluent-bit for OpenWrt version 17.01.4

## Build docker image
```bash
docker build -t skyuplam/openwrt-fluent-bit .
```

## Run the docker image
```bash
docker run -ti --rm skyuplam/openwrt-fluentbit bash
```

## Cross compile
```bash
cd fluent-bit/build
cmake -DCMAKE_TOOLCHAIN_FILE=~/openwrt.cmake ..
make
```
