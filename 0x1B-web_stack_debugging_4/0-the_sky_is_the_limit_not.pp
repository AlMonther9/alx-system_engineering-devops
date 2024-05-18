# This Puppet manifest fixes the web server setup to handle more requests

exec { 'fix--for-nginx':
  command => '/etc/init.d/nginx reload',
  path    => ['/bin', '/usr/bin'],
}
