class ambari::agent::config() {
  file { '/etc/ambari-agent/conf/ambari-agent.ini':
    ensure  => 'file',
    owner   =>
    group   =>
    mode    =>
    content => template("${module_name}/ambari-agent.ini.erb"),
}
