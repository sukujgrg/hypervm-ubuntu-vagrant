#!/bin/sh

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
