#!/usr/bin/bash
#
#
# Commands for image managing
# docker build -t wasuaje/app-flask-mysql app-flask/
# docker push wasuaje/app-flask-mysql 
# docker run wasuaje/app-flask-mysql 
# *************************************************************
# FIRST STEPS
# yum install -y git vim dos2unix
# git clone https://github.com/wasuaje/kube-test.git
# git clone https://github.com/wasuaje/heapster.git
# *************************************************************
# After that just run ./start-up.sh
#
# mkdir /tmp/data
#kubectl create -f pv-volume.yaml
# kubectl create -f pv-claim.yaml
#kubectl create secret generic mysql-pass --from-literal=password=123456qwe
#kubectl create -f mysql-deployment.yaml
#usiog nginx rc at least nginx worked
#kubectl create configmap nginxconfigmap --from-file=http-nginx/default.conf
# kubectl expose service nginxsvc --type=LoadBalancer --name=service-test-app
#kubectl expose pod nginx-pv-pod --type=LoadBalancer --name=lb-nginx-test-app
#kubectl create -f flask-deployment.yaml
#kubectl create -f nginx-rc.yaml

# to expose backend
# kubectl expose service flask-app --type=LoadBalancer --port=8080 --target-port=8080 --name=flask-exposed

mkdir /tmp/data
kubectl create secret generic mysql-pass --from-literal=password=123456qwe
kubectl create -f mysql-deployment.yaml
kubectl create configmap nginxconfigmap --from-file=http-nginx/default.conf
kubectl create -f django-deployment.yaml
kubectl create -f nginx-rc.yaml 