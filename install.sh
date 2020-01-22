#!/bin/bash
#-----------------------------------------------------------------------------
##installation of rtklib for android userland debian (test with ublox zed-F9P)
##ssh rover@192.168.43.1 -p2022   > smartphone
##ssh rover@172.24.1.62 -p2022    > raspberry
#-----------------------------------------------------------------------------
##install tools
sudo apt-get update
sudo apt-get install -y gcc git build-essential automake \
                        wget zip unzip nano psmisc procps
##install rtklib
git clone -b demo5 https://github.com/rtklibexplorer/RTKLIB.git
cd ./RTKLIB/app 
make all 
make install
cp ./str2str/gcc/str2str /bin 
make clean
cd

##add start.sh to ./
wget --no-check-certificate -P ./ https://raw.githubusercontent.com/jancelin/RTKlibDroid/master/start.sh
chmod +x start.sh
##lien symbolique pour l'execution au lancement de la session (pas possible au demarrage avec userland)
ln -i start.sh /etc/profile.d/start.sh

#rtcrvc conf
wget --no-check-certificate -P /storage/internal/gnss https://raw.githubusercontent.com/jancelin/RTKlibDroid/master/rtkrcv.txt

