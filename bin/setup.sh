#!/bin/sh

date -u | tee /etc/vagrant_box_build_time

# setting Password-less sudo for vagrant ..
echo 'vagrant ALL=NOPASSWD:ALL' | tee /etc/sudoers.d/vagrant

# to avoid a reverse DNS lookup on the connecting SSH client which can take many seconds ..
sed -i 's/#UseDNS no/UseDNS no/g' /etc/ssh/sshd_config

# setting Vagrant suggested password for root ..
echo -n "root:vagrant" | chpasswd

# installing vagrant key ..
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# turning swap off
swapoff -a
sed -i '/swap/d' /etc/fstab