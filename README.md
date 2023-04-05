# CentOS(8) script
This repo is a centOS script for BPC-SOS project (make Linux OS as smallest as possible with some sort of GUI, where u can show vut webpage and some pdf).
+ it aims to install xorg, browser, pdf reader and reduce the OS as much as i am capable of.
+ I am kinda expecting, that u have installed minimal centOS (with no gui etc)
+ If you dont know, how to install the minimal CentOS, here is tutorial: [click me](Install_Centos.md )
> for now, it is at centOS8, it could work on 9 if u find better mirrors for apps, or the old one still works... <br>
## How to make it run?
+ If needed, install git: ``dnf install git``
```bash
sh ~/BPC-SOS/centOS.sh 
```
## What exactly does this script do?
> I will write down all things as i manage them to work like i want to :-)
- [x] Install xorg apps + xterm, make sure xorg works (simple thing, its not bulletproof) and setup .xinitrc(minimal basics).
- [x] Install webbrowser and some PDF reader
- [ ] add testing for working webbrowser and pdf reader
- [x] Set ut removing .cache and other useless stuff when system boots -> for now in .bashrc (until i find better way)
- [ ] removing whole bunch of random packages until i dont have anything more to delete :-P
> and some more stuff
