#!/bin/bash
apt update
apt install -y realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit
realm discover au-team.irpo
realm join --user=administrator au-team.irpo
if [ $? -eq 0 ]; then
    echo "SUCCESS: Компьютер присоединен к домену au-team.irpo"
else
    echo "ERROR: Не удалось присоединить к домену"
fi
