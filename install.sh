#!/bin/sh
echo "********Installing REDIS Cluster On K8S********"
read -p "Enter Kubernetes Namespace : " namespace
read -p "Enter Cluster Size : " size 
kubectl create ns $namespace
cp redis-sts.yaml redis-sts-$namespace.yaml
cp redis-svc.yaml redis-svc-$namespace.yaml 
sed -i "s/__NAMESPACE__/$namespace/" redis-svc-$namespace.yaml 
sed -i "s/__NAMESPACE__/$namespace/" redis-sts-$namespace.yaml
sed -i "s/__SIZE__/$size/" redis-sts-$namespace.yaml
kubectl create -f redis-sts-$namespace.yaml
kubectl create -f redis-svc-$namespace.yaml 
rm redis-sts-$namespace.yaml
rm redis-svc-$namespace.yaml 
echo "********REDIS Cluster Installed On K8S*********"