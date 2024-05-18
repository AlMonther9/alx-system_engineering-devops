# This Puppet manifest changes the OS configuration to increase the file descriptor limit for the holberton user

exec { 'change-os-configuration-for-holberton-user':
  command => 'echo "holberton soft nofile 65535" >> /etc/security/limits.conf && echo "holberton hard nofile 65535" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton.*nofile" /etc/security/limits.conf',
}

exec { 'increase-system-wide-file-limit':
  command => 'echo "fs.file-max = 100000" >> /etc/sysctl.conf && sysctl -p',
  path    => ['/bin', '/usr/bin'],
  unless  => 'sysctl -n fs.file-max | grep -q "100000"',
}
