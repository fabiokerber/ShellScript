#!/bin/bash
hostname_servidor="$(hostname)"
antigo_pid_samba="$(/etc/init.d/samba status | awk -F "[()]" '{print $2}')"

sudo /etc/init.d/samba restart

sleep 5

novo_pid_samba="$(/etc/init.d/samba status | awk -F "[()]" '{print $2}')"

/sbin/sendEmail -f infraestrutura@argoninformatica.com.br -t analistas.infraestrutura@argoninformatica.com.br -u "Servidor: $hostname_servidor | Restart SAMBA" -m "     Antigo PID ($antigo_pid_samba)" "\n" "    Novo PID ($novo_pid_samba)" -o tls=yes -s smtp.googlemail.com:587 -xu infraestrutura@argoninformatica.com.br -xp 1nfr@@rg0n -cc renan.cavalcanti@argoninformatica.com.br -cc analistas.suporte@argoninformatica.com.br
