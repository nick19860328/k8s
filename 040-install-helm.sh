#!/bin/bash

set -xe

sudo snap install helm --classic

helm init --upgrade --history-max 200 --tiller-image=registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.13.1 --stable-repo-url=https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts

apt install subversion
svn export https://github.com/helm/charts/trunk/stable/chartmuseum chartmuseum
helm package ./chartmuseum
helm install --name chartmuseum chartmuseum-0.1.0.tgz