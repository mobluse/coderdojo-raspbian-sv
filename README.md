CoderDojo-Raspbian-Swedish
==========================

This script simplifies installing several similar Raspberry Pi systems.

Contains the commented config.txt file for the Raspberry Pi further developed for a CoderDojo in Lund, Sweden.

Also contains installation scripts for BSDTar, Minecraft Pi Edition (MCPI) v0.1.1, Links, Rhino, RLWrap,
TightVNC-Server, and XRDP.

See "Extend Minecraft Pi Edition using JavaScript via Java":  
http://www.raspberrypi.org/forums/viewtopic.php?p=552802#p552802

See "Enabling Remote Desktop Access with xrdp on a Raspberry Pi":  
http://www.maketecheasier.com/enabling-remote-desktop-access-on-raspberry-pi/

See "RPi XRDP Server":  
http://elinux.org/RPi_XRDP_Server

See "RPi VNC Server":  
http://elinux.org/RPi_VNC_Server

##Installation##

The next three paragraphs may be skipped if you have a new SD-card.

Use this to list partitions:  
sudo fdisk -l

Use Parted to remove partitions from the SD-card you want to format and create a new partition.

Format and name the SD-card:  
sudo mkdosfs -n dojopi1 -F 32 -I /dev/sde1
(Change sde1 to your partition and the name dojopi1 to what you like.)

Stream [NOOBS](http://www.raspberrypi.org/downloads/) down to the SD-card using:  
wget -qO- http://downloads.raspberrypi.org/NOOBS_latest | bsdtar -xvf- -C /dev/sde1

Install Raspbian from NOOBS.

Configure using Raspi-Config. In the future this configuration should be built-in to the script.

Install the rest of the programs by using this oneliner in the home directory:  
curl -L -o master.zip https://github.com/mobluse/coderdojo-raspbian-sv/archive/master.zip; unzip -jo master.zip coderdojo-raspbian-sv-master/upgrade.sh; . upgrade.sh
