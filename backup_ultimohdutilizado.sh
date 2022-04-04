#!/bin/bash
#verifica ultimo hd utilizado para backup
servidor_principal="$(cat /proc/drbd | grep cs: | awk 'NR==1{print $3}')"
if [ $servidor_principal = ro:Primary/Unknown ] || [ $servidor_principal = ro:Primary/Secondary ] ;
then
	cd /var/log/argon/bkpexterno
	cat "$(ls -1rt | grep "bkpexterno_" | tail -n1)" | egrep usbdisk-* | awk 'NR==1{print $6}'
else
        echo SECUNDARIO
fi
