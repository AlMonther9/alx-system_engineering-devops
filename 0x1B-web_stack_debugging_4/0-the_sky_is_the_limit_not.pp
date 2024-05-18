# This Puppet manifest optimizes Nginx to handle more concurrent requests

exec { 'increase-worker-connections':
  command => 'sed -i "s/worker_connections 768;/worker_connections 4096;/" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin'],
  onlyif  => 'grep "worker_connections 768;" /etc/nginx/nginx.conf',
}

exec { 'increase-worker-processes':
  command => 'sed -i "s/worker_processes 1;/worker_processes auto;/" /etc/nginx/nginx.conf',
  path    => ['/bin', '/usr/bin'],
  onlyif  => 'grep "worker_processes 1;" /etc/nginx/nginx.conf',
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => [ Exec['increase-worker-connections'], Exec['increase-worker-processes'] ],
}
