#!/bin/bash

set -xe

apt install -y subversion
svn export https://github.com/helm/charts/trunk/stable/fluentd fluentd
cd fluentd
helm install --name fluentd . --namespace fluentd --set image.repository=registry.cn-hangzhou.aliyuncs.com/google_containers/fluentd-elasticsearch 