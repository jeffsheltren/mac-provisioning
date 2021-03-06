#!/bin/bash

###############################################################################
# Script based on https://github.com/conradkleinespel/sphp-osx                #
###############################################################################

if [ $# -ne 1 ]; then
  echo "sphp is a command to switch between 2 PHP versions."
  echo "usage: sphp [phpversion]"
  echo "example: sphp 7.2"
  echo "Running the command with the current version will restart the PHP-FPM service."
  echo
  exit 1
fi

newversion="$1"

# Only do a switch if brew php is active
if [ `which php` == '/usr/local/bin/php' ]; then
  currentversion="`php -r \"echo substr(phpversion(), 0, 3);\"`"

  # Check if the given version is available.
  brew list php@$newversion 2> /dev/null > /dev/null
  if [ $? -eq 1 ]; then
    echo "PHP version $newversion is not installed."
    echo
    exit 1
  fi

  # Check if the given version is not already active.
  if [ "$newversion" == "$currentversion" ]; then
    echo "PHP version is already $newversion, restarting PHP-FPM..."
    brew services restart "php@$currentversion"
    echo
    exit 0
  fi

  # Switch the PHP version.
  echo "PHP version $newversion found"
  echo "Switching from $currentversion to $newversion..."

  brew services stop "php@$currentversion"
  brew unlink php@$currentversion && brew link --force --overwrite php@$newversion
  brew services start "php@$newversion"

  echo "Done."
  echo

  exit 0
else
  # Start the PHP version.
  echo "PHP version $newversion found"
  echo "Starting to use $newversion..."

  brew link --force --overwrite php@$newversion
  brew services start "php@$newversion"

  echo "Done."
  echo

  exit 0
fi
