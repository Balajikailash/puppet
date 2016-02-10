class auth::file{
file {'/root/autopass.sh':
ensure => present,
owner => root,
group => root,
mode => 0700,
source => puppet:///modules/auth/autopass.sh,
 }
}

class auth::script{
exec {'script':
command => ('/sbin/source /root/autopass.sh'),
require => Class['auth::file'],
 }
}

class auth{
include auth::file, auth::script
}
