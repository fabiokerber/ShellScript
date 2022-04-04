#!/bin/bash
restart_banco="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $restart_banco = ro:Primary/Unknown ] || [ $restart_banco = ro:Primary/Secondary ] ; 
then
	sudo sh /sbin/service_restart_banco.sh &>/dev/null &
	echo "Banco de Dados e Gerador de Selos reiniciados. Aguarde alguns instantes para acessar o Gesedisp."
else
	echo "Este servidor não é o Primário."
fi
