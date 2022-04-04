#!/bin/bash
#Script de atualização de todos os scripts de monitoramento com base no repositorio do git

rm -rf /scripts
rm -f /sbin/service_restart_*
git clone https://github.com/argon-infra/scripts.git /scripts/
chmod -R 770 /scripts  
chown -R root:zabbix /scripts
mv /scripts/service_restart_* /sbin/
rm -f /scripts/LICENSE
rm -f /scripts/README.md
