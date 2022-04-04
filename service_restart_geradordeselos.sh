#!/bin/bash
hostname_servidor="$(hostname)"
antigo_pid_geradordeselos="$(pgrep -f java)"

sudo /etc/init.d/payara stop ; sudo pkill -9 java ; sudo rm -f /var/run/payara.pid ; sudo /etc/init.d/payara start

novo_pid_geradordeselos="$(pgrep -f java)"

/sbin/sendEmail -f infraestrutura@argoninformatica.com.br -t analistas.infraestrutura@argoninformatica.com.br -u "Servidor: $hostname_servidor | Restart Gerador de Selos" -m "   PAYARA: Antigo PID ($antigo_pid_geradordeselos) > Novo PID ($novo_pid_geradordeselos)" -o tls=yes -s smtp.googlemail.com:587 -xu infraestrutura@argoninformatica.com.br -xp 1nfr@@rg0n -cc renan.cavalcanti@argoninformatica.com.br -cc analistas.suporte@argoninformatica.com.br
