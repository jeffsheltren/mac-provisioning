# Manual configuration steps

## Accounts and licenses

* Add the accounts for e.g. Mail, Calendar, Google Chrome, Dropbox
* Add the licenses to the licensed applications

## PHPStorm

After PHPStorm install, you still need to install the plugins and configure the Settings Repository settings.

### Plugins

Elementary:
* .ignore
* (Apache config (.htaccess) support)
* BashSupport
* (Drupal Support)
* Drupal Symfony2 Bridge
* EditorConfig
* Markdown support
* PHP Annotations
* PHP composer.json support
* Php Inspections (EA Extended)
* Symfony Plugin

Optional:
* Silex Plugin
* AngularJS
* Dash
* WakaTime

Then restart PHPStorm.

### Settings repository (synchronization)

Go to File -> Settings repository and enter the repository URL and click overwrite local.

### Textmate bundles

Go to Preferences -> Editor -> Textmate Bundles

#### Ruby

Add the bundle for Ruby on path /Users/daften/.tmbundles/ruby.tmbundle
See http://stackoverflow.com/questions/16451359/is-it-possible-to-get-ruby-syntax-highlighting-in-phpstorm

#### Varnish

Add the bundle for Varnish on path /Users/daften/.tmbundles/varnish.tmbundle

#### XDebug browser extensions

See https://confluence.jetbrains.com/display/PhpStorm/Browser+Debugging+Extensions

## Sublime Text

Install package control (See https://packagecontrol.io/installation)
Symlink the packages folder to a synced folder, e.g. with Dropbox

## MAMP Pro

Use the cloud storage for the hosts.

Add the hosts and import the databases.

## Transmit

Synchronization settings
* Go to Preferences -> Sync
* Sign in

## Sequel Pro

TODO: revisit

Just insert the passwords, they are stored in the keychain then. Favorites are the plist and can be exported by getting the contents from ~/Library/Application\ Support/Sequel\ Pro/Data/Favorites.plist.

See https://coderwall.com/p/pyenna/moving-favorites-from-sequel-pro-don-t-read-the-manual-if-you-are-using-the-last-sequel-pro-version (extra Data path!)

## Git tower

TODO: git configuration


# TODO for automatic

* Sublime text symlink packages folder to Dropbox folder
