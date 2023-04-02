#Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
echo "--- BPC-SOS SCRIPT ---"
text="Loading whole universe for this hell script to work: "
echo -ne $text'[#####                   ] (33%)\r' ;sleep 1.5
echo -ne $text'[#############           ] (66%)\r' ;sleep 1.5
echo -ne $text'[########################] (-500000%)\r'
echo -ne '\n'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "${RED}Crytical error, even universe couldnt make this work :(${NC}"
sleep 2.2; clear
# this is just me fooling around :)

systemctl disable rsyslog

# xorg and .xinitrc setup
dnf -y install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\n xterm -e \" echo 'xterm works'; sleep 5; exit \" " >> ~/.xinitrc
startx || exit 1
sed -i '3s/.*/xterm/' ~/.xinitrc

# browser + pdf reader
dnf -y install wget
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
yum -y install palemoon
dnf -y install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm

echo "vic v budoucnu"
