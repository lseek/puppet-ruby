# = Class: ruby::packages
#
# Installs packages required to compilre ruby
#
# == Parameters:
#
# None.
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
# class { 'ruby::packages': }
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
