# Readme
## Archlinux Install Scrip

   + Important

   Most important to know, this script is build on two disk:
     * disk /dev/sda is for storing system, will will be sperated to two partition: / and /boot;
     * disk /dev/sdb is for home directory, will be just format as btrfs in one partion, will be mounted on /home;
   So i suggest you fork this repo to your own, and make some changes for your own situation.
   ```
   lsblk # check your disk
   ```
   ```
   fdisk /dev/sda # check the partition on sda, make sure this is a new disk
   ```
   ```
   fdisk /dev/sdb # check the partition on sdb, make sure this is a new disk
   ```

   Backup data if you use an used disk.

   + How to use it

   Firstly, you should download the newest archlinux-<date>-dual.iso.
   When you boot with one of a iso archlinux from a usb device, you can just open a terminal and then execute followin code.
   But before a script check will be a strong recommendation for you, since you will have to modify the fdisk commend, and arrange your disk for multiple partitions
   And the software you want to install after system. These parts can be customized by your onw needs.

   ```
   curl -L https://raw.githubusercontent.com/lujianmei/my-shellscript/master/Archlinux-install/archlinux-install.sh |sh
   ```

## Software Install Scrip

   After install base system, you can follow following script to install softwares.
   The desktop i install fvwm, openbox, and xfce4;

   ```
   curl -L https://raw.githubusercontent.com/lujianmei/my-shellscript/master/Archlinux-install/archlinux-software-install.sh |sh
   ```
