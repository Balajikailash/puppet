class yum::update{
 exec {'yum-update':
 command => ('/usr/bin/yum update -y'),
 }
}

class git::install{
 package {'git':
 ensure => present,
 require => Class['yum::update'],
 }
}

class git{
include yum::update, git::install
}
