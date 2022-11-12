USERHOME=$HOME

sudo apt update -y
apt upgrade -y

cp -r ./home/.cinnamon $USERHOME
cp -r ./home/.config/* $USERHOME/.config/
fontdir="$USERHOME/.local/share/fonts/"
mkdir -p $fontdir && cp -r ./home/.local/share/fonts/* $fontdir
cp -r ./home/.themes/* $USERHOME/.themes/
cp -r ./home/myPrograms $USERHOME
sudo cp ./cinnamon.css /usr/share/themes/Mint-Y-Dark/cinnamon/cinnamon.css

sudo cp ./services/kmonad.service /etc/systemd/system/kmonad.service
systemctl enable kmonad.service

dconf load / < my-cinnamon.dconf

apt install build-essential software-properties-common
flatpak install flatseal telegram discord zoom