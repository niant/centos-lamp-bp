# What's this?

This is a boilerplate CentOS virtual server (LAMP) for Vagrant setup.

## Installation

1. Install virtualization software like VirtualBox (http://www.virtualbox.org)

2. Install Vagrant to enable development server setups (http://www.vagrantup.com/)

3. Install this LAMP boilerplate

    git clone --recursive git@github.com:niant/centos-lamp-bp.git

    rm -rf .git/

Move files into LAMP project directory

## Usage

1. Configure puppet/site.conf according to the site Apache configurations.

2. Configure puppet/manifests/init.pp according to the requirements(MySQL, PHP etc. packages)

3. Run the environment

    vagrant up
