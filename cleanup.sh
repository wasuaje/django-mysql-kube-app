#!/usr/bin/bash


kubectl delete -f mysql-deployment.yaml
#kubectl delete -f django-deployment.yaml
#kubectl delete -f nginx-rc.yaml
kubectl create -f nginx-django-deployment.yaml
kubectl delete -f pv-volume.yaml
kubectl delete configmap nginxconfigmap 
kubectl delete secret mysql-pass
#cd ..
#cd heapster
#kubectl delete -f deploy/kube-config/influxdb/
#kubectl delete -f deploy/kube-config/rbac/heapster-rbac.yaml