# CentOS(9) script
This repo is a centOS script for BPC-SOS project (make Linux OS as smallest as possible with some sort of GUI, where u can show vut webpage and some pdf).
+ it aims to install xorg, browser, pdf reader and reduce the OS as much as i am capable of.
+ I am kinda expecting, that u have installed minimal centOS (with no gui etc)
+ If you dont know, how to install the minimal CentOS (its for centos8, but it should be the same). Here is tutorial: [click me](Install_Centos.md )
> It should work with centos8, if u uncomment the mirrors for centos8 <br>
## How to make it run?
+ If needed, install git: ``dnf install git``
+ On centos9, there are issues with sha1 signature, to fix this, execute these commands and reboot: 
```bash
update-crypto-policies --set LEGACY
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
```
+ Start script with:
```bash
sh <where_you_clonned_repo>/BPC-SOS/centOS.sh 
```
> example: ``sh ~/BPC-SOS/centOS.sh`` </br>
+ You can switch to testing branch with: ``git switch Testing``
(You need to be in BPC-SOS/ directory). </br>
+ With ``git branch`` you can view your current branch.  </br>
+ ``git branch -r`` Will show all branches.  </br>
## How to launch Browser and PDF reader
+ launch browser:
	* First step: start xorg and xterm with command ``startx``
	* Second step, when you succesfully launched cli, you just need to type ``palemoon`` and browser should launch.
+ Launch PDF reader:
	* Once again, you need to launch xorg and xterm with ``startx``
	* Then to start pdf reade, simply type: ``gv <name_of_pdf.pdf>``
	> PDF should be in ``cd ~/`` 

## What exactly does this script do?
> I will write down all things as i manage them to work like i want to :-)
- [x] Install xorg apps + xterm, make sure xorg works (simple thing, its not bulletproof) and setup .xinitrc(minimal basics).
- [x] Install webbrowser and some PDF reader 
- [ ] **[Failed]** add testing for working webbrowser and pdf reader
- [x] Set ut removing .cache and other useless stuff when system boots -> for now in .bashrc (until i find better way)
- [X] removing whole bunch of random packages until i dont have anything more to delete :-P
> kinda done, i know about some more spaces where i can delete some more, but there is no time :(
> and some more stuff
