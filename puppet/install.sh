#!bin/bash

# Install composer
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp
    sudo mv /tmp/composer.phar /usr/local/bin/composer
fi