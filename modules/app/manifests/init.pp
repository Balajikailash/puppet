class yum::update{
 exec {'yum':
 command => '/usr/bin/yum update -y'
 }
}

class httpd::install{
 package {'httpd':
 require => Class['yum::update'],
 ensure => installed,
 }
}

class httpd::service{
 service {'httpd':
 ensure => running,
 hasstatus => true,
 hasrestart => true,
 enable => true,
 require => Class['httpd::install'],
 }
}

class httpd::config{
 file {'/var/www/html/index.html':
 ensure => present,
 mode => 0777,
 owner => apache,
 group => apache,
 content => 'Hello, World!',
 require => Class['httpd::service'],
} 
}

class python::install{
 package {'python':
 ensure => installed,
 require => Class['httpd::config'],
}
}

class app {
 include yum::update, httpd::install, httpd::service, httpd::config, python::install
}


