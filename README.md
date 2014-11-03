CoderDojo-Raspbian-Swedish
==========================

This script simplifies installing several similar Raspberry Pi systems.

Contains the commented config.txt file for the Raspberry Pi further developed for a CoderDojo in Lund, Sweden.

Also contains installation scripts for BSDTar, Avahi, TightVNC-Server, XRDP,
Scratch2MCPI, Rhino, RLWrap, BYOB, Links, Commodore 64 with Comal 80, ABC 80 with Snake.

Avahi is used with Bonjour from iTunes in Windows, but is built-in to Mac OS X and Ubuntu Linux. You can extract the Bonjour installation program from iTunes using an archive manager that handles rar-files, e.g. 7-zip. Use the correct version of iTunes for your Windows! i.e. 32-bit or 64-bit. The purpose of Avahi is to configure IP-numbers without a DHCP-server and to be able to use names of computers without a nameserver, e.g. dojopi1.local. This makes it possible to connect a Raspberry Pi to a laptop with a single ethernet-cable or via a simple hub. You can also switch on network sharing and use the laptop's Internet connection via WiFi or 3G from the Raspberry Pi.

One feature of this extension of the original OS is that you can use a laptop as a keyboard, mouse, and screen to a Raspberry Pi using RDP (Remote Desktop Protocol). It's better and faster to use a directly connected screen, but we usually don't have access to screens.

See "Enabling Remote Desktop Access with xrdp on a Raspberry Pi":  
http://www.maketecheasier.com/enabling-remote-desktop-access-on-raspberry-pi/  
See "RPi XRDP Server":  
http://elinux.org/RPi_XRDP_Server  
See "RPi VNC Server":  
http://elinux.org/RPi_VNC_Server  
In Ubuntu Linux I use Remmina Remote Desktop Client for RDP. For Mac OS X [Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417) probably works for RDP.

See "Extend Minecraft Pi Edition using JavaScript via Java":  
http://www.raspberrypi.org/forums/viewtopic.php?p=552802#p552802

See "Installing BYOB in Raspbian":  
http://www.raspberrypi.org/forums/viewtopic.php?f=77&t=62781

##Installation##

First you install NOOBS on an SD-card. You can use Windows or Mac OS X for this, but below is shown for Raspbian Linux.

The next two paragraphs may be skipped if you have a new, blank SD-card.

Use this to list partitions:  
sudo fdisk -l

Use Parted or FDisk to remove all partitions from the SD-card you want to format and create a new, bootable W95 FAT32 partition.

Format and name the SD-card:  
sudo mkdosfs -n dojopi1 -F 32 -I /dev/sde1  
(Change sde1 to your partition and the name dojopi1 to what you like.)

Remove and insert the USB SD-card reader/writer in order to mount automatically. Use this to find out where it is mounted:  
mount | grep -i sde1

Stream [NOOBS](http://www.raspberrypi.org/downloads/) down to the SD-card using:  
wget -qO- http://downloads.raspberrypi.org/NOOBS_latest | bsdtar -xvf- -C /media/dojopi1/  
alternatively:  
curl -sL http://downloads.raspberrypi.org/NOOBS_latest | bsdtar -xvf- -C /media/dojopi1/

Those who installed NOOBS using other OS continue here.

Boot with keyboard, mouse, and screen. After boot use 1, 2, 3, and 4 to select HDMI, HDMI Safe, PAL, and NTSC, respectively. If you need to select video out again, press and hold Shift during boot. Install Raspbian from NOOBS.  

Configure using Raspi-Config (starts automatically on first boot). Switch on SSH. In the future this configuration should be built-in to the script.

Install the rest of the programs by using this oneliner in the home directory (requires network):  
curl -L -o master.zip https://github.com/mobluse/coderdojo-raspbian-sv/archive/master.zip; unzip -jo master.zip coderdojo-raspbian-sv-master/upgrade.sh; . upgrade.sh
