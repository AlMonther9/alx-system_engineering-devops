# Puppet manifest to install Flask from pip3

# Install pip3
package { 'python3-pip':
  ensure => installed,
}

# Install Flask using pip3
exec { 'install_flask':
  command => 'pip3 install Flask==2.1.0',
  path    => ['/usr/bin'],
  require => Package['python3-pip'],
}
