#!/bin/bash

set -xe

sudo snap install helm --classic

helm init --upgrade --history-max 200 --tiller-image=registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.13.1 --stable-repo-url=https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'


#apt install -y subversion
#svn export https://github.com/helm/charts/trunk/stable/chartmuseum chartmuseum
#cd chartmuseum
#helm install --name chartmuseum .