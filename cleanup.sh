#!/usr/bin/bash


kubectl delete -f mysql-deployment.yaml
kubectl delete -f nginx-django-deployment.yaml
kubectl delete -f pv-volume.yaml
kubectl delete configmap nginxconfigmap 
kubectl delete secret mysql-pass
kubectl delete secret generic django-secret
#cd ..
#cd heapster
#kubectl delete -f deploy/kube-config/influxdb/
#kubectl delete -f deploy/kube-config/rbac/heapster-rbac.yaml

