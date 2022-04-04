#!/bin/bash
restart_geradordeselos="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $restart_geradordeselos = ro:Primary/Unknown ] || [ $restart_geradordeselos = ro:Primary/Secondary ] ; 
then
	sudo sh /sbin/service_restart_geradordeselos.sh &>/dev/null &
	echo "Gerador de Selos reiniciado. Aguarde alguns instantes para acessar o Gesedisp."
else
	echo "Este servidor não é o Primário."
fi
