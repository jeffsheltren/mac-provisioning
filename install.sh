#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ANSIBLE_ROLES_PATH="$DIR/roles_contrib"

function ansible_install() {
  sudo easy_install pip;
  sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible;
}

function ansible_run() {
  ansible-playbook -K -i ${DIR}/inventory ${DIR}/mac.yml;
}

# xcode-select --install;
ansible_install;
ansible_run;
