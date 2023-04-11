##Scriptoslav na stahnuti xorgu, prohlizece a pdf readeru + zmenseni velikosti os
#TODO: ADD % CHANCE TO DELETE WHOLE os
cp OS_practicals_classic.pdf ~/
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
#removing programs and ulities
systemctl disable --now systemd-journald
systemctl disable --nowfirewalld
systemctl disable --now sshd
systemctl disable --now rsyslog
systemctl mask rsyslog
dnf -y remove git wget openssh firewalld vim-minimal vi slang python#-systemd sg3_* rpm-plugin-selinux.x86_64 rpm-plugin-audit.x86_64 rpm-plugin-systemd-inhibit.x86_64 rsyslog.x86_64 
#the "--setopt=clean_requirements_on_remove=True" is useless kinda, as it is in dnf config
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
find / -name '*README*' -exec rm -rfv '{}' \; #testing
#metadata
#gdb
#ipv6
#history

#removing /usr
#find /usr -name 'sound*' -exec rm -rfv '{}' \;
find / -name 'sound*' -exec rm -rfv '{}' \; # testing
find /usr -name 'info' -exec rm -rfv '{}' \; #testing
find /usr/ -name 'firmware' -exec rm -rfv '{}' \; #testing, merge with firmware if works

#removing /lib and /lib64
#handpicking /usr/lib64
rm -rfv /usr/lib64/cracklib_dict.pwi
rm -rfv /usr/lib64/gio
rm -rfv /usr/lib64/girepository-1.0
rm -rfv /usr/lib64/libbrotlienc.so.1.0.9
rm -rfv /usr/lib64/libdw-0.188.so
rm -rfv /usr/lib64/libfdisk.so.1.1.0
rm -rfv /usr/lib64/libldb.so.2.6.1
rm -rfv /usr/lib64/libnss_resolve.so.2
rm -rfv /usr/lib64/libsolv.so.1
rm -rfv /usr/lib64/per15/
rm -rfv /usr/lib64/cracklib_dict.pwd
rm -rfv /usr/lib64/cracklib_dict.hwm
rm -rfv /usr/lib64/libldb.so.2
rm -rfv /usr/lib64/libdw.so.1
rm -rfv /usr/lib64/libbrotlienc.so.1
rm -rfv /usr/lib64/libfdisk.so.1
rm -rfv /usr/lib64/libEGL_mesa.so.0.0.0
rm -rfv /usr/lib64/libEGL_mesa.so.0
rm -rfv /usr/lib64/libEGL.so.1.1.0
rm -rfv /usr/lib64/libEGL.so.1
rm -rfv /usr/lib64/libGL.so.1.7.0
rm -rfv /usr/lib64/libGL.so.1
rm -rfv /usr/lib64/libGLX_system.so.0
rm -rfv /usr/lib64/libGLX_mesa.so.0.0.0
rm -rfv /usr/lib64/libGLX_mesa.so.0
rm -rfv /usr/lib64/libGLX.so.0.0.0
rm -rfv /usr/lib64/libGLX.so.0
rm -rfv /usr/lib64/libGLdispatch.so.0.0.0
rm -rfv /usr/lib64/libGLdispatch.so.0
rm -rfv /usr/lib64/libBrokenLocale.so.1
rm -rfv /usr/lib64/libaio.so.1.0.0
rm -rfv /usr/lib64/libaio.so.1.0.1
rm -rfv /usr/lib64/libaio.so.1
rm -rfv /usr/lib64/libanl.so.1
rm -rfv /usr/lib64/libarchive.so.13.5.3
rm -rfv /usr/lib64/libarchive.so.13
rm -rfv /usr/lib64/libasm.so.1
rm -rfv /usr/lib64/libasm-0.188.so
rm -rfv /usr/lib64/libasprintf.so.0.0.0
rm -rfv /usr/lib64/libasprintf.so.0
rm -rfv /usr/lib64/libassuan.so.0.8.5
rm -rfv /usr/lib64/libassuan.so.0
rm -rfv /usr/lib64/libatopology.so.2.0.0
rm -rfv /usr/lib64/libatopology.so.2
rm -rfv /usr/lib64/libauparse.so.0.0.0
rm -rfv /usr/lib64/libauparse.so.0
rm -rfv /usr/lib64/libauthselect.so.3.1.1
rm -rfv /usr/lib64/libauthselect.so.3
rm -rfv /usr/lib64/libbasicobjects.so.0.1.0
rm -rfv /usr/lib64/libbasicobjects.so.0
rm -rfv /usr/lib64/libbpf.so.1.0.0
rm -rfv /usr/lib64/libbpf.so.1
rm -rfv /usr/lib64/libcairo-script-interpreter.so.2.11704.0
rm -rfv /usr/lib64/libcairo-script-interpreter.so.2
rm -rfv /usr/lib64/libcares.so.2.4.2
rm -rfv /usr/lib64/libcares.so.2
rm -rfv /usr/lib64/libcbor.so.0.7.0
rm -rfv /usr/lib64/libcbor.so.0.7
rm -rfv /usr/lib64/libcollection.so.4
rm -rfv /usr/lib64/libcollection.so.4.1.1
rm -rfv /usr/lib64/libcrack.so.2.9.0
rm -rfv /usr/lib64/libcrack.so.2
rm -rfv /usr/lib64/libcrypt.so.1.1.0
rm -rfv /usr/lib64/libcrypt.so.1
rm -rfv /usr/lib64/libdaemon.so.0
rm -rfv /usr/lib64/libdaemon.so.0.5.0
rm -rfv /usr/lib64/libdb-5.3.so
rm -rfv /usr/lib64/libdb-5.so
rm -rfv /usr/lib64/libdevmapper-event.so.1.02
rm -rfv /usr/lib64/libdevmapper-event-lvm2mirror.so
rm -rfv /usr/lib64/libdevmapper-event-lvm2thin.so
rm -rfv /usr/lib64/libdevmapper-event-lvm2vdo.so
rm -rfv /usr/lib64/libdevmapper-event-lvm2snapshot.so
rm -rfv /usr/lib64/libdevmapper-event-lvm2raid.so
rm -rfv /usr/lib64/libdevmapper-event-lvm2.so.2.03
rm -rfv /usr/lib64/libdhash.so.1.1.0
rm -rfv /usr/lib64/libdhash.so.1
rm -rfv /usr/lib64/libdevmapper.so.1.02
rm -rfv /usr/lib64/libdnf.so.2
rm -rfv /usr/lib64/libdnf
rm -rfv /usr/lib64/libdrop_ambient.so.0.0.0
rm -rfv /usr/lib64/libe2p.so.2.3
rm -rfv /usr/lib64/libe2p.so.2
rm -rfv /usr/lib64/libedit.so.0
rm -rfv /usr/lib64/libedit.so.0.0.64
rm -rfv /usr/lib64/libefa.so.1.2.44.0
rm -rfv /usr/lib64/libefa.so.1
rm -rfv /usr/lib64/libelf.so.1
rm -rfv /usr/lib64/libelf-0.188.so
rm -rfv /usr/lib64/libepoxy.so.0.0.0
rm -rfv /usr/lib64/libepoxy.so.0
rm -rfv /usr/lib64/libestr.so.0.0.0
rm -rfv /usr/lib64/libestr.so.0
rm -rfv /usr/lib64/libext2fs.so.2.4
rm -rfv /usr/lib64/libext2fs.so.2
rm -rfv /usr/lib64/libfastjson.so.4.3.0
rm -rfv /usr/lib64/libfastjson.so.4
rm -rfv /usr/lib64/libfido2.so.1.6.0
rm -rfv /usr/lib64/libfido2.so.1
rm -rfv /usr/lib64/libform.so.6.2
rm -rfv /usr/lib64/libform.so.6
rm -rfv /usr/lib64/libformw.so.6.2
rm -rfv /usr/lib64/libformw.so.6
rm -rfv /usr/lib64/libfuse.so.2.9.9
rm -rfv /usr/lib64/libfuse.so.2
rm -rfv /usr/lib64/libgailutil.so.18.0.1
rm -rfv /usr/lib64/libgailutil.so.18
rm -rfv /usr/lib64/libgettextsrc-0.21.so
rm -rfv /usr/lib64/libgettextpo.so.0.5.7
rm -rfv /usr/lib64/libgettextpo.so.0
rm -rfv /usr/lib64/libgettextlib-0.21.so
rm -rfv /usr/lib64/libglapi.so.0.0.0
rm -rfv /usr/lib64/libglapi.so.0
rm -rfv /usr/lib64/libhandle.so.1.0.3
rm -rfv /usr/lib64/libhandle.so.1
rm -rfv /usr/lib64/libhistory.so.8.1
rm -rfv /usr/lib64/libhistory.so.8
rm -rfv /usr/lib64/libibverbs
rm -rfv /usr/lib64/libibverbs.so.1.14.44.0
rm -rfv /usr/lib64/libibverbs.so.1
rm -rfv /usr/lib64/libimaevm.so.3.0.0
rm -rfv /usr/lib64/libimaevm.so.3libini_config.so.5.2.1
rm -rfv /usr/lib64/libini_config.so.5
rm -rfv /usr/lib64/libinih.so.49
rm -rfv /usr/lib64/libinih.so.0
rm -rfv /usr/lib64/libjannson.so.4.14.0
rm -rfv /usr/lib64/libjannson.so.4
rm -rfv /usr/lib64/libjson-c.so.5.0.0
rm -rfv /usr/lib64/libjson-c.so.5
rm -rfv /usr/lib64/libkdb5.so.10.0
rm -rfv /usr/lib64/libkdb5.so.10
rm -rfv /usr/lib64/libkrad.so.0.0
rm -rfv /usr/lib64/libkrad.so.0
rm -rfv /usr/lib64/libksba.so.8.13.1
rm -rfv /usr/lib64/libksba.so.8
rm -rfv /usr/lib64/liblua-5.4.so
rm -rfv /usr/lib64/liblua-5.3.so
rm -rfv /usr/lib64/liblmb.so.0.0.0
rm -rfv /usr/lib64/liblvm2cmd.so.2.03
rm -rfv /usr/lib64/liblzo2.so
rm -rfv /usr/lib64/libmagic.so.1.0.0
rm -rfv /usr/lib64/libmagic.so.1
rm -rfv /usr/lib64/libmemusage.so
rm -rfv /usr/lib64/libmenu.so.6.2
rm -rfv /usr/lib64/libmenu.so.6
rm -rfv /usr/lib64/libmenuw.so.6.2
rm -rfv /usr/lib64/libmenuw.so.6
rm -rfv /usr/lib64/libmlx5.so.1.24.44.0
rm -rfv /usr/lib64/libmlx5.so.1
rm -rfv /usr/lib64/libmlx4.so.1.0.44.0
rm -rfv /usr/lib64/libmlx4.so.1
rm -rfv /usr/lib64/libmnl.so.0.2.0
rm -rfv /usr/lib64/libmnl.so.0
rm -rfv /usr/lib64/libmodulemd.so.2
rm -rfv /usr/lib64/libmodulemd.so.2.13.0
rm -rfv /usr/lib64/libmpfr.so.6.1.0
rm -rfv /usr/lib64/libmpfr.so.6
rm -rfv /usr/lib64/libmvec.so.1
rm -rfv /usr/lib64/libncurses.so.6.2
rm -rfv /usr/lib64/libncurses.so.6
rm -rfv /usr/lib64/libncursesw.so.6.2
rm -rfv /usr/lib64/libncursesw.so.6
rm -rfv /usr/lib64/libnetfilter_conntrack.so.3.8.0
rm -rfv /usr/lib64/libnetfilter_conntrack.so.3
rm -rfv /usr/lib64/libnewt.so.0.52.21
rm -rfv /usr/lib64/libnewt.so.0.52
rm -rfv /usr/lib64/libnfnetlink.so.0.2.0
rm -rfv /usr/lib64/libnfnetlink.so.0
rm -rfv /usr/lib64/libnftables.so.1.1.0
rm -rfv /usr/lib64/libnftables.so.1
rm -rfv /usr/lib64/libnftnl.so.11.6.0
rm -rfv /usr/lib64/libnftnl.so.11
rm -rfv /usr/lib64/libnl-3.so.200.26.0
rm -rfv /usr/lib64/libnl-3.so.200
rm -rfv /usr/lib64/libnl
rm -rfv /usr/lib64/libnl-cli-3.so.200.26.0
rm -rfv /usr/lib64/libnl-gen-3.so.200.26.0
rm -rfv /usr/lib64/libnl-gen-3.so.200
rm -rfv /usr/lib64/libnl-xfrm-3.so.200.26.0
rm -rfv /usr/lib64/libnl-xfrm-3.so.200
rm -rfv /usr/lib64/libnl-route-3.so.200.26.0
rm -rfv /usr/lib64/libnl-route-3.so.200
rm -rfv /usr/lib64/libnl-nf-3.so.200.26.0
rm -rfv /usr/lib64/libnl-nf-3.so.200
rm -rfv /usr/lib64/libnl-idiag-3.so.200.26.0
rm -rfv /usr/lib64/libnl-idiag-3.so.200
rm -rfv /usr/lib64/libnpth.so.0.1.2
rm -rfv /usr/lib64/libnpth.so.0
rm -rfv /usr/lib64/libnm.so.0.1.0
rm -rfv /usr/lib64/libnm.so.0
rm -rfv /usr/lib64/libnssckbi.so
rm -rfv /usr/lib64/libnss_systemd.so.2
rm -rfv /usr/lib64/libnss_sss.so.2
rm -rfv /usr/lib64/libnss_myhostname.so.2
rm -rfv /usr/lib64/libnss_files.so.2
rm -rfv /usr/lib64/libnss_dns.so.2
rm -rfv /usr/lib64/libnss_compat.so.2
rm -rfv /usr/lib64/libnuma.so.1.0.0
rm -rfv /usr/lib64/libnuma.so.1
rm -rfv /usr/lib64/libpanelw.so.6.2
rm -rfv /usr/lib64/libpanelw.so.6
rm -rfv /usr/lib64/libpanel.so.6.2
rm -rfv /usr/lib64/libpanel.so.6
rm -rfv /usr/lib64/libparted.so.2.0.4
rm -rfv /usr/lib64/libparted.so.2
rm -rfv /usr/lib64/libpcprofile.so
rm -rfv /usr/lib64/libpcap.so.1.10.0
rm -rfv /usr/lib64/libpipeline.so.1.5.3
rm -rfv /usr/lib64/libpipeline.so.1
rm -rfv /usr/lib64/libper1.so.5.32.1
rm -rfv /usr/lib64/libper1.so.5.32
rm -rfv /usr/lib64/libpopt.so.0.0.1
rm -rfv /usr/lib64/libpcreposix.so.0
rm -rfv /usr/lib64/libpython3.9.so.1.0
rm -rfv /usr/lib64/libpython3.so
rm -rfv /usr/lib64/libpcreposix.so.0
rm -rfv /usr/lib64/librepo.so.0
rm -rfv /usr/lib64/libref_array.so.1.2.1
rm -rfv /usr/lib64/libref_array.so.1
rm -rfv /usr/lib64/libreadline.so.8.1
rm -rfv /usr/lib64/libreadline.so.8
rm -rfv /usr/lib64/librpmsign.so.9.1.3
rm -rfv /usr/lib64/librpmsign.so.9
rm -rfv /usr/lib64/librpmio.so.9.1.3
rm -rfv /usr/lib64/librpmio.so.9
rm -rfv /usr/lib64/librpmbuild.so.9.1.3
rm -rfv /usr/lib64/librpmbuild.so.9
rm -rfv /usr/lib64/librpm.so.9.1.3
rm -rfv /usr/lib64/librpm.so.9
rm -rfv /usr/lib64/libsgutils2-1.47.so.2.0.0
rm -rfv /usr/lib64/libsgutils2-1.47.so.2
rm -rfv /usr/lib64/libsepol.so.2
rm -rfv /usr/lib64/libslapi.so.2.0.200
rm -rfv /usr/lib64/libslapi.so.2
rm -rfv /usr/lib64/libsepol.so.2
rm -rfv /usr/lib64/libsnappy.so.1.1.8
rm -rfv /usr/lib64/libsnappy.so.1
rm -rfv /usr/lib64/libsmartcols.so.1.1.0
rm -rfv /usr/lib64/libsmartcols.so.1
rm -rfv /usr/lib64/libsqlite3.so.0.8.6
rm -rfv /usr/lib64/libsqlite3.so.0
rm -rfv /usr/lib64/libsolvext.so.1
rm -rfv /usr/lib64/libsss_nss_idmap.so.0.6.0
rm -rfv /usr/lib64/libsss_nss_idmap.so.0
rm -rfv /usr/lib64/libsss_idmap.so.0.5.1
rm -rfv /usr/lib64/libsss_idmap.so.0
rm -rfv /usr/lib64/libsss_certmap.so.0.2.0
rm -rfv /usr/lib64/libsss_certmap.so.0
find /usr/lib64/* -name 'gconv*' -exec rm -rfv '{}' \;
find /usr/lib64/* -name 'rsyslog*' -exec rm -rfv '{}' \;
# lib
rm -rfv /usr/lib/udev/hwdb.d/
rm -rfv /usr/lib/.build-id
rm -rfv /usr/lib/firmware/ #removing firmware
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
clear; echo "script ended"; sleep 2;
echo `pwd`
exit 0