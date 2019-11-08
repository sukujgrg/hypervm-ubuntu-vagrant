#!/usr/bin/env bash
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

apt-get update && apt-get install -y apt-transport-https curl

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"

apt-get update -y && apt-get install -y kubelet=1.15.5-00 kubeadm=1.15.5-00 kubectl=1.15.5-00

apt-mark hold kubelet kubeadm kubectl

kubeadm config images pull