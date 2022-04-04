#!/bin/bash
#verifica erro ultima execucao do backup
servidor_principal="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $servidor_principal = ro:Primary/Unknown ] || [ $servidor_principal = ro:Primary/Secondary ] ;
then
	erro_backup="$(ls -1rtl /var/log/argon/bkpexterno/ | tail -n1 | awk 'NR==1{print $9}')" 
	grep "nao efetuado" /var/log/argon/bkpexterno/$erro_backup
else
        echo SECUNDARIO
fi
