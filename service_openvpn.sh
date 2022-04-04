#!/bin/bash
#verifica status dos servicos
Servico=openvpn
service $Servico status &> /dev/null
echo $?
