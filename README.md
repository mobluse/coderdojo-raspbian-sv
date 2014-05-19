CoderDojo-Raspbian-Swedish
==========================

This script simplifies installing several similar Raspberry Pi systems.

Contains the commented config.txt file for the Raspberry Pi further developed for a CoderDojo in Lund, Sweden.

Details taken from the eLinux wiki:  
http://elinux.org/RPi_config.txt

Also contains installation scripts for BSDTar, Links, Rhino, RLWrap, and Minecraft Pi Edition (MCPI) v0.1.1.

See "Extend Minecraft Pi Edition using JavaScript via Java":  
http://www.raspberrypi.org/forums/viewtopic.php?f=49&t=73473&p=528116

##Installation##

Install by using this oneliner in the home directory:  
curl -L -o master.zip https://github.com/mobluse/coderdojo-raspbian-sv/archive/master.zip; unzip -jo master.zip coderdojo-raspbian-sv-master/upgrade.sh; . upgrade.sh
