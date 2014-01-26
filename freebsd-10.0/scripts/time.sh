#!/bin/bash

ntpdate ntp.nict.jp
cat >> /etc/rc.conf <<EOF
ntpdate_enable="YES"
ntpd_enable="YES"
EOF

ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
