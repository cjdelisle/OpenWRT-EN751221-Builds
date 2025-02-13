#!/bin/sh

git clone https://github.com/cjdelisle/openwrt.git
cd openwrt || exit 1
git checkout new-platform-en75

./scripts/feeds update -a
./scripts/feeds install -a

echo '
CONFIG_TARGET_en75=y
CONFIG_TARGET_en75_en751221=y
CONFIG_TARGET_en75_en751221_DEVICE_smartfiber_xp8421-b=y
' > .config

make defconfig

make "-j$(nproc)"