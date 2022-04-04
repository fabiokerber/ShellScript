#!/bin/bash
restart_dominio="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $restart_dominio = ro:Primary/Unknown ] || [ $restart_dominio = ro:Primary/Secondary ] ; 
then
	sudo sh /sbin/service_restart_dominio.sh &>/dev/null &
	echo "Samba reiniciado."
else
	echo "Este servidor não é o Primário."
fi
