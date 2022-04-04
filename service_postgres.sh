#!/bin/bash
#verifica status dos servicos
servidor_principal="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $servidor_principal = ro:Primary/Unknown ] || [ $servidor_principal = ro:Primary/Secondary ] ;
then
	nmap -v localhost | egrep 5432 | wc -l
else
        echo 99
fi
