class ambari::server::setup() {
  exec { 'ambari-setup':
    command => "ambari-server setup -s",
    path    => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'],
    user    => 'root',
    }

