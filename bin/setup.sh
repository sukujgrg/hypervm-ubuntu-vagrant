#!/bin/sh

date -u > /etc/vagrant_box_build_time

echo "# setting Password-less sudo for vagrant .."
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

echo "# to avoid a reverse DNS lookup on the connecting SSH client which can take many seconds .."
sed -i 's/#UseDNS no/UseDNS no/g' /etc/ssh/sshd_config

echo "# setting Vagrant suggested password for root .."
echo -n "root:vagrant" | chpasswd

echo "# installing vagrant key .."
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
