#!/bin/sh

git clone https://github.com/cjdelisle/openwrt.git
cd openwrt || exit 1
git checkout new-platform-econet-jun4

./scripts/feeds update -a
./scripts/feeds install -a

echo '
CONFIG_TARGET_econet=y
CONFIG_TARGET_econet_en751221=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_econet_en751221_DEVICE_smartfiber_xp8421-b=y
CONFIG_TARGET_DEVICE_econet_en751221_DEVICE_tplink_archer-vr1200v-v2=y
CONFIG_PACKAGE_nand-utils=y
CONFIG_TARGET_INITRAMFS_COMPRESSION_NONE=y
CONFIG_TARGET_ROOTFS_INITRAMFS=y
' > .config

make defconfig

make "-j$(nproc)"

# CONFIG_TARGET_ALL_PROFILES=y