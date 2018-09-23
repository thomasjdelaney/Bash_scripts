#!/bin/bash

# Clean old installations

sudo rm -Rf /etc/php.ini
sudo rm -Rf ~/.pearrc
sudo rm -Rf ~/.pear
sudo rm -Rf /usr/local/lib/php
sudo rm -Rf /usr/local/bin/php
sudo rm -Rf /usr/local/opt/php*

brew remove php53
brew remove php54
brew remove php55
brew remove php56

brew unlink php53
brew unlink php54
brew unlink php55
brew unlink php56

# Manual step to remove any brew installed things
ls -l /usr/local/Cellar/ | grep php
brew remove php…..

brew cleanup
xcode-select --install

# Install PHP 5.6
brew update
brew upgrade
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php56 --with-postgresql

sudo subl /etc/apache2/httpd.conf
Update the PHP module line to
LoadModule php5_module    /usr/local/opt/php56/libexec/apache2/libphp5.so
sudo apachectl restart

# Install PEAR - http://jason.pureconcepts.net/2012/10/install-pear-pecl-mac-os-x/
cd ~
curl -O http://pear.php.net/go-pear.phar
sudo php -d detect_unicode=0 go-pear.phar
Set 1: /usr/local/pear
Set 4: /usr/local/bin



# Fix PEAR permissions
chmod -R ug+w `brew --prefix php56`/lib/php
pear config-set php_ini /usr/local/etc/php/5.6/php.ini

# Fix PEAR config and upgrade
pear config-set auto_discover 1
pear update-channels
pear upgrade

# Install PHP extensions
# You might want some more. Use `brew search php56` to see what's available.
brew install php56-mongo php56-memcache php56-mcrypt

# You'll want Composer
brew install composer

sudo apachectl restart
echo "Done."
