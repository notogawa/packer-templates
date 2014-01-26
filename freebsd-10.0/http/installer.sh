PARTITIONS=ada0
DISTRIBUTIONS="base.txz kernel.txz lib32.txz src.txz"

#!/bin/sh
cat >> /etc/rc.conf <<EOF
ifconfig_em0="DHCP"
sshd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
EOF

pw usermod root -h 0 <<EOF
vagrant
EOF

cat >>/etc/resolv.conf <<EOF
nameserver 8.8.8.8
EOF

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg install -y bash sudo
sed -e 's/^# \(%wheel ALL=(ALL) ALL\)$/&/' -i .bak /usr/local/etc/sudoers
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /usr/local/etc/sudoers.d/vagrant

adduser -f <<EOF
vagrant::::::vagrant::bash:vagrant
EOF
pw usermod vagrant -G wheel
