# This Puppet manifest increases the file descriptor limit for the holberton user

exec { 'set-soft-limit':
  command => 'echo "holberton soft nofile 65535" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton soft nofile" /etc/security/limits.conf',
}

exec { 'set-hard-limit':
  command => 'echo "holberton hard nofile 65535" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton hard nofile" /etc/security/limits.conf',
}

exec { 'increase-system-wide-file-limit':
  command => 'echo "fs.file-max = 100000" >> /etc/sysctl.conf && sysctl -p',
  path    => ['/bin', '/usr/bin'],
  unless  => 'sysctl -n fs.file-max | grep -q "100000"',
}
