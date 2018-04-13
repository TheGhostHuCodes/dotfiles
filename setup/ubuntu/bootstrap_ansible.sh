#!/usr/bin/env bash

apt-add-repository --yes ppa:ansible/ansible
apt-get update
apt-get --yes install ansible

if ! grep "localhost ansible_connection=local" /etc/ansible/hosts
then
    echo "localhost ansible_connection=local" >> /etc/ansible/hosts
fi
