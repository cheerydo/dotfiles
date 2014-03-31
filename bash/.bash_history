mutt
tudu
screenfetch 
screenfetch 
vim .spectrwm.conf 
ranger
screenfetch 
htop
ncmpcpp 
convert -resize 250x250 2014-03-30-080209_1440x900_scrot.png dirty.png
pacin imagemagick
convert -resize 250x250 2014-03-30-080209_1440x900_scrot.png dirty.png
htop
convert -resize 250x250 2014-03-30-080215_1440x900_scrot.png clean.png
htop 
feh dirty.png 
feh clean.png 
atc
atc
atc -g OHare
atc -g OHare
atc -g OHare
atc -g OHare
atc -g OHare
atc -g Killer
atc -g Killer
systemctl poweroff
htop
journalctl --since=today | grep mpdscribble
cat .xinitrc 
vim .config/fontconfig/fonts.conf 
vim .Xresources 
pacloc w3m
paclocs w3m
mutt
vim .mutt/macros 
vim .urlview
mutt
whereis ranger
sudo find /usr/share -name ranger*
man ranger
man ranger
cd /usr/share/doc/ranger/examples/
ls
cd ..
ls
cd config/
ls
cat scope.sh 
ls
cp rc.conf rifle.conf scope.sh ~/.config/ranger/
cd ~/.config/ranger/
ls
ls -al
vim rc.conf 
vim rifle.conf 
man chown
sudo chown -R /mnt/blackusb
sudo chown -R jared /mnt/blackusb
man chown
sudo chown jared:jared -R /mnt/blackusb/
lsblk
sudo mkdir /mnt/blackusb
sudo mount /dev/sdb1 /mnt/blackusb/
ranger
sudo ranger
sudo chown jared /mnt/blackusb/
ranger
sudo ranger
sudo ranger
ranger
ranger
sudo cp /mnt/blackusb/arch\ pictures/* /home/jared/pictures/
ls -a
ls -al pictures/
sudo chown jared:jared pictures/*
ls -al pictures/
ls -al music/*
sudo chown jared:jared music/*
ls -al music/
htop
sudo umount /dev/sdb1
sudo eject /dev/sdb1
cd music/
ls -al 
cd Tallest\ Man\ On\ Earth\,\ The\ -\ Shallow\ Grave\ \[2008\]\ \[FLAC\]/
ls
sudo find / -name *Tallest*
cd music/
ls
htop
man cp
cp -r /mnt/blackusb/arch\ music/* ~/music/
ls -al /mnt/blackusb/arch\ music/Boxer/
sudo chown -R jared:jared /mnt/blackusb/arch\ music/*
ls -al /mnt/blackusb/arch\ music/Boxer/
sudo cp -r /mnt/blackusb/arch\ music/* /home/jared/music/
ncmpcpp 
cd music/
cd Boxer/
ls
ls -al
sudo chown jared:jared ./*
ls -al
sudo chown -R jared:jared /home/jared/music/*
ls -al ../Shallow\ Grave/
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
ncmpcpp 
htop
cd pictures/
ls
feh ./
mv screens/ ~/
ls
ls -a
vim .bashr
vim ../.bashrc 
cd ..
source .bashrc 
ls pictures/
ls -a
irssi
irssi
htop
systemctl poweroff
sudo pacman -Sy
pacman -Qu
pacup
screenfetch 
ncmpcpp 
pacin
feh -z -bg-fill pictures/
feh -z -bg-fill pictures/*
man feh
feh -z --bg-fill pictures/
vim .xinitrc 
w3m google.com
sudo pacman -S --asdeps elinks
elinks 
alias
pacloc w3m
paclocs w3m
paclocs lynx
paclocii w3m
w3m
man 23m
man w3m
bin/dzen2/sysinfo_popup.sh 
uptime
date
notify-send 
man notify-send
notify-send help
notify-send "HI"
bin/dzen2/sysinfo_popup.sh 
bin/dzen2/sysinfo_popup.sh 
bin/dzen2/sysinfo_popup.sh 
vim .conkyrc 
cd bin/
mkdir dzen2
cd dzen2/
vim sysinfo_popup.sh
chmod +x sysinfo_popup.sh 
./sysinfo_popup.sh 
./sysinfo_popup.sh 
vim sysinfo_popup.sh 
pacreps inxi
pacin --asdeps inxi
pacorf
inxi
inxi
man inxi
inxi --recommends
pacrem inxi
man acpi
acpi -t
acpi -b
 #/bin/bash
 #A simple popup showing system information
 HOST=$(uname -n)
 KERNEL=$(uname -r)
 UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
          | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
            |  sed 's/,/m/' | sed 's/  / /')
 PACKAGES=$(pacman -Q | wc -l)
 UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0); \
          printf "%s %s",$1,$2;}' /var/log/pacman.log)
 (  echo "System Information" # Fist line goes to title  echo "Host: $HOST ";  echo "Kernel: $KERNEL";  echo "Uptime: $UPTIME ";  echo "Pacman: $PACKAGES packages";  echo "Last updated on: $UPDATED";  ) | dzen2 -p -x "500" -y "30" -w "220" -l "5" -sa 'l' -ta 'c'    -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'
acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g'
man elif
elif 
elif -h
man core
man corelist
dzen2
man ionice 
htop
alias pacrep
pacreps aspci
pacreps acpi
pacor
pacorf 
pacrem elinks
pacin acpi
man acpi
irssi
man if
atc -g OHare
atc -g OHare
atc -g OHare
atc -g OHare
atc -g OHare
atc -g Killer
atc -g game_2
atc -g game_2
man dzen2
man dzen
dzen -h
dzen2 -h
dzen2 --help
vim .conkyrc 
htop
systemctl poweroff
man trek
man wall 
man wall
man talk
talk jared
ls -al ../Shallow\ Grave/
pacman -Qm | column -t
man column
man net
cat /etc/fstab | column -t
cat /etc/fstab
pacreps stow
pacin stow
cd test/
htop
ls
mkdir -p 1/2/3
cd 1
ls
cd 2
ls
touch {2.1,2.2,2.3}
cd 3
touch {3.1,3.3}
cd ../../..
ls
ls -a
ls -al
cd 1
ls -al
cd 2
ls -al
ls
ls -a
cd ../..
ls
mkdir 1back
ls
cd 1back
man stow
stow ~/test/1 
man sow
man stow
stow vim
cd ..
ls
rm -rf ./*
ls
ls -a
mv ~/.bashrc 
mv ~/.bashrc ./
ls
ls -a
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
