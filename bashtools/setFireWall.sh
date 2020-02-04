#!/bin/sh

swapoff -a

echo "disable selinux"
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux


echo "Setup firewall for Kubernetes Kubeadm"
echo "====================================="
echo "Add port 6443 tcp"
	firewall-cmd --permanent --add-port=6443/tcp
echo "Add port 2379 tcp"
	firewall-cmd --permanent --add-port=2379-2380/tcp
echo "Add port 10250 tcp"
	firewall-cmd --permanent --add-port=10250/tcp
echo "Add port 10251 tcp"
	firewall-cmd --permanent --add-port=10251/tcp
echo "Add port 10252 tcp"
	firewall-cmd --permanent --add-port=10252/tcp
echo "Add port 10255 tcp"
	firewall-cmd --permanent --add-port=10255/tcp
echo "Reload Firewall"
	firewall-cmd --reload

echo "Load br_netfilter"
	modprobe br_netfilter
echo "set bridge-nf-call-iptables to 1"
	echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables


