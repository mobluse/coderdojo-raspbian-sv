#!/bin/sh
sudo unzip -jo master.zip coderdojo-raspbian-sv-master/boot/config.txt -d /boot
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install bsdtar links rhino rlwrap tightvncserver xrdp

# See http://pi.minecraft.net/ & http://www.minecraftforum.net/forum/216-minecraft-pi-edition/
rm -rf mcpi
wget -qO- https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz | bsdtar -xvf- -C ~

# See http://www.raspberrypi.org/forums/viewtopic.php?p=503683#p503683
wget https://dl.dropbox.com/s/zgkq2jw9o9wbava/installBYOB.sh -O installBYOB.sh
sudo bash installBYOB.sh
