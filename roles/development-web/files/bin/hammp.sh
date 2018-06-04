#!/bin/bash
#
# Script to control the web server and linked config files
#


# Defaults
QUIT=0

# print color
function cred {
  echo -ne "\033[1;31m$1\033[0m"
}
function cgreen {
  echo -ne "\033[1;32m$1\033[0m"
}
function cblue {
  echo -ne "\033[1;34m$1\033[0m"
}
function cyellow {
  echo -ne "\033[1;33m$1\033[0m"
}
function cwhite {
  echo -ne "\033[1;37m$1\033[0m"
}

# Function to get and store the current php version
function php_version {
    PHP=`php -r echo\(PHP_VERSION\)\; | grep -oE -m 1 "^[0-9]+\.[0-9]+\.[0-9]+"`
    PHP_AFTER=""
    len=${#PHP}
    if [[ "$len" -lt 6 ]]
      then PHP_AFTER=" "
    fi
}

##
# Function to switch from one to another version.
#
# @param int
#    The version number to switch to as in (53, 54, 55, 56)
##
function php_switch {
  newversion="$1"
  newversion="${newversion:0:1}.${newversion:1:1}"

  sphp "$newversion"

  # Update script variable.
  php_version
}

##
# Configure PHP
#
# @param int
#   The php version number as int (53, 54, 55, 56)
##
function php_config {
  version="$1"
  if [ -z "$version" ]; then
    version=$(php_version_number)
  fi

  configVersion="${version:0:1}.${version:1}"

  vi $(brew --prefix)/etc/php/$configVersion/php.ini
}

##
# Get the current php version as number
##
function php_version_number {
  currentversion="`php -r \"echo str_replace('.', '', substr(phpversion(), 0, 3));\"`"
  echo "$currentversion"
}



# get the php version
php_version

# Menu function
function menu {
    echo
  echo "------------------------------------------------------"
  echo "| `cwhite Manage\ Brew\ AMP\ Stack`                              |"
  echo "|  Apache      :  `cgreen 11` Start    `cred 12` Stop    `cyellow 13` Restart  |"
  echo "|  MariaDB     :  `cgreen 21` Start    `cred 22` Stop    `cyellow 23` Restart  |"
  echo "|  Solr        :  `cgreen 41` Start    `cred 42` Stop    `cyellow 43` Restart  |"
  echo "|  Mailcatcher :  `cgreen 61` Start    `cred 62` Open UI             |"
  echo "|                                                    |"
  echo "| `cwhite Switch\ PHP\ version` (Current $PHP)$PHP_AFTER                |"
  echo "|  `cblue 56` 5.6         `cblue 70` 7.0      `cblue 71` 7.1     `cblue 72` 7.2      |"
  echo "|                                                    |"
  echo "| `cwhite Other\ Configuration`                                |"
  echo "|  `cblue 91` Apache      `cblue 92` PHP      `cblue 93` MySQL   `cblue 94` Postfix  |"
  echo "|  `cblue 99` /etc/hosts                                     |"
  echo "|                                                    |"
  echo "| `cblue 0` Quit                                             |"
  echo "------------------------------------------------------"
  echo
}

# Execute commands
function menu_execute {
  SERVER=""
  case $1 in

  # APACHE
  11)
    brew services start httpd
    ;;
  12)
    brew services stop httpd
    ;;
  13)
    brew services restart httpd
    ;;

  # MySQL
  21)
    brew services start mariadb
    ;;
  22)
    brew services stop mariadb
    ;;
  23)
    brew services restart mariadb
    ;;

  # TOMCAT (Solr)
  41)
    echo "Starting Solr"
    solr start
    ;;
  42)
    echo "Stopping Solr"
    solr stop
    ;;
  43)
    echo "Restarting Solr"
    solr restart
    ;;


  # MAILCATCHER
  61)
    echo "Starting Mailcatcher"
    echo "  See mailcatcher.me"
    mailcatcher
    echo "  You now can see outgoing email at http://localhost:1080/"
    ;;

  62)
    open "http://localhost:1080/"
    ;;


  # SWITCH PHP VERSIONS
  50)
    php_version
    echo "Current PHP version: $PHP"
    ;;

  56)
    php_switch $1
    ;;

    7[0-9])
    php_switch $1
    ;;

  # PHP config
  8[3-6])
    php_config $1
    ;;


  # APACHE config.
  91)
    vi /usr/local/etc/httpd/httpd.conf
    ;;

  # PHP : Currently active config.
  92)
    php_config
    ;;

  # MySQL config.
  93)
    vi $(brew --prefix)/etc/my.cnf
    ;;

  # MAIL config.
  94)
    sudo vi /etc/postfix/main.cf
    ;;

  # HOSTS
  99)
    sudo vi /etc/hosts
    ;;



  0)
    echo "Bye"
    QUIT=10
    ;;

  *)
    echo "Illegal choice"
    ;;
  esac
}


while [  $QUIT -lt 1 ]; do
  menu
  read MENU_CHOICE
  echo
  menu_execute $MENU_CHOICE
  echo
done


exit
