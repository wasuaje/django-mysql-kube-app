#!/usr/bin/bash

kubectl delete secret mysql-pass
kubectl delete -f mysql-deployment.yaml
kubectl delete configmap nginxconfigmap 
kubectl delete -f flask-deployment.yaml
kubectl delete -f nginx-rc.yaml
cd ..
cd heapster
kubectl delete -f deploy/kube-config/influxdb/
kubectl delete -f deploy/kube-config/rbac/heapster-rbac.yaml