#!/bin/bash

set -xe

apt install -y haproxy

cat <<EOF >>/etc/haproxy/haproxy.cfg
frontend k8s-api
  bind 192.168.0.70:443
  bind 127.0.0.1:443
  mode tcp
  option tcplog
  default_backend k8s-api

backend k8s-api
  mode tcp
  option tcplog
  option tcp-check
  balance roundrobin
  default-server inter 10s downinter 5s rise 2 fall 2 slowstart 60s maxconn 250 maxqueue 256 weight 100
  server k8s01 192.168.0.70:6443 check
  server k8s02 192.168.0.232:6443 check
  server k8s03 192.168.0.231:6443 check
EOF