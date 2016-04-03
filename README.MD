# Provisioning for mac

## How to run

Just go to the folder and run ./install.sh, this will run the basic installation
Then run .osx for variable initialization for the OS and some apps

Git-free:
cd; mkdir -p provision; curl -#L https://github.com/daften/mac-provisioning/tarball/master | tar -xzv --exclude={README.md} -C provision --strip-components 1



## Shell edits

### Bash

* Add the following for bash-completion to .bash_profile
```
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
```

### ZShell

* Add the following near the top for autocomplete
```
fpath=(/usr/local/share/zsh-completions $fpath)
```
* Add this for drush auto complete:
```
autoload bashcompinit
bashcompinit
source /etc/bash_completion.d/drush
```

## Manual installs (App store mainly)

* BetterSnapTool (https://itunes.apple.com/be/app/bettersnaptool/id417375580?mt=12)
* MONIT (https://itunes.apple.com/be/app/monit/id1014850245?mt=12)
* HyperDock (for license)(https://itunes.apple.com/be/app/hyperdock/id449830122?mt=12)
* Reeder 3 (https://itunes.apple.com/be/app/reeder-3/id880001334?mt=12)
* LastPass (https://itunes.apple.com/be/app/lastpass-password-manager/id926036361?mt=12)
* Wunderlist (https://itunes.apple.com/be/app/wunderlist-to-do-list-tasks/id410628904?mt=12)
* Omron Bi-LINK Gateway (https://itunes.apple.com/be/app/omron-bi-link-gateway/id927492133?mt=12)
* OneDrive (https://itunes.apple.com/be/app/onedrive/id823766827?mt=12)

## TODO

* ~/.gitconfig
* ~/.gitignore
* ~/.oh-my-zsh/custom/aliases.zsh

## Based on

* https://github.com/mathiasbynens/
