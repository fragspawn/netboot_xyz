#!/bin/bash
# add IP to Interface
ip link set enp0s20f0u1u1 up

# allow IP forwarding
sysctl -w net.ipv4.ip_forward=1

# masquerade out via wlan
#iptables -F
#iptables -A FORWARD -i wlol -o enp0s20f0u1u1 -m state --state RELATED,ESTABLISHED -j ACCEPT
#iptables -A FORWARD -i enp0s20f0u1u1 -o wlol -j ACCEPT
#iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE

# create a bridge if pxebooting a VM
ip link add br0 type bridge
ip link set br0 up
ip address add dev br0 192.168.192.254/24
ip link set enp0s20f0u1u1 master br0
