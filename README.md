# Provisioning for mac

This repository contains the playbooks and roles to set up my personal and professional machines. It contains configuration for general apps, development (generic, web and chef), shells, media-server, roles to configure items for Dropsolid work and Picabit work.

## Installation

1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
2. [Install Ansible](http://docs.ansible.com/intro_installation.html).
    ```
    sudo easy_install pip;
    sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible;
    ```
3. Clone this repository to your local drive.
4. Run `$ ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
5. Run `ansible-playbook -K -i inventory.yml  <playbook>.yml` inside this directory. Enter your account password when prompted.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are shells, development, media.

```
ansible-playbook -K -i inventory.yml <playbook>.yml --tags "shells,homebrew"
```

## Future additions

### Things that still need to be done manually

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

### Applications/packages to be installed:

These are mostly direct download links, some are more difficult to install because of custom installers or other nonstandard install quirks:

See [manual installation](MANUAL_INSTALLATION.md)

### Configuration to be added:

See [manual configuration](MANUAL_CONFIGURATION.md)

## Testing the Playbook

TODO: figure out how to make sure these tests run and within travis' timeframe.

## Based on / credits to

* https://github.com/mathiasbynens/
* https://github.com/geerlingguy/mac-dev-playbook
