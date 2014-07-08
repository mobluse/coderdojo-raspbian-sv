#!/bin/sh
sudo unzip -jo master.zip coderdojo-raspbian-sv-master/boot/config.txt -d /boot
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install bsdtar links rhino rlwrap tightvncserver xrdp

# See http://pi.minecraft.net/ & http://www.minecraftforum.net/forum/216-minecraft-pi-edition/
rm -rf mcpi
wget -qO- https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz | bsdtar -xvf- -C ~

# See http://www.raspberrypi.org/forums/viewtopic.php?p=503683#p503683
wget https://dl.dropbox.com/s/zgkq2jw9o9wbava/installBYOB.sh -O installBYOB.sh
sudo bash installBYOB.sh

# See http://www.raspberrypi.org/forums/viewtopic.php?f=78&t=69420&p=551155
wget -O c64.zip 'https://docs.google.com/uc?authuser=0&id=0B51Q7dpulGC8dEVtTk5ReFBLX0U&export=download'
unzip c64.zip
cd ~/c64
sudo mv vice /usr/local/lib/
chmod +x x64
sudo mv x64 /usr/local/bin/
# x64 -sdlbitdepth 8
# Save settings within VICE (F12/Settings management/Save current settings), then start with 
# x64
