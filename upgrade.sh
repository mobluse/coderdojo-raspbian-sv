#!/bin/sh
cd
if [ ! -f /boot/config.org.txt ]; then
  sudo cp /boot/config.txt /boot/config.org.txt
fi
#if [ ! -f master.zip ]; then
#  curl -L -o master.zip https://github.com/mobluse/coderdojo-raspbian-sv/archive/master.zip
#fi
#sudo unzip -jo master.zip coderdojo-raspbian-sv-master/boot/config.txt -d /boot
sudo cp ~/coderdojo-raspbian-sv/boot/config.txt /boot
#rm master.zip
#~/coderdojo-raspbian-sv/update
sudo apt-get update
#sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install bsdtar links rhino icedtea-plugin rlwrap \
  tightvncserver xrdp avahi-autoipd espeak gpm obconf
# Removed: avahi-daemon dosfstools freepats ntfs-3g raspberrypi-net-mods
# See http://pi.minecraft.net/ & http://www.minecraftforum.net/forum/216-minecraft-pi-edition/
#rm -rf mcpi
#wget -qO- https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz | bsdtar -xvf- -C ~
sudo rm -rf ~/mcpi
rm ~/Desktop/mcpi.desktop
dirs=$(find /opt/minecraft-pi/ -type d | sed 's|^/opt/minecraft-pi|mcpi|'); for dir in $dirs; do mkdir $dir; done
dirs=$(find /opt/minecraft-pi/ -type f | sed 's|^/opt/minecraft-pi||'); for dir in $dirs;
do ln -sf '/opt/minecraft-pi'$dir 'mcpi'$dir; done

# Download Python samples
echo -e "\n\033[36m\033[1mDownloading Python samples...\033[00m\n"
if [ -f ~/mcpi/api/python/sphere.py ]; then
  echo -e "\n\033[33m\033[1msphere.py exists. Skipped downloading.\033[00m\n"
else
  wget -P ~/mcpi/api/python http://scratch2mcpi.github.io/python_samples/sphere.py
  chmod a+x ~/mcpi/api/python/sphere.py
fi

echo -e "\n\033[32m\033[1mInstallation of minecraft-pi is completed.\033[00m\n"

wget -qO- http://scratch2mcpi.github.io/install.sh | sh
if [ -f ~/Documents/Scratch\ Projects/mcpi_double_rainbow.sb ]; then
  echo -e "\n\033[33m\033[1mmcpi_double_rainbow.sb exists. Skipped downloading.\033[00m\n"
else
  wget -O ~/Documents/Scratch\ Projects/mcpi_double_rainbow.sb \
    http://projects.scratch.mit.edu/internalapi/project/13703270/get/
fi


# See http://www.raspberrypi.org/forums/viewtopic.php?p=503683#p503683
if [ ! -f ~/Desktop/BYOB.desktop ]; then
  wget https://dl.dropbox.com/s/zgkq2jw9o9wbava/installBYOB.sh
  sudo bash installBYOB.sh
  rm -f BYOB-Pi.image
  rm -f byoblib.tgz
fi

# Download Whiskers, see https://www.raspberrypi.org/forums/viewtopic.php?p=838089
if [ ! -f /usr/share/scratch/Whiskers.image ]; then
  wget -O Whiskers.image 'https://sites.google.com/site/filedownloader123/files/Scratch.image?attredirects=0&d=1'
  sudo mv Whiskers.image /usr/share/scratch/
  # Start with: scratch.old --image /usr/share/scratch/Whiskers.image
fi

# See http://www.raspberrypi.org/forums/viewtopic.php?p=534518#p534518
if [ ! -f ~/abc80sim-2.1/abcdir/masken.bas ]; then
  wget http://df.lth.se.orbin.se/~mikaelb/abc/80/abc80sim-2.1-raspi.tar.gz
  tar xvf abc80sim-2.1-raspi.tar.gz
  rm abc80sim-2.1-raspi.tar.gz
  mv abc80sim-2.1-raspi abc80sim-2.1
  cd ~/abc80sim-2.1/abcdir/
  wget http://df.lth.se.orbin.se/~mikaelb/abc/80/masken.bas
  cd
fi

# See https://www.raspberrypi.org/forums/viewtopic.php?f=78&t=69420&p=775780#p775780
if [ ! -f /usr/local/bin/x64 ]; then
  wget -O vice_2.4.20-1_armhf.deb 'https://docs.google.com/uc?id=0B1BUnz1FfQj3bW5FV0hWZnJIcVE&export=download'
  sudo dpkg -i vice_2.4.20-1_armhf.deb
  sudo apt-get -f install
  mkdir ~/c64
  cd ~/c64
  # x64 -sdlbitdepth 8
  # Save settings within VICE (F12/Settings management/Save current settings), then start with
  # x64
  # Settings are saved in /home/pi/.vice/sdl-vicerc
  wget 'http://c64.orbin.se/Comal 80 (1985)(Commodore)[a].crt'
  cd
  rm vice_2.4.20-1_armhf.deb
fi
