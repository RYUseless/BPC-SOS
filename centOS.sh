##Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
#TODO: ADD % CHANCE TO DELETE WHOLE os
clear
echo "--- BPC-SOS SCRIPT ---"
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
sed -i '3s/.*/xterm/' ~/.xinitrc

## BROWSER + PDF VIEWER
dnf --setopt=install_weak_deps=False install wget
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
yum  --setopt=install_weak_deps=False install palemoon
#echo "palemoon" > /etc/dnf/protected.d/palemoon.conf #making palemoon protected
# G V INSTALL
#dnf -y --setopt=install_weak_deps=False install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm #CentOS-8
dnf -y --setopt=install_weak_deps=False install https://download-ib01.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/g/gv-3.7.4-29.el9.x86_64.rpm  #Centos-9
dnf -y remove git wget

## .BASHRC EDIT
echo -e "\n# - - R Y U A  U T I S M - - " >> ~/.bashrc
echo -e "cd ~" >> ~/.bashrc # for some reason script stays in /BPC-SOS, and i dont know why
echo -e "XTRM=\`pgrep xterm\`\nif [ -z \"\$XTRM\" ]; then\n	startx\nelse\n	resize -s 55 165\n fi\n" >> ~/.bashrc
echo "rm  ~/.thumbnails/*" >> ~/.bashrc
echo "rm  ~/.bash_history/*" >> ~/.bashrc
echo "rm -rfv /root/cache/*" >> ~/.bashrc
echo "rm -rfv /var/tmp/*" >> ~/.bashrc
echo "rm -rfv /usr/tmp/*" >> ~/.bashrc
echo "rm -rfv /tmp/*" >> ~/.bashrc
echo "rm -rfv /var/cache/*" >> ~/.bashrc
echo "rm -rfv /var/log/*" >> ~/.bashrc
echo "rm -rfv ~/.cache/*" >> ~/.bashrc
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
find / -type f -name '*0-rescue*' -exec rm -rfv '{}' \; #finding and removing initframs rescue
rm -rfv /usr/lib/firmware #removing firmware
find / -name "*games*" -exec rm -rfv '{}' \;
find / -name "*mail*" -exec rm -rfv '{}' \;
find / -name  "opt" -exec rm -rfv '{}' \;
find / -type f -name "locale" -exec rm -rfv '{}' \; 
# /usr/share
rm -rfv /usr/share/doc #removing documentation
rm -rfv /usr/share/man #removing manuals
rm -rfv /usr/share/help #removing help :(
#rm -rfv /usr/share/makedumpfile/*
rm -rfv /usr/share/sounds #removing sounds 
rm -rfv /usr/share/zoneinfo #removing zone specification
rm -rfv /usr/share/backgrounds #removing backgrounds file
rm -rfv /usr/share/gnome
rm -rfv /usr/share/icons/hicolor
#rm -rfv /usr/share/mime/audio/*
 	
## testing something new, so i dont need to rm everything for now :)


##ENDING PHASE
clear
echo "Ending phase"; sleep 2;
rm -rfv ~/BPC-SOS
cd ~
systemctl disable --now rsyslog
systemctl mask rsyslog
systemctl disable --now systemd-journald
systemctl mask systemd-journald
# i will add exit later, now i dont like it
