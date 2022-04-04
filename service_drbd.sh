#!/bin/bash
#verifica status dos servicos
Servico=drbd
service $Servico status &> /dev/null
echo $?
