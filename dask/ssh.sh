#!/bin/sh

set -e

kubectl get svc ml-ssh -n john-raina-ml -o json | jq '.metadata.annotations."field.cattle.io/publicEndpoints"' -r | jq '.[0] | "ssh ml@\(.addresses[0]) -p \(.port) -o CheckHostIP=no"' -r
