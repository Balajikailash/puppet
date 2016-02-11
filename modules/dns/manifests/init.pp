class dns::file{
file {'/etc/hosts':
ensure => present,
owner => root
group => root
mode => 0644
source => 'puppet:///modules/dns/hosts',
 }
}

class dns{
include dns::file
}
