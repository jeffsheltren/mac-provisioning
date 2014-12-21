# Provisioning for mac

## How to run

Just go to the folder and run ./install.sh, this will run the basic installation
Then run .osx for variable initialization for the OS and some apps

## Shell edits

### Bash

* Add `eval "$(rbenv init -)"` to .bash_profile
* Add the following for bash-completion to .bash_profile
```
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
```

### ZShell

* Add `eval "$(rbenv init -)"` to .zshrc
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

## TODO

* ~/.gitconfig
* ~/.gitignore
* ~/.oh-my-zsh/custom/aliases.zsh