#!/bin/bash

set -xe

sudo snap install helm --classic

helm init --history-max 200 --tiller-image=registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.8.1

curl -fsSL https://raw.githubusercontent.com/fishworks/gofish/master/scripts/install.sh | bash
gofish init

gofish install chartmuseum