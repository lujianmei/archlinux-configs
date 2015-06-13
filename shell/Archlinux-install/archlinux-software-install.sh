#!/bin/sh
#Install some software

arch-chroot /mnt


#===========================================
# install software, include desktop, drivers, base software such as network, tools
# enable and start service
#===========================================
#pkg="xorg-utils xorg-server xorg-server-utils xf86-video-intel mesa alsa-utils
#xf86-input-synaptics wpa_supplicant wpa_actiond ntfs-3g dkms linux-headers zsh lightdm lightdm-gtk3-greeter fvwm habak
#scrot wqy-microhei ttf-dejavu xterm tmux fcitx-im pcmanfm gvfs xarchiver p7zip unrar unzip tint2 volumeicon conky lxappearance faenza-icon-theme abs git openssh emacs mplayer firefox firefox-i18n-zh-cn flashplugin wiznote"
#install desktop
echo -e "y\n" | pacman -Sy xorg-server xorg-server-utils xorg-utils mesa xorg-xinit xorg-twm xterm rxvt-unicode urxvt-perls rxvt-unicode-terminfo
#echo -e "y\n" | pacman -Sy xf86-video-vesa
echo -e "y\n" | pacman -Sy xf86-video-intel
echo -e "y\n" | pacman -Sy xf86-input-keyboard
echo -e "y\n" | pacman -Sy xf86-input-mouse
echo -e "y\n" | pacman -Sy xf86-input-evdev
echo -e "y\n" | pacman -Sy xf86-input-synaptics
#install openbox
echo -e "y\n" | pacman -Sy openbox
#install fvwm
echo -e "y\n" | pacman -Sy fvwm perl-tk perl-x11-protocol

#install audio system
echo -e "y\n" | pacman -Sy alsa-utils

#install network
echo -e "y\n" | pacman -Sy net-tools #有线
#echo -e "y\n" | pacman -Sy wireless_tools wpa_supplicant wpa_actiond dialog #无线
echo -e "y\n" | pacman -Sy wireless_tools wpa_supplicant wpa_supplicant_gui wpa_actiond dialog #无线
echo -e "y\n" | pacman -Sy networkmanager network-manager-applet
#echo -e "y\n" | pacman -Sy xfce4-notifyd
#gpasswd -a USERNAME network
gpasswd -a kevin network

#install ntfs-3g
echo -e "y\n" | pacman -Sy ntfs-3g

#install zsh & openssh
echo -e "y\n" | pacman -Sy zsh openssh x11-ssh-askpass

#install power manager
echo -e "y\n" | pacman -Sy tlp tlp-rdw
#To avoid filesystem curruption on btrfs formated partitions
echo "SATA_LINKPWR_ON_BAT=max_performance " > /etc/default/tlp

# Start Service
#sudo systemctl enable netctl-auto@.service
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
systemctl enable NetworkManager-dispatcher.service
systemctl enable sshd
#start power manager service
systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl mask systemd-rfkill@.service


#===========================================
# install software, include tools
#===========================================
#install fonts
echo -e "y\n" | pacman -Sy wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming ttf-dejavu
#install fcitx
echo -e "y\n" | pacman -Sy fcitx fcitx-im fcitx-configtool fcitx-sunpinyin fcitx-table-extra kcm-fcitx fcitx-ui-light fcitx-table-other fcitx-googlepinyi


#install tools
echo -e "y\n" | pacman -Sy gvfs xarchiver p7zip unrar unzip tint2 volumeicon conky  abs git emacs mplayer firefox chromium flashplugin thunar thunar-volman
echo -e "y\n" | pacman -Sy vpnc networkmanager-vpnc kdegraphics-okular gimp shutter gnome-web-photo htop orange feh tint2 gedit freemind wireshark-cli wireshark-gtk meld nginx gcolor2 ristretto tumbler xorg-xrandr arandr  habak scrot xlockmore xcompmgr wget
#install tools from xfce4
echo -e "y\n" | pacman -Sy xfce4-appfinder xfce4-mixer xfce4-terminal xfce4-notes-plugin
echo -e "y\n" | pacman -Sy catdoc qbittorrent
echo -e "y\n" | pacman -Sy guake #a terminal

#install thunar plugins
echo -e "y\n" | pacman -Sy catfish

#install a linux-lts for kernel backup
echo -e "y\n" | pacman -S linux-lts linux-lts-headers



#===========================================
# exchange user, and install some user related software, kind of develop envoriment
#===========================================

su kevin

# SSH TODO: add multiple email

#Config for kevin user env
#ssh-keygen -t rsa -C "lujianmei"
#Clone configs from github

#arch-chroot /mnt chown -R kevin /home/kevin

#use zsh instead of bash

chsh -s /bin/zsh #need to input password
#config oh-my-zsh
cd /home/kevin
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#install docker and config it
echo -e "y\n" | sudo pacman -Sy docker
echo -e "y\n" | sudo pacman -Sy docker
echo -e "y\n" | sudo pacman -Sy btrfs-progs lxc
gpasswd -a kevin docker
systemctl enable docker
systemctl start docker
docker info

#install virtualbox
echo -e "y\n" |sudo pacman -Sy  virtualbox-host-modules virtualbox virtualbox-host-dkms linux-headers

dkms install vboxhost/$(echo -e "y\n" | sudo pacman -Q virtualbox|awk {'print $2'}|sed 's/\-.\+//') -k $(uname -rm|sed 's/\ /\//')
echo -e "y\n" |sudo pacman -Sy virtualbox-guest-utils
sudo modprobe -a vboxguest vboxsf vboxvideo
sudo modprobe vboxdrv
sudo systemctl enable dkms.service



#===========================================
# install emacs and download configuration from github
#===========================================

#install emacs related software
#echo -e "y\n" |sudo pacman -Sy wanderlust
echo -e "y\n" |sudo pacman -Sy ditaa
echo -e "y\n" |sudo pacman -Sy graphviz
echo -e "y\n" |sudo pacman -Sy semi
# TODO: change to AUR install
#echo -e "y\n" |sudo pacman -Sy platuml

 echo -e "y\n" |sudo pacman -Sy w3m emacs-w3m-cvs
#echo -e "y\n" |sudo pacman -Sy bbdb
# clone config files from github
#git clone git@github.com:lujianmei/emacs.d.git ~/.emacs.d
git clone https://github.com/lujianmei/emacs.d.git ~/.emacs.d
#config for wanderlust
#mkdir ~/mails
#ln ~/mails/folders ~/.emacs.d/users/kevin/folders

#install latex tools in emacs, and related fonts when export latex into pdf files
echo -e "y\n" |sudo pacman -Sy texlive-bin texlive-core texlive-fontsextra texlive-formatsextra texlive-langchinese texlive-langcjk texlive-langextra texlive-pictures
echo -e "y\n" |sudo pacman -Sy adobe-source-han-sans-otc-fonts wqy-microhei
#install fonts
sudo mkdir /usr/share/fonts/windows
sudo cp ~/archlinux-config/fonts/* /usr/share/fonts/windows
cd /usr/share/fonts/windows
sudo mkfontdir


#===========================================
# install email client mutt and related configure
#===========================================

# config mutt for email clint
echo -e "y\n" |sudo pacman -Sy mutt abook smtp-forwarder msmtp offlineimap notmuch python2-keyring

#clone github
git clone https://github.com/lujianmei/.mutt.git ~/.mutt

#config offlineimap, for email downloading
offlineimap -c ~/.mutt/.offlineimaprc
ln -s  ~/.mutt/.offlineimaprc ~/.offlineimaprc

#config password, First create a pair of public/private keys:
gpg --gen-key
# create a file include your email
echo -e "set my_pw_personal = ****" > ~/.mutt/.my-pwd
gpg -e -r 'lujianmei' ~/.mutt/.my-pwds
rm -fr ~/.mutt/.my-pwds

#config notmuch, for email indexing and searching
notmuch config set ENVIRONMENT.NOTMUCH_CONFIG ~/.mutt/.notmuch-config
#config msmtp, for email sending service
msmtp -C ~/.mutt/.msmtprc

#sudo mkdir -p /etc/systemd/system/
sudo ln -s /home/kevin/archlinux-config/root/etc/systemd/system/offlineimap@.service /etc/systemd/system/offlineimap@.service
sudo systemctl enable offlineimap

#yaourt -S nmzmail


#===========================================
# install software, include desktop, drivers, base software such as network, tools
#
#===========================================

#config localization, support Chinese
echo "export LANG=en_US.UTF-8" > ~/.xinitrc
echo "export LANGUAGE=en_US:UTF-8" > ~/.xinitrc
echo "export LC_CTYPE=zh_CN.UTF-8" > ~/.xinitrc
echo "#support fcitx on qt5" > ~/.xinitrc
echo "export GTK_IM_MODULE=fcitx" > ~/.xinitrc
echo "export QT_IM_MODULE=fcitx" > ~/.xinitrc
echo "export XMODIFIERS=@im=fcitx" > ~/.xinitrc
echo "export XIM=fcitx" > ~/.xinitrc
echo "export XIM_PROGRAM=fcitx" > ~/.xinitrc
echo "# add keymap for changing ctrl and capslock" > ~/.xinitrc
echo "setxkbmap -option 'ctrl:swapcaps'" > ~/.xinitrc
echo "#setxkbmap -option 'ctrl:swap_rwin_rctl'" > ~/.xinitrc

#using openbox as default desktop
echo "exec openbox-session" > ~/.xinitrc
echo "#exec xfce4-session" > ~/.xinitrc
echo "#exec fvwm" > ~/.xinitrc

#download config files from github




#===========================================
# install software, include desktop, drivers, base software such as network, tools
#
#===========================================

#install yaourt, then install plantuml
# dowload pkg from package-query
# dowload pkg from yaourt
#yaourt plantuml
#yaourt wps-office ttf-symbola
#yaourt xlhtml  #to support view excel&ppt in wanderlust


#download nodejs
echo "y\n" | sudo pacman -S nodejs nodejs-less npm

#download coolbooker and jeboorker, a ebook reader and manager
yaourt -S coolbooker jeboorker

#download ia32, for support android development, or ./adb will cause error
sudo pacman -S lib32-glibc lib32-zlib lib32-libstdc++5 lib32-ncurses lib32-gcc-libs
