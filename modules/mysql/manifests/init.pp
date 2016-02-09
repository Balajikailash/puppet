
class yum::update{
 exec {'yum':
 command => '/usr/bin/yum update -y',
}
}

class mysql::install{
 package {'mariadb-server':
 ensure => installed,
 require => Class['yum::update'],
}
}

class mysql::service{
 service {'mariadb':
 ensure => running,
 hasstatus => true,
 hasrestart => true,
 enable => true,
 require => Class['mysql::install'],
}
}

class mysql::config{
file {'/var/lib/mysql/mysql.cnf':
ensure => present,
owner => mysql,
group => mysql,
require => Class['mysql::service'],
}
}

class mysql {

include yum::update, mysql::install, mysql::service, mysql::config
}
