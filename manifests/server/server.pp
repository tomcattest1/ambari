class ambari::server(
) {
  package { 'ambari-server':
    ensure  => 'installed',
    require => Exec['get-ambari-server-repo'],
  }

  exec { 'ambari-setup':
    command => "ambari-server setup -s",
    user    => root,
    require => Package['ambari-server']

  }

  service { 'ambari-server':
    ensure  => running,
    enable  => true
    require => [
                 Package['ambari-server'], 
                 Exec['ambari-setup'],
               ],
  }
}
