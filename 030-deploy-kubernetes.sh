#!/bin/bash

set -xe

swapoff -a

#kubeadm init --config=kubeadm-config.yaml --experimental-upload-certs
kubeadm init --pod-network-cidr=192.168.0.0/16 --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

kubectl taint nodes --all node-role.kubernetes.io/master-
