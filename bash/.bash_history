stow bash
mkdir bash/
ls
mv .bashrc bash/
ls
stow bash
cd ~
ls
ls -a
ls -al .bashrc 
vim .ncmpcpp/
vim .ncmpcpp/config 
htop
screenfetch 
man shopt
man stow
cd test/bash/
ls
ls -a
cp .bashrc ~/.bashrc.bak
cd ~
ls
rm -r .bashrc
cd test/bash/
ls -a
cd ..
cd ..
ls -a
ls -al
ls -L
man ls
man ln
ls -l -type l
find ./ -type l
man find
find /home/jared -type l 
cd .config/
ls
cd ..
cd test/
ls
cd bash
ls
ls -a
mv .bashrc ~/
ls
cd ..
rmdir bash
ls -a
la
ll
vim .bashrc
cd ..
vim .bashrc
source .bashrc
la
ll
lal
ls
ls -a
la
ls
la
ll
rm *.png
ls
ll
find ~ -name .*
find /home/jared -name .*
find /home/jared -name ".*"
la
mkdir -p dotfiles/bash
cd dotfiles/
ls
cd bash
la ~
rm ~/.bashrc.bak 
mv .bash* ./
mv ".bash*" ./
find /home/jared -name .bash* | xargs mv ./
find /home/jared -name .bash*
cd ../../documents/
ls
ls -a
vim .bashrc 
rm ./.bashrc 
ls
ls -a
vim .Xresources 
rm .Xresources 
ls -a
la
vimdiff .vimrc ~/.vimrc 
vim .vimrc 
rm .vimrc 
la
ll
cd ~
ls
la
man mv
cp .bash* dotfiles/bash/
la dotfiles/bash
rm .bash*
ls
la
cd dotfiles/bash
ls
la
cd ..
stow bash
cd ~
ls
la
ll
lal
mdkir dotfiles/{spectrwm,vim,scripts}
mkdir dotfiles/{spectrwm,vim,scripts}
mkdir dotfiles/scripts/bin
mv bin/* dotfiles/scripts/bin/
la bin
cd dotfiles/
stow scripts
cd ..
ls
lal bin
baraction.sh 
colors
showconsolefont 
setfont Lat2-Terminus16
cd bin/
ls
vim localecheck
chmod +x localecheck 
localecheck 
sudo vim /etc/locale.gen 
locale-gen
sudo locale-gen
localecheck 
env
echo LANG=en_US.UTF-8 > /etc/locale.conf
sudo echo LANG=en_US.UTF-8 > /etc/locale.conf
su
env
export LANG=en_US.UTF-8
localecheck 
vim .bashrc 
locale
sudo locale-gen
locale
locale-gen
echo /etc/locale.conf
cat /etc/locale.conf
localectl 
irssi
killall conky
startx
locale
locale
xprop -root
xprop -root WM_NAMe
xprop -root WM_NAME
`sed -n 's/^.*\*font:\s* -\*-\([^-]*\)-.*/\1/p' ~/.Xresources`
`sed -n 's/^.*\*font:\s* -\*-\([^-]*\)-.*/\1/p' ~/.Xresources
`
`sed -n 's/^.*\URxvt*font:\s* -\*-\([^-]*\)-.*/\1/p' ~/.Xresources
`
`sed -n 's/^.*\URxvt*font:\s* -\*-\([^-]*\)-.*/\1/p' ~/.Xresources
`
man unicode_start
unicode_start 
man unicode
man utf-8
xmodmap
xev
cd bin
la
ll
cd ~/dotfiles/scripts/
ls
cd bin/
ls
la
ll
cd dzen2/
ls
cd ..
vim colors 
chmod +X colors 
cd ..
cd ..
stow scripts
cd ~/bin/
ls
lal
mv localecheck ~/dotfiles/scripts/bin/
cd dotfiles && stow scripts && cd ~
cd ~/dotfiles && stow scripts && cd ~
lal bin
colors
pacin xprop
pacreps xprop
pacin xorg-xprop
colors
vim bin/colors 
colors
vim bin/colors 
colors
vim .bash_profile 
locale
cat /etc/locale.conf 
localecheck 
man stow
cd dotfiles/
stow irssi
cd ~
lal
git config --global user.name "thetornainbow"
git config --global user.email "jaredvanderview@gmail.com"
ls
mv .vim* dotfiles/vim/
la
mv .spectrwm.conf dotfiles/spectrwm/
mkdir mutt
mv mutt/ dotfiles/
mv .mutt/ .urlview dotfiles/mutt/
mkdir dotfiles/conky
mv .conkyrc dotfiles/conky/
mkdir dotfiles/ncmpcpp
mkdir dotfiles/x
mv .Xresources .xinitrc .xsession dotfiles/x
mv .ncmpcpp/ dotfiles/ncmpcpp/
la
ll
la
mkdir dotfiles/mpd
mv .mpd/ .mpdconf dotfiles/mpd
ls
la
cd .config/
ls
colors
mkdir -p ~/dotfiles/ranger/.config
mv ranger/ ~/dotfiles/ranger/.config/
cd ~/dotfiles/
ls
stow conky mpd mutt ncmpcpp ranger scripts spectrwm/ vim/ x/
lal ~
mkdir irssi
lal ~/.config/
source .bashrc
source ~/.bashrc 
mv ~/.irssi/ ./irssi/
stow irssi
cd ~
cd dotfiles/
git init
git remote add origin https://thetornainbow@bitbucket.org/thetornainbow/dotfiles.git
echo "# This is my README" >> README.md
git add README.md 
git commit -m "First commit. Adding a README."
git push -u origin master
git help
git status
git add bash/ conky/ irssi/ mpd/ mutt/ ncmpcpp/ ranger/ scripts/ spectrwm/ vim/ x/
git status
git help
man git
man git commit
man git commit
man git push
git status
git commit -m "Added my first directories for tracking :). Very cool"
git push -u origin master
cd ~
lal
vim dotfiles/README.md 
git commit -m "Changed readme."
cd dotfiles/
git commit -m "Changed readme."
man git add
man git commit
git commit -a -m "Changed readme."
git status
git push -u origin master
git push -u origin master
pacreps reptyr
screenfetch 
irssi
ncmpcpp 
htop
colors
colors
cd bin/
ls
lal
cd test
la
vim dzentest
chmod +x dzentest 
dzentest
./dzentest 
vim dzentest 
./dzentest 
./dzentest 
./dzentest 
vim dzentest 
vim dzentest 
cd bin/dzen2/
./sysinfo_popup.sh 
getcurpos
vim bin/dzen2/sysinfo_popup.sh 
expr (14+2
expr 14+2

expr $(14+2) 
man expr
cd bin/dzen2/
vim sysinfo_popup.sh 
vim sysinfo_popup.sh 
vim sysinfo_popup.sh 
man expr
man xargs
man xprop
man xdotool
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
man xdotool
man cut
xdotool getmouselocation | cut -c1-5
xdotool getmouselocation | cut -c3-5
xdotool getmouselocation | cut -c10-15
xdotool getmouselocation | cut -c8-11
xdotool getmouselocation | cut -c9-11
xdotool getmouselocation | cut -c9-11
xdotool getmouselocation | cut -c9-11
xdotool getmouselocation | cut -c9-11
xdotool getmouselocation | cut -c7-10
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10 | xargs express $1 + 2
xdotool getmouselocation | cut -c9-10 | expr $1 + 2
xdotool getmouselocation | cut -c9-10 | expr + 2
xdotool getmouselocation | cut -c9-10 | xargs expr + 2
xdotool getmouselocation | cut -c9-10 < expr + 2
xdotool getmouselocation | cut -c9-10 | expr $1 + 2
xdotool getmouselocation | cut -c9-10 | expr $1+2
xdotool getmouselocation | cut -c9-10 | expr $1
xdotool getmouselocation | cut -c9-10 | echo
xdotool getmouselocation | cut -c9-10 | echo $1
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10 | expr $1 + 2 | echo $1
xdotool getmouselocation | cut -c9-10 | expr "$1 + 2" | echo $1
htop
cd test/
ls
mkdir clones
cd clones/
git clone https://thetornainbow@bigbucket.org/thetornainbow/dotfiles
git clone https://thetornainbow@biTbucket.org/thetornainbow/dotfiles
git clone https://thetornainbow@biTbucket.org/thetornainbow/dotfiles
git clone https://thetornainbow@biTbucket.org/thetornainbow/dotfiles
ls
cd dotfiles/
ls
la
cd ..
rm -rf dotfiles/
ls
la
cd ..
cd ..
la
sudo systemctl restart acpid.service 
sudo find /etc -name acpi*
sudo find /etc -name *acpi*
pacreps xscreensaver
man i3lock
pacin xscreensaver
pacin acpid
journalctl -f
acpi_listen
sudo systemctl enable acpid.service
sudo systemctl start acpid.service
acpi_listen 
sudo find /etc -name *acpi*
cd /etc/acpi/events/
ls
cd ..
la
sudo vim handler.sh 
sudo vim handler.sh 
cd pictures/
ls
feh ./
pwd
lal
i3lock -i /home/jared/pictures/gray-1440x900.png
sudo vim /etc/acpi/handler.sh 
sudo systemctl restart acpid.service 
whereis i3lock
sudo vim /etc/acpi/handler.sh 
sudo systemctl restart acpid.service 
htop
sudo vim /etc/acpi/handler.sh 
sudo vim /etc/acpi/handler.sh 
sudo systemctl restart acpid.service 
locale
export LANG="en_US.UTF_8"
locale
envg
env
startx
grep EE /var/log/Xorg.0.log
localecheck 
setfont Lat2-Terminus16
localecheck
sudo vim /etc/locale.gen 
localecheck 
sudo locale-gen
localecheck 
export LANG=en_US.UTF-8
localechek
localecheck 
env
sudo vim /etc/locale.conf 
su
locale
su
startx
startx
journalctl --since=today | grep pam
sudo systemctl stop acpid.service 
sudo systemctl disable acpid.service 
reboot
ls -a
localecheck
colors
man cuy
man cut
man sed
man let
xdotool getmouselocation | cut -c9-10
xdotool getmouselocation | cut -c9-10 | let i=$1+2 && echo i
xdotool getmouselocation | cut -c9-10 | let i=$1+2 && echo $i
cd test
lal
vim new1
chmod +x new1
./new1 
./new1 
vim new1 
./new1 
./new1 
./new1 
./new1 
./new1 
./new1 
./new1 
./new1 
vim new1 
./new1 
./new1 
./new1 
./new1 
./new1 
./new1 
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
xdotool getmouselocation
./new1 
./new1 
./new1 
./new1 
./new1 
./new1 
vim new1 
vim .xinitrc 
vim .bash_profile 
ping -c 3 google.com
pacreps network-manager
pacreps Networkmanager
pacin networkmanager
n
ssh tornainbow@hermes.feralhosting.com
irssi
ping -c 3 google.com
systemctl suspend 
