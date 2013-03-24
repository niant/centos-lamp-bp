# http://blog.servergrove.com/2013/01/11/creating-development-environments-with-vagrant-and-puppet/comment-page-1/
#
# https://sites.google.com/site/timyimblog/blog/deploying-php53-on-centos-with-puppet
#
# https://github.com/example42/puppet-yum
#
# https://github.com/thias/puppet-php
#
# https://github.com/thias/puppet-apache_httpd
#
class { 'yum':
    extrarepo => ['epel', 'remi']
}

class apache {
    package { 'httpd':
        name => 'httpd',
        ensure => installed
    }

    service {'httpd':
        ensure => 'httpd',
        ensure => running,
        require => Package['httpd']
    }
}

apache_httpd { 'prefork':
    modules => [
        'auth_basic',
        'mime',
        'dir',
        'alias',
        'rewrite'
    ]
    # welcome => false,
}

php::module { [ 'pecl-apc', 'xml' ]: }

