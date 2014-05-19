CoderDojo-Raspbian-Swedish
==========================

This script simplifies installing several similar Raspberry Pi systems.

Contains the commented config.txt file for the Raspberry Pi further developed for a CoderDojo in Lund, Sweden.

Details taken from the eLinux wiki:  
http://elinux.org/RPi_config.txt

Also contains installation scripts for BSDTar, Minecraft Pi Edition (MCPI) v0.1.1, Links, Rhino, RLWrap,
TightVNC-server, and XRDP.

See "Extend Minecraft Pi Edition using JavaScript via Java":  
http://www.raspberrypi.org/forums/viewtopic.php?p=552802#p552802

See "RPi VNC Server":
http://elinux.org/RPi_VNC_Server

See "Enabling Remote Desktop Access with xrdp on a Raspberry Pi":
http://www.maketecheasier.com/enabling-remote-desktop-access-on-raspberry-pi/

##Installation##

Install by using this oneliner in the home directory:  
curl -L -o master.zip https://github.com/mobluse/coderdojo-raspbian-sv/archive/master.zip; unzip -jo master.zip coderdojo-raspbian-sv-master/upgrade.sh; . upgrade.sh
