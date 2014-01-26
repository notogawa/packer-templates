#!/bin/bash

#pkg install -y virtualbox-ose-additions
pkg install -y yasm
pkg install -y dev86
pkg install -y flex
pkg install -y gettext
pkg install -y perl5
pkg install -y kBuild
pkg install -y python
cd /usr/ports/emulators/virtualbox-ose-additions
make install BATCH=yes < /dev/null

cat >> /etc/rc.conf <<EOF
vboxguest_enable="YES"
vboxservice_enable="YES"
vboxservice_flags="--disable-timesync"
EOF

rm /home/vagrant/VBoxGuestAdditions.iso
