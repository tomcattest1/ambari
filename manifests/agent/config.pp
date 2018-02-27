class ambari::agent::config(
  String $server_hostname   = $::ambari::server_hostname,
  Integer $url_port         = $::ambari::url_port,
  Integer $secured_url_port = $::ambari::secured_url_port,
) {
  file { '/etc/ambari-agent/conf/ambari-agent.ini':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root'
    mode    => '0644',
    content => template("${module_name}/ambari-agent.ini.erb"),
}
