class ambari(
  String $iptables_service_ensure = $::ambari::params::iptables_service_ensure,
  String $iptables_service_name   = $::ambari::params::iptables_service_name,
  String $selinux                 = $::ambari::params::selinux,
  String $ambari_repo_url         = $::ambari::params::ambari_repo_url,
  String $agent_ensure            = $::ambari::params::agent_ensure,
  String $server_hostname         = $::ambari::params::server_hostname,
  Integer $url_port               = $::ambari::params::url_port,
  Integer $secured_url_port       = $::ambari::params::secured_url_port,
) inhertis ::ambari::params {
 class { 'ambari::pre_req': }
 -> class { 'ambari::ntp_service': }
 -> class { 'ambari::agent::install': }
 -> class { 'ambari::agent::config': }
 ~> class { 'ambari::agent::service': }
}
