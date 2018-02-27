class ambari::pre_req(
 String $iptables_service_ensure  = $::ambari::iptables_service_ensure,
 String $iptables_service_name    = $::ambari::iptables_service_name,
 String $selinux                  = $::ambari::selinux,
 String $ambari_repo_url          = $::ambari::ambari_repo_url,
) {
  File {
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

# Ambari Repo
  exec { 'ambari-server-repo':
    command  => $ambari_repo_url,
    path     => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'],
    cwd      => '/etc/yum.repos.d/',
    creates  => '/etc/yum.repos.d/ambari.repo',
    user     => 'root',
  }

  host { 'ambari_agent':
    name => $::hostname,
    ip   => '10.1.1.1',
  }

  service { 'iptables_setup':
    ensure => $iptables_service_ensure,
    name   => $iptables_service_name,
  }

  file { '/etc/selinux/config':
    content => template("${module_name}/config.erb"),
  }

  file { '/sys/kernel/mm/transparent_hugepage/enabled':
    source => "puppet:///modules/${ambari}/enabled",
  }

  file { '/sys/kernel/mm/transparent_hugepage/defrag':
    source => "puppet:///modules/${ambari}/defrag",
  }
}
