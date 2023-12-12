#!/bin/bash
# add IP to Interface
ip address add 192.168.192.1/24 dev enp0s20f0u1u1 

# allow IP forwarding
sysctl -w net.ipv4.ip_forward=1

# masquerade out via wlan
iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE
iptables -A FORWARD -i wlol -o enp0s20f0u1u1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp0s20f0u1u1 -o wlol -j ACCEPT

# create a bridge if pxebooting a VM
ip link add br0 type bridge
ip link set enp0s20f0u1u1 master br0
