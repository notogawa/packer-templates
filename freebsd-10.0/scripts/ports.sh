#!/bin/bash

cat >> /etc/make.conf <<EOF
WITHOUT_X11="YES"
EOF

sed 's/\[ "${INTERACTIVE}" != "YES" \]/false/' /usr/sbin/portsnap > /tmp/portsnap
chmod +x /tmp/portsnap

/tmp/portsnap fetch extract
