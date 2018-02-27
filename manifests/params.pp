class ambari::params {
  $iptables_service_ensure = 'stopped'
  $iptables_service_name   = 'iptables'
  $selinux                 = 'disabled'
  $ambari_repo_url         = "wget http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.0.3/ambari.repo"
  $agent_ensure            = 'running'
  $server_hostname         = ''
  $url_port                = 8440
  $secured_url_port        = 8441
}
