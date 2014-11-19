#!/usr/bin/env bash

function ansible_run() {
  sudo easy_install pip;
  sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible;

  DIR=${PWD}
  ansible-playbook -i ${DIR}/inventory -vvvv ${DIR}/mac.yml
}

ansible_run
