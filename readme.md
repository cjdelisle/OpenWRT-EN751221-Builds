# OpenWRT builds for EN751221 Devices

This repository contains the github actions to build and release
OpenWRT for EN751221 devices including the SmartFiber XP8421-B and
TP-Link Archer VR1200v (v2).

**WARNING:** This OS is *minimal*, there is no support for Ethernet,
wifi, or USB yet. You can only communicate with it using UART. Drivers
for these devices have not yet been written.

The code that's being built here can be found in https://github.com/cjdelisle/openwrt/tree/new-platform-econet-jun4
