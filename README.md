# Django-Mysql-Test-App


This is a personal kubernetes test stack made to put practice some knowledge, this
stack uses a pod with nginx and django exposed by uwsgi sharing a volumen this 
allows nginx to serve statics while uwsgi serve dynamic content.


**First steps**

Run this in a *Kubernetes* cluster with one or more nodes

```
yum install -y git vim dos2unix
git clone https://github.com/wasuaje/django-mysql-kube-app.git
```

**Later**

Just run this script to bring everything up (hopefully ;))

```
cd django-mysql-kube-app
./start-up.sh
```

**Check everything is runnig pointing to a valid exposed cluster URL**

**Start UP script content**
```
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
```

**Useful Commands **

You may want to interactively add a superuser to the django install

```
# You can run by hand the superuser creation later
POD=$(kubectl get pods | grep nginx-django| grep Running| tail -1|awk '{print $1}'|awk -F "/" '{print $1}')
kubectl exec -it -c app-django-mysql ${POD} -- python manage.py createsuperuser

```   