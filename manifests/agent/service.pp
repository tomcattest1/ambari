class ambari::agent::service(
  String $agent_ensure = $::ambari::agent_ensure,
) {
  service { 'ambari-agent':
    ensure     => $agent_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
}
