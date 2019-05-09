#!/bin/bash

set -xe

git clone https://github.com/goharbor/harbor-helm
cd harbor-helm
helm install --name harbor . --set persistence.persistentVolumeClaim.registry.storageClass=rook-ceph-block,persistence.persistentVolumeClaim.chartmuseum.storageClass=rook-ceph-block,persistence.persistentVolumeClaim.jobservice.storageClass=rook-ceph-block,persistence.persistentVolumeClaim.database.storageClass=rook-ceph-block,persistence.persistentVolumeClaim.redis.storageClass=rook-ceph-block
