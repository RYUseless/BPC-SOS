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
dnf -y install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\n xterm -e \" echo 'xterm works'; sleep 5; exit \" " >> ~/.xinitrc
startx || exit 1
sed -i '3s/.*/xterm/' ~/.xinitrc

## BROWSER + PDF VIEWER
dnf -y install wget #after all the testing, merge this two installs together
dnf -y install tar
##PALEMOON install -----------------
#mkdir ~/browser; cd ~/browser
#wget https://rm-eu.palemoon.org/release/palemoon-32.1.0.linux-x86_64-gtk3.tar.xz
#find ~/browser -type f -name "*palemoon*.tar.xz" -exec tar -axf '{}' \;
#cd ~
# missing dependencies for gtk3 :), until i figure out all dependencies, this hell of a thing stays
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
yum -y install palemoon
## GV install ---------------------
#dnf -y install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm #CentOS-8
dnf -y install https://download-ib01.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/g/gv-3.7.4-29.el9.x86_64.rpm  #Centos-9


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
clear
echo "Now script will try to remove whole bunch of things" && sleep 2;
clear
# removing rescue initframs
find / -type f -name '*0-rescue*' -exec rm -rfv '{}' \;
#removing fimware from lib
rm -rfv /usr/lib/firmware 
usr share remove
rm -rfv /usr/share/doc
rm -rfv /usr/share/man
rm -rfv /usr/share/help
rm -rfv /usr/share/makedumpfile/*
rm -rfv /usr/share/sounds
rm -rfv /usr/share/zoneinfo
rm -rfv /usr/share/backgrounds
rm -rfv /usr/share/gnome
rm -rfv /usr/share/icons/hicolor
rm -rfv /usr/share/mime/audio/*
rm -rfv /usr/share/locale 
rm -rfv /usr/share/centos-release
#rm -rfv /usr/share/dict
#rm -rfv /usr/share/egl
#rm -rfv /usr/share/emacs
#rm -rfv /usr/share/empty
#rm -rfv /usr/share/file
#rm -rfv /usr/share/gettext-* #pokus
#rm -rfv /usr/share/gettext
#rm -rfv /usr/share/gawk
#rm -rfv /usr/share/groff
#rm -rfv /usr/share/glvnd
#rm -rfv /usr/share/fonts/urw-base35
#rm -rfv /usr/share/redhat-release
#rm -rfv /usr/share/mime-info
#rm -rfv /usr/share/microcode-ctl
#rm -rfv /usr/share/metainfo
#rm -rfv /usr/share/makedumpfile
#rm -rfv /usr/share/sssd
#rm -rfv /usr/share/sssd-kcm



##ENDING PHASE
clear
echo "Ending phase"; sleep 2;
dnf -y remove git
dnf -y remove wget
rm -rfv ~/BPC-SOS
cd ~

#uncomment later
systemctl disable --now rsyslog
#systemctl mask rsyslog
systemctl disable --now systemd-journald
#systemctl mask systemd-journald
exit 0 #end
