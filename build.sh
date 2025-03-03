#!/bin/sh

git clone https://github.com/cjdelisle/openwrt.git
cd openwrt || exit 1
git checkout new-platform-en75

./scripts/feeds update -a
./scripts/feeds install -a

echo '
CONFIG_TARGET_en75=y
CONFIG_TARGET_en75_en751221=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_en75_en751221_DEVICE_en751221_generic=y
CONFIG_TARGET_DEVICE_en75_en751221_DEVICE_smartfiber_xp8421-b=y
CONFIG_TARGET_DEVICE_en75_en751221_DEVICE_tplink_archer-vr1200v-v2=y
CONFIG_PACKAGE_nand-utils=y
CONFIG_TARGET_ALL_PROFILES=y
CONFIG_TARGET_INITRAMFS_COMPRESSION_XZ=y
CONFIG_TARGET_ROOTFS_INITRAMFS=y
' > .config

make defconfig

make "-j$(nproc)"