#!/bin/bash
#verifica data ultimo backup
servidor_principal="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $servidor_principal = ro:Primary/Unknown ] || [ $servidor_principal = ro:Primary/Secondary ] ;
then
	local_banco="$(grep BKPBANCO= /sbin/backup.sh | awk -F [=,#] '{print $2}')"
	cd $local_banco && ultimo_backup="$(ls -1rt | tail -n1)"
	stat $ultimo_backup | egrep Modify | awk '{print $2}' | awk -F - '{print $3"/"$2"/"$1}'
else
        echo SECUNDARIO
fi
