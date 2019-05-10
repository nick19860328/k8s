#!/bin/bash

set -xe

apt install -y subversion
svn export https://github.com/helm/charts/trunk/stable/prometheus prometheus
cd prometheus
helm install --name prometheus . --namespace=prometheus --set alertmanager.persistentVolume.storageClass=rook-ceph-block,pushgateway.persistentVolume.storageClass=rook-ceph-block,server.persistentVolume.storageClass=rook-ceph-block
