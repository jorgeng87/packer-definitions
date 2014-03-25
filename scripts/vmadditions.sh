#!/bin/bash

echo "Installing VirtualBox guest additions"

apt-get install -y linux-headers-$(uname -r) build-essential perl
apt-get install -y dkms

mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm /home/vagrant/VBoxGuestAdditions.iso
