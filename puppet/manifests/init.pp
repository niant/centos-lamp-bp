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

Firewall {
  require => Class['my_fw::pre']
}

class { ['my_fw::pre']: }

class { 'firewall': }

apache_httpd::file { 'localhost.conf':
    source => '/vagrant/puppet/site.conf',
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

class { 'php::mod_php5': }

include php::cli

php::ini { '/etc/php.ini':
    display_errors => 'On',
    memory_limit   => '256M',
    date_timezone  => 'Europe/Helsinki'
}

class { 'mysql::server':
    config_hash => { 'root_password' => 'root' }
}

# DB for the application
# mysql::db { 'database_name':
#     user     => 'user',
#     password => 'password',
#     host     => 'localhost',
#     grant    => ['all'],
# }


class { 'mysql': }

php::module { [ 'pecl-apc', 'pdo', 'mysql' ]: }

