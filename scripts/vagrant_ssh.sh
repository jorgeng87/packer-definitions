#!/bin/bash
# Adding the vagrant public key for passwordless ssh

mkdir -v /home/vagrant/.ssh
chmod -v 0700 /home/vagrant/.ssh
wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod -v 0600 /home/vagrant/.ssh/authorized_keys
sudo chown -Rv vagrant:vagrant /home/vagrant/.ssh/
