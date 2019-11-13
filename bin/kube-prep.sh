#!/usr/bin/env bash
kubeadm config images pull

# bash completion
cat | tee /home/vagrant/.bash_profile <<EOF
source <(kubectl completion bash)
source <(kubeadm completion bash)
EOF
chown vagrant:vagrant /home/vagrant/.bash_profile

# calico images
docker pull calico/node:v3.8.4
docker pull calico/pod2daemon-flexvol:v3.8.4
docker pull calico/cni:v3.8.4
docker pull calico/kube-controllers:v3.8.4