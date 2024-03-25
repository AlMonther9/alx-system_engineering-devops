# Puppet manifest to kill a process named killmenow

exec { 'kill_killmenow':
  command     => 'pkill killmenow',
  refreshonly => true,
}
