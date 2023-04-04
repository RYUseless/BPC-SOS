##Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
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

systemctl disable rsyslog 

## XORG, XTERM, .XINITRC SETUP + SMALL TEST
dnf -y install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\n xterm -e \" echo 'xterm works'; sleep 5; exit \" " >> ~/.xinitrc
startx || exit 1
sed -i '3s/.*/xterm/' ~/.xinitrc

## BROWSER + PDF VIEWER
dnf -y install wget
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
yum -y install palemoon
dnf -y install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm

## .BASHRC EDIT
echo "#\n - - R Y U A  U T I S M - - " >> ~/.bashrc
echo "XTRM=`pgrep xterm`\nif [ -z "$XTRM" ]; then\n	startx\nelse\n	resize -s 55 165\n fi\n" >> ~/.bashrc
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
echo "\n # A L I A S  F O R  S O S thing" >> ~/.bashrc
echo "alias home = 'cd ~'" >> ~/.bashrc
echo "alias velikost = 'cd ~ && ./velikost.sh'" >> ~/.bashrc
echo "# E N D  O F  R Y U  A U T I S M" >> ~/.bashrc

touch ~/velikost.sh
chmod +x ~/velikost.sh
echo "du / -- exclude =/{ proc , sys , dev } - abc | sort -n" >> ~/velikost.sh


echo "vic v budoucnu"
