#Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
systemctl disable rsyslog
dnf -y install xorg-x11-server-Xorg xinit xterm
touch ~/.xinitrc
echo -e "#xinit scriptik\nxrandr -s 1024x768_60.00 &\nxterm -e \" echo 'xterm works'; sleep1; exit\" " >> ~/.xinitrc
startx || exit 1
sed -i '3s/.*/xterm/' ~/.xinitrc.txt
#konec nahazovani xorg serveru
echo "vic v budoucnu"
