#!/bin/sh
rm -rf mcpi
wget -qO- https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz | bsdtar -xvf- -C ~
sudo unzip -jo master.zip coderdojo-raspbian-sv-master/boot/config.txt -d /boot
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install links bsdtar rhino rlwrap tightvncserver xrdp
