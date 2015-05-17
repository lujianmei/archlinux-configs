#!/bin/bash
# Config the partition for new disk, based on two disk, one is for system, another is for home
#
#Device    Boot     Start       End   Blocks  Id System                #
#/dev/sda1           2048   1050623   524288  83 Linux                 #
#/dev/sda2        1050624  41943039 20446208   5 Extended              #
#/dev/sda5        1052672   5246975  2097152  82 Linux swap / Solaris  #
#/dev/sda6        5249024  26220543 10485760  83 Linux                 #
#/dev/sdb            2048  41943039  7860224  83 Linux                 #
########################################################################
# Write partition to disk
echo -e "n\np\n\n\n+512M\nn\ne\n\n\n\nn\nl\n\n+2G\nt\n5\n82\nn\nl\n\n\nw\n" | fdisk /dev/sda
#
## Format partitions
#
mkfs.ext2 /dev/sda1
mkfs.btrfs /dev/sda6
#No need to format
#mkfs.bfs /dev/sdb
mkswap /dev/sda5

#mkfs for sdb if second disk is new
echo -e "n\np\n\n\n\n\nw\n" |fdisk /dev/sdb
mkfs.btrfs /dev/sdb1

#
## mount new disk onto current system, allow me to install software on it
#
mount /dev/sda6 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sdb1 /mnt/home
#
## Active swap
#
swapon /dev/sda5

#
## Config pacman
#
#sed -i '/^\[core\]/{s@^@#@;n;s@^@#@}' /etc/pacman.conf
#sed -i '/^\[extra\]/{s@^@#@;n;s@^@#@}' /etc/pacman.conf
#sed -i '/^\[community\]/{s@^@#@;n;s@^@#@}' /etc/pacman.conf
#sed -i "/^#\[custom\]/{s@^#@@;n;s@^#@@;n;s@^.*@Server = file://$usbdir/pkg@}" /etc/pacman.conf
# Choose mirror in China for update
cat <<-end-of-mirrorlist > /etc/pacman.d/mirrorlist
Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch
Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
end-of-mirrorlist

#
## Install base system
#
#pacstrap /mnt base
pacstrap /mnt base base-devel
#pacstrap /mnt base base gnome
pacstrap /mnt grub

#
## generate partition filesystem
#
genfstab -U -p /mnt >> /mnt/etc/fstab
#
## Change root in order to do some config before reboot
#
arch-chroot /mnt


# Do configs

# Locale
sed -i '/^#en_US\.UTF-8 UTF-8/{s@^#@@}' /etc/locale.gen
sed -i '/^#zh_CN\.UTF-8 UTF-8/{s@^#@@}' /etc/locale.gen
sed -i '/^#zh_TW\.UTF-8 UTF-8/{s@^#@@}' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
# Time zone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# Hardware time
hwclock --systohc --utc
# Hostname
echo kevin-archlinux > /etc/hostname
# Create init ramdisk environment
mkinitcpio -p linux
# Config root password
#(echo "123456";sleep 1;echo "123456") | passwd
echo -e "123456\n123456\n" | passwd
# Install and config  bootloader
grub-install --boot-directory=/boot --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
# Create user
useradd -m -G wheel -s /usr/bin/zsh kevin
#(echo "123456";sleep 1;echo "123456") | passwd kevin
echo -e "123456\n123456\n" | passwd kevin
sed -i '/^# %wheel ALL=(ALL) NOPASSWD: ALL/{s@^#@@}' /etc/sudoers
