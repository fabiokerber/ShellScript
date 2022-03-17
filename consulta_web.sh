#!/bin/bash
# Script de verificação dos sites

IP_ZABBIXSERVER="10.0.0.8"
HOSTNAME_ZABBIX="Zabbix server"
PATH="/sbin:/bin:/usr/sbin:/usr/bin"

CONSULTA="$(curl -s -H "Origin: http://www.cartoriodalapa.com.br" -H "Access-Control-Request-Method: POST" -H "Content-Type: application/json;charset=utf-8" -X POST https://api.argoninformatica.com.br:8185/central/api/v1/status/checar | awk '{ gsub (" ", "_", $0); print}')"

zabbix_sender -z "$IP_ZABBIXSERVER" -p "10051" -s "$HOSTNAME_ZABBIX" -k consulta.14lapa -o $CONSULTA
