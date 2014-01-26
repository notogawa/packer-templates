#!/bin/bash

mkdir /home/vagrant/.ssh
chmod 700 .ssh
fetch --no-verify-peer -o /home/vagrant/.ssh/authorized_keys http://bit.ly/mqvENf
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
