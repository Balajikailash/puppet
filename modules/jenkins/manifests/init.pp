class yum::update{
exec {'yum-update':
command => ('/usr/bin/yum update -y'),
}
}

class jenkins::repo{
yumrepo {'jenkins':
baseurl => 'http://pkg.jenkins-ci.org/redhat',
descr => Jenkins,
gpgcheck => 0,
}
}

class java::install{
package {'java-1.8.0-openjdk':
ensure => present,
require => Class['yum::update'],
}
}

class jenkins::install{
package {'jenkins':
ensure => present,
require => Class['java::install'],
}
}

class jenkins::service{
service {'jenkins':
ensure => running,
hasstatus => true,
hasrestart => true,
enable => true,
require => Class['jenkins::install'],
}
}

class jenkins{
include yum::update, jenkins::repo, java::install, jenkins::install, jenkins::service
}
