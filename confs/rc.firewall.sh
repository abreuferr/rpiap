#!/bin/bash

IPTABLES=/sbin/iptables

# clean all possible old mess
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F

# masquerading
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

# opening all
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t filter -P FORWARD ACCEPT