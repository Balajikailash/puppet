class auth{
exec {'auth':
command => '/bin/echo "root|KingCobra@88" | chpasswd',
 }
}
