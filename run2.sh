#!/bin/bash

if [ ! -f /.root_pw_set ]; then
        sh /set_root_pw.sh
fi

rc-status
touch /run/openrc/softlevel
ssh-keygen -A

mkdir -p /root/.ssh/

/usr/sbin/sshd -D &
sleep 1

sshpass -p root ssh -o StrictHostKeyChecking=no -qTN2 -D 0.0.0.0:1099 localhost
