#!/bin/bash
#verifica status dos servicos
Servico=crond
service $Servico status &> /dev/null
echo $?
