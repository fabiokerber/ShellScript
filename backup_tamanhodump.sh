#!/bin/bash
#verifica tamanho do dump apos o ultimo backup
servidor_principal="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $servidor_principal = ro:Primary/Unknown ] || [ $servidor_principal = ro:Primary/Secondary ] ;
then
	local_banco="$(grep BKPBANCO= /sbin/backup.sh | awk -F [=,#] '{print $2}')"
	cd $local_banco && tamanho_backup="$(ls -1rt | tail -n1)"
	ls -l --block-size=G "$tamanho_backup" | awk 'NR==1{print $5+0}'
else
        echo 99
fi
