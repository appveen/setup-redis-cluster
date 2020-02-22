#!/bin/sh
echo "********Uninstalling REDIS Cluster On K8S********"
read -p "Enter Kubernetes Namespace : " namespace
kubectl create ns $namespace
cp redis-sts.yaml redis-sts-$namespace.yaml
cp redis-svc.yaml redis-svc-$namespace.yaml 
sed -i "s/__NAMESPACE__/$namespace/" redis-svc-$namespace.yaml 
sed -i "s/__NAMESPACE__/$namespace/" redis-sts-$namespace.yaml
kubectl delete -f redis-svc-$namespace.yaml 
kubectl delete -f redis-sts-$namespace.yaml
rm redis-sts-$namespace.yaml
rm redis-svc-$namespace.yaml 
echo "********REDIS Cluster Uninstalled On K8S*********"