#
class ruby::packages {
  package { 'gcc':
    ensure  => 'installed',
  }

  package { 'zlib-devel':
    ensure => 'installed',
    before => Package['gcc'],
  }

  package { 'readline-devel':
    ensure => 'installed',
    before => Package['gcc'],
  }

  package { 'openssl-devel':
    ensure => 'installed',
    before => Package['gcc'],
  }
}
