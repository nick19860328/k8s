#!/bin/bash

set -xe

cat <<EOF >>/etc/hosts
192.168.31.70 k8s01
192.168.31.232 k8s02
192.168.31.231 k8s03
EOF

apt update
apt install -y haproxy

cat <<EOF >>/etc/haproxy/haproxy.cfg
frontend http_front
   bind *:80
   stats uri /haproxy?stats
   default_backend http_back

backend http_back
   balance roundrobin
   server k8s01 192.168.31.70:80 check
EOF

cat <<EOF >>/etc/haproxy/haproxy.cfg
frontend k8s-api
  bind 192.168.31.70:443
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
  server k8s01 192.168.31.70:6443 check
  server k8s02 192.168.31.232:6443 check
  server k8s03 192.168.31.231:6443 check
EOF

systemctl restart haproxy