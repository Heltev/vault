class vault {
  user { 'vault':
    ensure     => present,
    managehome => true,
  }

  file { '/usr/local/bin/vault':
    ensure => present,
    owner  => vault,
    mode   => 'ug+x',
    source => '/vagrant/course-labs/vault',
  }

file { '/home/vault/hvault':
  ensure => 'directory',
  owner  => 'vault',
  group  => 'vault',
}

file { '/etc/vault':
    ensure => directory,
    owner  => vault,
    group  => vault,
  }

  file { '/etc/vault/plugins':
    ensure => directory,
    owner  => vault,
    group  => vault,
  }

  file { '/etc/vault/plugins/vault-secrets-gen':
    ensure => present,
    source => '/home/vagrant/vault-secrets-gen',
    owner  => 'vault',
    group  => 'vault',
    mode   => '0770',
  }
  package { 'perl-Digest-SHA':
    ensure => installed,
  }

  package { 'jq':
    ensure => installed,
  }

  file { '/home/vault/config.hcl':
    ensure  => present,
    source  => 'puppet:///modules/vault/config.hcl',
  }

  file { '/home/vault/regular-user-role.hcl':
    ensure  => present,
    source  => 'puppet:///modules/vault/regular-user-role.hcl',
  }  

  file { '/home/vault/regular-user-role-policy.hcl':
    ensure  => present,
    source  => 'puppet:///modules/vault/regular-user-role-policy.hcl',
  }

  file { '/home/vault/root-user-role.hcl':
    ensure  => present,
    source  => 'puppet:///modules/vault/root-user-role.hcl',
  }  

  file { '/home/vault/root-user-role-policy.hcl':
    ensure  => present,
    source  => 'puppet:///modules/vault/root-user-role-policy.hcl',
  }

  exec { 'initialize vault':
    command => '/usr/local/bin/vault server -config=/home/vault/config.hcl',
    require => File['/home/vault/config.hcl'],
  }
}