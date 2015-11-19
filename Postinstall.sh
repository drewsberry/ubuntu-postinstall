# Ensure we're root
if [[ $UID != 0 ]]; then
    echo "Please run as root."
    exit 1
fi

# Update, ready for postinstallation routines
apt-get update
apt-get dist-upgrade

# Absolute essentials
apt-get install curl

# Install notify-osd for notification customisation
add-apt-repository ppa:leolik/leolik
apt-get update
apt-get install libnotify-bin
pkill notify-osd

# Install GUI notify-osd configuration tool
add-apt-repository ppa:nilarimogard/webupd8
apt-get update
apt-get install notifyosdconfig

# Install patched Ubuntu Mono Powerline fonts
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git \
    /usr/share/fonts/ubuntu-mono-powerline-ttf
fc-cache -vf

# Install the beautiful Numix circle icon theme
add-apt-repository ppa:numix/ppa
apt-get update
apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Install Unity Tweak Tool
apt-get install unity-tweak-tool

# Install LaTeX
apt-get install texlive-latex-base
apt-get install texlive-science texlive-latex-extra
apt-get install latex-beamer latexmk

# Python pip
apt-get install python-pip

# Python development
apt-get install python-dev

# Essential Python packages
pip install pygments
pip install numpy
pip install matplotlib
pip install flake8

apt-get install libpng-dev libfreetype6-dev # Dependencies
pip install matplotlib

apt-get install libblas3gf libblas-dev # BLlas dependency
apt-get install liblapack3gf liblapack-dev # Lapack dependency
apt-get install gfortran # Some SciPy code i fortran...
pip install scipy

# Conky
apt-get install conky-all

# Ruby headers for gem
apt-get install ruby-dev

# Bundler, for installation from Gemfile
apt-get install bundler

# Ruby gems
gem install git-up
gem install jekyll

# Nautilus extensions
apt-get install nautilus-open-terminal

# Remove orca, because I keep on accidentally activating it
apt-get remove gnome-orca

# Install all necessary ncurses development files
apt-get install libncurses5-dev libncursesw5-dev

# Install markdown terminal previewer
mkdir Dev
git clone https://github.com/visit1985/mdp.git Dev/mdp
cd Dev/mdp
make
make install
cd

# Install  nodejs and link it to standard location
apt-get install nodejs
ln -s /usr/bin/nodejs /usr/bin/node

# Install java runtime and development kit
apt-get install default-jre default-jdk

# Install Netflix client
add-apt-repository ppa:ehoover/compholio
apt-get update
apt-get install msttcorefonts netflix-desktop

# Essentials graphics programs
apt-get install gimp
apt-get install inkscape
apt-get install msttcorefonts # Select "Agree" when prompted with EULA

# Mount Google Drive locally
add-apt-repository ppa:alessandro-strada/ppa
apt-get update
apt-get install google-drive-ocamlfuse

## Indicators

# Hackertray
apt-get install python-appindicator
pip install hackertray
hackertray &

# Caffeine
(add-apt-repository ppa:caffeine-developers/ppa &&
 apt-get update &&
 apt-get install caffeine) || 
(apt-get update &&
 apt-get install libappindicator3-1 &&
 apt-get install gir1.2-appindicator3-0.1 &&
 echo "Cannot use ppa for caffeine install. Please install correct version from:" &&
 echo "http://ppa.launchpad.net/caffeine-developers/ppa/ubuntu/pool/main/c/caffeine/")

# Calendar Indicator
add-apt-repository ppa:atareao/atareao
apt-get update
apt-get install calendar-indicator

# Flux indicator
add-apt-repository ppa:kilian/f.lux
apt-get update
apt-get install fluxgui

# Weather indicator
add-apt-repository ppa:noobslab/indicators
apt-get update
apt-get install indicator-weather

# Netspeed indicator
add-apt-repository ppa:nilarimogard/webupd8
apt-get update
apt-get install indicator-netspeed

# eCryptfs
apt-get install ecryptfs-utils
# Now run ecryptfs-setup-private

## Android

# Mounting Android filesystem
apt-get install mtp-tools mtpfs

# Add udev rule for Nexus 4
echo "# LG - Nexus 4
SUBSYSTEM==\"usb\", ATTR{idVendor}==\"18d1\", ATTR{idProduct}==\"4ee2\", MODE=\"0666\"" \
    > /etc/udev/rules.d/51-android.rules
chmod +x /etc/udev/rules.d/51-android.rules
service udev restart

## Media

# Mplayer
apt-get install mplayer
apt-get install gnome-mplayer

## Miscellaneous

# Colordiff
apt-get install colordiff

# Dropbox
cd
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
cd -

# Sigil ePub editor
add-apt-repository ppa:sunab/sigil-git
apt-get update
apt-get install sigil
