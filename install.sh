#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function ansible_run() {
  sudo easy_install pip;
  sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible;

  ansible-playbook -K -i ${DIR}/inventory ${DIR}/mac.yml
}

xcode-select --install;
ansible_run
