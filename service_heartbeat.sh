#!/bin/bash
#verifica status dos servicos
Servico=heartbeat
service $Servico status &> /dev/null
echo $?
