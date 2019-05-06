#!/bin/bash

set -xe

sudo snap install helm --classic

helm init --history-max 200