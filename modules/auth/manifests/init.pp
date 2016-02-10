class auth{
exec {'pass':
command => '/usr/bin/echo "root|KingCobra@88" | chpasswd',
 }
}
