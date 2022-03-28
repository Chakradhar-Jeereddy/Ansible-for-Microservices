#!/bin/bash

source common.sh

Print "Installing Python3 Installer"
yum install python3-pip -y
StatCheck $?

Print "Upgrading python3 Installer"
pip3 install pip --upgrade
StatCheck $?

Print "Installing Ansible"
pip3 install ansible
StatCheck $?
