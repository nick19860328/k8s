#!/bin/bash

set -xe

apt update
apt install -y keepalived

cat <<EOF >>/etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state MASTER
    interface enp0s8
    virtual_router_id 51
    priority 200
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass thisismysupersecretpassword
    }
    virtual_ipaddress {
        192.168.31.250
    }
}
EOF

systemctl enable keepalived
systemctl start keepalived