class ambari::server::service(
  String $server_ensure = $::ambari::server_ensure,
) {
  service { 'ambari-server':
    ensure     => $server_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
