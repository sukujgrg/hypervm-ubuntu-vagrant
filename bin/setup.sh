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

# clean up
### https://github.com/hashicorp/vagrant/issues/343
### https://github.com/chef/bento

echo "# apt clean up .."
# Delete X11 libraries
apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf;
apt-get -y autoremove --purge
apt-get -y clean

echo "# cleaning up /tmp .."
rm -rf /tmp/*

echo "# removing bash history .."
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

echo "# cleaning up /var/log/ .."
rm -rf /var/log/installer
find /var/log/ -type f -exec sh -c ': > {}' \;

echo "# cleaning up apt list .."
rm -rf /var/lib/apt/lists/*

echo "# ZEROing free space to aid VM compression .."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
