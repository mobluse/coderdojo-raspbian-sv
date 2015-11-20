CoderDojo-Raspbian-Swedish
==========================

This script simplifies installing several similar Raspberry Pi systems.

Contains the commented config.txt file for the Raspberry Pi further developed 
for a CoderDojo in Lund, Sweden.

Also contains installation scripts for BSDTar, Avahi, TightVNC-Server, XRDP,
Scratch2MCPI, Rhino, RLWrap, BYOB, Links, Commodore 64 with Comal 80, 
ABC 80 with Snake.

Avahi is used with Bonjour from iTunes in Windows, but is built-in to 
Mac OS X and Ubuntu Linux. You can extract the Bonjour installation program 
from iTunes using an archive manager that handles rar-files, e.g. 7-zip. 
Use the correct version of iTunes for your Windows! i.e. 32-bit or 64-bit. 
The purpose of Avahi is to configure IP-numbers without a DHCP-server and to 
be able to use names of computers without a nameserver, e.g. dojopi1.lan. 
This makes it possible to connect a Raspberry Pi to a laptop with a single 
ethernet-cable or via a simple hub. You can also switch on network sharing 
and use the laptop's Internet connection via WiFi or 3G from the Raspberry Pi.

One feature of this extension of the original OS is that you can use a laptop 
as a keyboard, mouse, and screen to a Raspberry Pi using 
RDP (Remote Desktop Protocol). It's better and faster to use a directly 
connected screen, but we usually don't have access to screens.

See "Enabling Remote Desktop Access with xrdp on a Raspberry Pi":  
http://www.maketecheasier.com/enabling-remote-desktop-access-on-raspberry-pi/  
See "RPi XRDP Server":  
http://elinux.org/RPi_XRDP_Server  
See "RPi VNC Server":  
http://elinux.org/RPi_VNC_Server  
In Ubuntu Linux I use Remmina Remote Desktop Client for RDP. For Mac OS X 
[Microsoft Remote Desktop](https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417) 
probably works for RDP.

See "Extend Minecraft Pi Edition using JavaScript via Java":  
http://www.raspberrypi.org/forums/viewtopic.php?p=552802#p552802

See "Installing BYOB in Raspbian":  
http://www.raspberrypi.org/forums/viewtopic.php?f=77&t=62781

##Install##

First you unpack NOOBS on an SD-card. You can use Windows or Mac OS X for 
this, but below is shown for Raspbian Linux.

Skip to next heading if you have a new, blank SD-card.

Use this to list partitions:  

    sudo fdisk -l

Use Parted or FDisk to remove all partitions from the SD-card you want to 
format and create a new, bootable W95 FAT32 (LBA) partition, see 
[this guide](http://qdosmsq.dunbar-it.co.uk/blog/2013/06/noobs-for-raspberry-pi/) 
or check this example:

    $ umount /dev/sda1 # Change sda1 to the device you will use.
    $ sudo fdisk /dev/sda  

    Command (m for help): d  
    Partition number (1-6): 1
    
    Command (m for help): d  
    Partition number (1-6): 2
    
    Command (m for help): d  
    Selected partition 3
    
    Command (m for help): d  
    No partition is defined yet!
    
    Command (m for help): p
    
    Disk /dev/sda: 15.9 GB, 15931539456 bytes  
    4 heads, 16 sectors/track, 486192 cylinders, total 31116288 sectors  
    Units = sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  
    Disk identifier: 0x000825fe  
    
       Device Boot      Start         End      Blocks   Id  System

    Command (m for help): n  
    Partition type:
       p   primary (0 primary, 0 extended, 4 free)  
       e   extended  
    Select (default p): p  
    Partition number (1-4, default 1): 1  
    Using default value 1  
    First sector (2048-31116287, default 2048):  
    Using default value 2048  
    Last sector, +sectors or +size{K,M,G} (2048-31116287, default 31116287):  
    Using default value 31116287
    
    Command (m for help): p
    
    Disk /dev/sda: 15.9 GB, 15931539456 bytes  
    4 heads, 16 sectors/track, 486192 cylinders, total 31116288 sectors  
    Units = sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  
    Disk identifier: 0x000825fe
    
       Device Boot      Start         End      Blocks   Id  System  
    /dev/sda1            2048    31116287    15557120   83  Linux  
    
    Command (m for help): t  
    Selected partition 1  
    Hex code (type L to list codes): l
    
     0  Empty  
     1  FAT12  
     2  XENIX root      39  Plan 9          83  Linux  
     3  XENIX usr  
     4  FAT16 <32M      40  Venix 80286     85  Linux extended  
     5  Extended  
     6  FAT16  
     7  HPFS/NTFS/exFAT  
     8  AIX  
     9  AIX bootable  
     a  OS/2 Boot Manag  
     b  W95 FAT32  
     c  W95 FAT32 (LBA)  
     e  W95 FAT16 (LBA)  
     f  W95 Ext'd (LBA)  
    Hex code (type L to list codes): c  
    Changed system type of partition 1 to c (W95 FAT32 (LBA))
    
    Command (m for help): p
    
    Disk /dev/sda: 15.9 GB, 15931539456 bytes  
    4 heads, 16 sectors/track, 486192 cylinders, total 31116288 sectors  
    Units = sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  
    Disk identifier: 0x000825fe
    
       Device Boot      Start         End      Blocks   Id  System  
    /dev/sda1            2048    31116287    15557120    c  W95 FAT32 (LBA)
    
    Command (m for help): a  
    Partition number (1-4): 1
    
    Command (m for help): p
    
    Disk /dev/sda: 15.9 GB, 15931539456 bytes  
    4 heads, 16 sectors/track, 486192 cylinders, total 31116288 sectors  
    Units = sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  
    Disk identifier: 0x000825fe
    
       Device Boot      Start         End      Blocks   Id  System  
    /dev/sda1   *        2048    31116287    15557120    c  W95 FAT32 (LBA)
    
    Command (m for help): w  
    The partition table has been altered!
    
    Calling ioctl() to re-read partition table.
    
    WARNING: If you have created or modified any DOS 6.x  
    partitions, please see the fdisk manual page for additional  
    information.  
    Syncing disks.  

End of example.

Format and name the SD-card:  

    sudo mkdosfs -n dojopi1 -F 32 -I /dev/sda1  
(You may need to do `umount /dev/sda1` before. Change sda1 to your partition and the name dojopi1 to what you like.)

###Unpack NOOBS to SD-card###

Remove and insert the USB SD-card reader/writer in order to mount automatically. Use this to find out where it is mounted:  

    mount | grep -i sda1  

Stream [NOOBS](http://www.raspberrypi.org/downloads/) down to the SD-card using this for small NOOBS files:

    curl -sL http://downloads.raspberrypi.org/NOOBS_latest | bsdtar -xvf- -C /media/pi/dojopi1/  
alternatively this for big NOOBS files:

    cd /media/pi/dojopi1/  
    curl -Lo NOOBS_latest.torrent http://downloads.raspberrypi.org/NOOBS_latest.torrent  
    ctorrent -p 51414 NOOBS_latest.torrent # Change 51414 to your listen port.  
    rm NOOBS_latest.torrent  
    unzip NOOBS_v1_4_2.zip  
    rm NOOBS_v1_4_2.zip  

###Those who created a NOOBS SD-card using other OS continue here###

Boot with NOOBS SD-card, keyboard, mouse, and screen. After boot use 1, 2, 3, and 4 to 
select HDMI, HDMI Safe, PAL, and NTSC, respectively. If you need to select 
video out again, press and hold Shift during boot. Install Raspbian from 
NOOBS.  

Configure using Raspberry Pi Configuration or Raspi-Config. Check that SSH is on.
In the future this configuration should be built-in to the 
upgrade.sh-script.

Install the rest of the programs by using this oneliner in the home 
directory (requires network):

    cd; git clone https://github.com/mobluse/coderdojo-raspbian-sv.git; . ~/coderdojo-raspbian-sv/upgrade.sh
