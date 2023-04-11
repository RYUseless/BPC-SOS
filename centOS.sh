##Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
#TODO: ADD % CHANCE TO DELETE WHOLE os
clear
echo "--- BPC-SOS <T E S T I N G> SCRIPT ---"
text="Loading whole universe for this hell script to work: "
echo -ne $text'[#####                   ] (33%)\r' ;sleep 1.5
echo -ne $text'[#############           ] (66%)\r' ;sleep 1.5
echo -ne $text'[########################] (-500000%)\r'
echo -ne '\n'
RED='\033[0;31m' # Red Color
NC='\033[0m' # No Color
printf "${RED}Crytical error, even universe couldnt make this work :(${NC}"
sleep 5; clear
# this is just me fooling around :)

## XORG, XTERM, .XINITRC SETUP + SMALL TEST 
dnf -y --setopt=install_weak_deps=False install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\n xterm -e \" echo 'xterm works'; sleep 5; exit \" " >> ~/.xinitrc
startx || exit 1 
sed -i '3s/.*/xterm/' ~/.xinitrc #changing the testing like just for "xterm" so it just launcher console emulator

dnf -y --setopt=install_weak_deps=False install wget #later add up to the xorg install
## BROWSER + PDF VIEWER
#Installing Palemoon web browser
#this should work on both centos 8 and centos 9
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
dnf -y --setopt=install_weak_deps=False install palemoon
echo "palemoon" > /etc/dnf/protected.d/palemoon.conf #making palemoon protected
#PDF reader install (GV)
#pick mirror (based on centos version you have)
#dnf -y --setopt=install_weak_deps=False install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm #CentOS-8
dnf -y --setopt=install_weak_deps=False install https://download-ib01.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/g/gv-3.7.4-29.el9.x86_64.rpm  #Centos-9
#removing wget and git
dnf -y --setopt=clean_requirements_on_remove=1 remove git wget openssh firewalld vi
dnf -y autoremove && dnf clean all; #this should work for orphans and remove dnf cache?

## .BASHRC EDIT
echo -e "\n# - - R Y U A  U T I S M - - " >> ~/.bashrc
echo -e "cd ~" >> ~/.bashrc # for some reason script stays in /BPC-SOS, and i dont know why
echo -e "XTRM=\`pgrep xterm\`\nif [ -z \"\$XTRM\" ]; then\n	startx\nelse\n	resize -s 55 165\n fi\n" >> ~/.bashrc
echo "find / -name '*.cache' -exec rm -rfv '{}' \;" >> ~/.bashrc
echo "find /var/ -name '*cache' -exec rm -rfv '{}' \;" >> ~/.bashrc
echo "find / -wholename '*/log/*' -exec rm -rfv '{}' \;" >> ~/.bashrc
echo "find / -wholename '*/tmp/*' -exec rm -rfv '{}' \;" >> ~/.bashrc
echo "find / -wholename '*/rsyslog' -exec rm -rfv '{}' \;" >> ~/.bashrc
echo "rm  ~/.thumbnails/*" >> ~/.bashrc
echo "rm  ~/.bash_history/*" >> ~/.bashrc
echo "rm -rfv ~/.moonchild\ productions/" >> ~/.bashrc
echo "clear" >> ~/.bashrc
echo -e "\n# A L I A S  F O R  S O S thing" >> ~/.bashrc
echo "alias home='cd ~'" >> ~/.bashrc
echo "alias velikost='cd ~;./velikost.sh'" >> ~/.bashrc
echo "echo 'Pro zobrazeni velikost lze napsat do konzole: velikost'" >> ~/.bashrc
echo "# E N D  O F  R Y U  A U T I S M" >> ~/.bashrc

## Velikost script 
touch ~/velikost.sh
chmod +x ~/velikost.sh
echo "du / --exclude=/{proc,sys,dev} -abc | sort -n" >> ~/velikost.sh

##Removing all sorts of packages
clear; echo "Now script will try to remove whole bunch of things" && sleep 2;
clear
#removing with find
find /boot/* -type f -name '*0-rescue*' -exec rm -rfv '{}' \; #finding and removing initframs rescue
find / -name "opt" -exec rm -rfv '{}' \; 
find /usr/* -name "locale" -exec rm -rfv '{}' \; #test this for find in root
find / -name "games" -exec rm -rfv '{}' \;
find / -name "*email*" -exec rm -rfv '{}' \; #deleting email in dnf/ breaks the dnf, but at this point I dont need it
find / -name '*mail' -exec rm -rfv '{}' \; #later merge '*email*' and '*mail'
find / -name "*bluetooth*" -exec rm -rfv '{}' \;
find / -name '*watchdog*' -exec rm -rfv '{}' \;
find / -name '*usb*' -exec rm -rfv '{}' \;
find / -name '*cdrom*' -exec rm -rfv '{}' \;
find / -name '*wireless*' -exec rm -rfv '{}' \;
find / -name '*nvme*' -exec rm -rfv '{}' \;
find / -name '*audio*' -exec rm -rfv '{}' \; #testing
find / -name 'man*' -exec rm -rfv '{}' \; #testing
find / -name 'dnf*' -exec rm -rfv '{}' \; #testing
find / -name 'yum*' -exec rm -rfv '{}' \; #testing
find / -name 'rpm' -exec rm -rfv '{}' \; #testing
find / -name 'python*' -exec rm -rfv '{}' \; #testing
find / -name 'locale' -exec rm -rfv '{}' \; #testing
find / -name '*kdump*' -exec rm -rfv '{}' \; #testing
find / -name 'microcode*' -exec rm -rfv '{}' \; #testing
find / -name 'zoneinfo' -exec rm -rfv '{}' \; #testing
find / -name 'redhat*' -exec rm -rfv '{}' \; #testing
find / -name 'mime*' -exec rm -rfv '{}' \; #testing
find / -name 'ssh*' -exec rm -rfv '{}' \; #testing
find / -name 'hwdata' -exec rm -rfv '{}' \; #testing
find / -name 'icons' -exec rm -rfv '{}' \; #testing
find / -name 'gnupg' -exec rm -rfv '{}' \; #testing
find / -name 'selinux' -exec rm -rfv '{}' \; #testing
find / -name 'alsa' -exec rm -rfv '{}' \; #testing
find / -name 'liblvm*' -exec rm -rfv '{}' \; #testing
find / -name 'libdb-*' -exec rm -rfv '{}' \; #testing
find / -name 'libldb-*' -exec rm -rfv '{}' \; #testing
find / -name 'libsolv*' -exec rm -rfv '{}' \; #testing
find / -name 'libnss_*' -exec rm -rfv '{}' \; #testing
find / -name 'lua*' -exec rm -rfv '{}' \; #testing
find / -name 'vmlinuz' -exec rm -rfv '{}' \; #testing
find / -name 'message' -exec rm -rfv '{}' \; #testing
find / -name 'polkit*' -exec rm -rfv '{}' \; #testing
find / -name 'themes' -exec rm -rfv '{}' \; #testing
find / -name 'sssd*' -exec rm -rfv '{}' \; #testing
find / -name 'sgml*' -exec rm -rfv '{}' \; #testing
find / -name 'zsh' -exec rm -rfv '{}' \; #testing
find / -name 'firewalld' -exec rm -rfv '{}' \; #testing
find / -name 'nm-initrd-generator' -exec rm -rfv '{}' \; #testing
find / -name 'bash-completion' -exec rm -rfv '{}' \; #testing
find / -name 'glib*' -exec rm -rfv '{}' \; #testing
find / -name 'dracut' -exec rm -rfv '{}' \; #testing
find / -name 'pki' -exec rm -rfv '{}' \; #testing
find / -name '*dump*' -exec rm -rfv '{}' \; #testing
find / -name 'radeon' -exec rm -rfv '{}' \; #testing
find / -name 'amd' -exec rm -rfv '{}' \; #testing
find / -name '*sr_mod*' -exec rm -rfv '{}' \; #testing
#metadata

#removing /usr
#find /usr -name 'sound*' -exec rm -rfv '{}' \;
find / -name 'sound*' -exec rm -rfv '{}' \; # testing
find /usr -name 'info' -exec rm -rfv '{}' \; #testing
find /usr/ -name 'firmware' -exec rm -rfv '{}' \; #testing, merge with firmware if works

#removing /lib and /lib64
rm -rfv /usr/lib/firmware/ #removing firmware
rm -rfv /usr/lib64/gio
rm -rfv /usr/lib64/girepository-1.0
rm -rfv /usr/lib64/libbrotlienc.so.1.0.9
rm -rfv /usr/lib64/libdw-0.188.so
rm -rfv /usr/lib64/libfdisk.so.1.1.0
rm -rfv /usr/lib64/libldb.so.2.6.1
rm -rfv /usr/lib64/libnss_resolve.so.2
rm -rfv /usr/lib64/libsolv.so.1
rm -rfv /usr/lib64/per15/
rm -rfv /usr/lib/udev/hwdb.d/
rm -rfv /usr/lib/.build-id
find /usr/lib64/* -name 'gconv*' -exec rm -rfv '{}' \;
find /usr/lib64/* -name 'rsyslog*' -exec rm -rfv '{}' \;
find /usr/lib -name '*iso*' -exec rm -rfv '{}' \; #testing
cd $(find /usr/lib/modules -name '*.x86_64') && cd kernel/drivers && rm -rfv gpu/drm/amd
cd $(find /usr/lib/modules -name '*.x86_64') && find * -name '*updates' -exec rm -rfv '{}' \;
cd $(find /usr/lib/modules/ -name '*x86_64') && cd kernel/drivers/net/ && find * -name '*amd*' -exec rm -rfv '{}'\;	
cd $(find /usr/lib/modules/ -name '*x86_64') && cd kernel/drivers/gpu/drm/ && find * -name '*amd*' -exec rm -rfv '{}'\;	

#removing /usr/share
rm -rfv /usr/share/doc/ #removing documentation
rm -rfv /usr/share/man/ #removing manuals
rm -rfv /usr/share/help/ #removing help :)
rm -rfv /usr/share/sounds/ #removing sounds 
rm -rfv /usr/share/backgrounds/ #removing backgrounds file
rm -rfv /usr/share/gnome/
rm -rfv /usr/share/icons/hicolor/
rm -rfv /usr/share/mime/audio/* 
rm -rfv /usr/share/licences #removing licences, test this too
rm -rfv /usr/share/applications
rm -rfv /usr/share/adobe/resources/mapping
rm -rfv /usr/share/licenses
rm -rfv /usr/share/appdata
rm -rfv /usr/share/cracklib	
rm -rfv /usr/share/misc
rm -rfv /usr/share/gcc-11
rm -rfv /usr/share/libthai
rm -rfv /usr/share/pkgconfig
rm -rfv /usr/share/systemtap	
rm -rfv /usr/share/omf
find /usr/share -name 'urw-base35' -exec rm -rfv '{}' \;
find /usr/share -name '*dejavu*' -exec rm -rfv '{}' \;

#removing /var
rm -rfv /var/local
rm -rfv /var/lock
rm -rfv /var/adm
rm -rfv /var/lock
rm -rfv /var/preserve
rm -rfv /var/spool
rm -rfv /var/yp
rm -rfv /var/lock

##ENDING PHASE
clear
echo "Ending phase"; sleep 2;
cd ~/ # just in case
rm -rfv ~/BPC-SOS
systemctl disable --now rsyslog
systemctl mask rsyslog
systemctl disable --now systemd-journald
clear; echo "script ended"; sleep 2;
echo `pwd`
exit 0