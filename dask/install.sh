#!/bin/sh


kubectl config use-context space

if ! kubectl get ns | grep 'john-raina-ml' &> /dev/null; then
    kubectl create ns john-raina-ml
fi


if ! helm list -n john-raina-ml | grep 'john-raina-ml' &>/dev/null; then
    helm install john-raina-ml -n john-raina-ml .
else
    helm upgrade john-raina-ml -n john-raina-ml .
fi
