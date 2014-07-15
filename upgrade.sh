#!/bin/sh
sudo unzip -jo master.zip coderdojo-raspbian-sv-master/boot/config.txt -d /boot
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install bsdtar links rhino rlwrap tightvncserver xrdp avahi-daemon avahi-autoipd freepats

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
wget 'http://c64.orbin.se/Comal 80 (1985)(Commodore)[a].crt'
cd

# See http://www.raspberrypi.org/forums/viewtopic.php?p=534518#p534518
wget http://df.lth.se.orbin.se/~mikaelb/abc/80/abc80sim-2.1-raspi.tar.gz
tar xvf abc80sim-2.1-raspi.tar.gz
mv abc80sim-2.1-raspi abc80sim-2.1
cd ~/abc80sim-2.1/abcdir/
wget http://df.lth.se.orbin.se/~mikaelb/abc/80/masken.bas
cd
