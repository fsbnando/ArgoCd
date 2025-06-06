#!/bin/bash
# ----------------------------------------------- #
# Aplica todos os configmaps no diretorio
# By: goliveira@vr.com.br
# ----------------------------------------------- #
if [[ "${1}" ]]; then
    kubectl apply -f ${1}
else
    for configmap in *.yaml; do
        kubectl apply -f ${configmap}
    done
fi