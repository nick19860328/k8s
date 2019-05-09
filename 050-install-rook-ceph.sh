#!/bin/bash

set -xe

# Create a ServiceAccount for Tiller in the `kube-system` namespace
#kubectl --namespace kube-system create sa tiller

# Create a ClusterRoleBinding for Tiller
#kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

# Patch Tiller's Deployment to use the new ServiceAccount
#kubectl --namespace kube-system patch deploy/tiller-deploy -p '{"spec": {"template": {"spec": {"serviceAccountName": "tiller"}}}}'

helm repo add rook-release https://charts.rook.io/release
helm install --namespace rook-ceph rook-release/rook-ceph