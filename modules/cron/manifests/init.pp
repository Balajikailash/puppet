
class cron::service{
service {'crond':
ensure => running,
hasstatus => true,
hasrestart => true,
enable => true
}
}

class cron::file{
file {'/etc/cron.d/puppet':
owner => root,
group => root,
mode => 0644,
ensure => present,
source => 'puppet:///modules/cron/puppet',
}
}

class cron {
include cron::service, cron::file
}

