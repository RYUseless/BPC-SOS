#Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
systemctl disable rsyslog
dnf -y install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\n xterm -e \" echo 'xterm works'; sleep 5; exit \" " >> ~/.xinitrc
startx || exit 1
sed -i '3s/.*/xterm/' ~/.xinitrc
#konec nahazovani xorg serveru
wget https://copr.fedorainfracloud.org/coprs/bgstack15/palemoon/repo/epel-7/bg
stack15-palemoon-epel-7.repo -O /etc/yum.repos.d/bgstack15-palemoon.repo
--2019-03-01 21:39:26--  https://copr.fedorainfracloud.org/coprs/bgstack15/palem
oon/repo/epel-7/bgstack15-palemoon-epel-7.repo
dnf -y install palemoon
dnf -y install https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm
startx || palemoon
echo "vic v budoucnu"
