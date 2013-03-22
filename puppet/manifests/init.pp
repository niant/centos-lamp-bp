class { 'yum':
    extrarepo => ['epel', 'remi']
}

apache_httpd { 'prefork':
    ssl => true,
    modules => [
        'auth_basic',
        'mime',
        'dir',
        'alias',
        'rewrite'
    ]
    # welcome => false,
}