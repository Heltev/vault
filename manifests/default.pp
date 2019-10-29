class tools {
  package { [ 'epel-release', 'vim' ]:
    ensure => installed,
  }
}

class pdk {
  File {
    owner  => 'vagrant',
    group  => 'vagrant',
  }

  package { 'pdk':
    ensure => installed,
  }

  file { ['/home/vagrant/.config', '/home/vagrant/.config/puppet']:
    ensure => directory,
  }

  file { '/home/vagrant/.config/puppet/analytics.yml':
    ensure  => file,
    content => "---\ndisabled: true\n"
  }
}


include tools
include pdk
include vault
