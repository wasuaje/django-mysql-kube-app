#!/usr/bin/bash
#
#
# Commands for image managing
# docker build -t wasuaje/django-mysql-kube-app ./
# docker push wasuaje/django-mysql-kube-app
# docker run wasuaje/django-mysql-kube-app
# *************************************************************
# FIRST STEPS
# yum install -y git vim dos2unix
# git clone https://github.com/wasuaje/django-mysql-kube-app.git
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
kubectl create secret generic django-secret --from-literal=username='admin' --from-literal=password='El4dm1n001'
kubectl create -f pv-volume.yaml
kubectl create -f mysql-deployment.yaml
kubectl create configmap nginxconfigmap --from-file=http-nginx/default.conf
#kubectl create -f django-deployment.yaml
#kubectl create -f nginx-rc.yaml
kubectl create -f nginx-django-deployment.yaml
POD=""
echo "Waiting for containers to  enter in Running state..."
while [ -z "$POD" ]
do
  POD=$(kubectl get pods | grep nginx-django| grep Running| tail -1|awk '{print $1}'|awk -F "/" '{print $1}')
done
echo "Containers created..."
kubectl exec -it -c app-django-mysql ${POD} python manage.py migrate -- --no-input
kubectl exec -it -c app-django-mysql ${POD} python manage.py collectstatic -- --no-input
# You can run by hand the superuser creation later
# kubectl exec -it -c app-django-mysql ${POD} -- python manage.py createsuperuser
#TMPMAIL=admin@example.com
#kubectl exec -it -c app-django-mysql ${POD} echo 'from django.contrib.auth.models import User; User.objects.filter(email="$TMPMAIL").delete(); User.objects.create_superuser("$DJANGO_ADMIN_USER", "$TMPMAIL", "$DJANGO_ADMIN_PASS")' | python manage.py shell
