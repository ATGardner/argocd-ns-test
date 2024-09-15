#!/bin/bash

export NAME=argocd1
helm upgrade ${NAME} \
    --install \
    -n ${NAME} \
    --create-namespace \
    -f values.yaml \
    oci://ghcr.io/argoproj/argo-helm/argo-cd

export PASSWORD=$(kubectl -n ${NAME} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
argocd login --port-forward --port-forward-namespace ${NAME} --username admin --password ${PASSWORD}
argocd --port-forward-namespace ${NAME} cluster add noam --in-cluster --namespace ${NAME}
k apply -f ${NAME}-app.yaml -n ${NAME}
