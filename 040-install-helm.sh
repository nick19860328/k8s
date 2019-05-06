#!/bin/bash

set -xe

sudo snap install helm --classic

helm init --upgrade --history-max 200 --tiller-image=registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.13.1 #--stable-repo-url=https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts

helm repo update
helm install stable/chartmuseum