class ambari::ntp_service() {
  package { 'ntp-package':
    ensure => 'installed',
    name   => ['ntp', 'ntpdate'],
 }
  service { 'ntp-service':
    ensure     => 'running',
    name       => 'ntpd',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['ntp-package'],
  }
}
