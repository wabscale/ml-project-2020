#!/bin/sh

echo "http://localhost:5001 scheduler"
echo "http://localhost:5002 webui"
kubectl port-forward svc/john-raina-ml-dask-scheduler 5001:8786 -n john-raina-ml &
PID=$!
trap "kill $PID" EXIT

kubectl port-forward svc/john-raina-ml-dask-scheduler 5002:80 -n john-raina-ml
