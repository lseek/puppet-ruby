# = Class: ruby::ruby_build
#
# This class clones the ruby-build project and runs it's install script
#
# == Parameters
#
# $repository:: path to the ruby-build repository. Defaults to
#   git://github.com/sstephenson/ruby-build.git. Change if you have
#   your own fork of the project you'd prefer to use.
#
# $clone_path:: path to clone the ruby-build project into.
#   Defaults to '/root/ruby-build'
#
# == Requres:
#
# Nothing.
#
# == Sample Usage:
#
#   class { 'ruby::ruby_build':
#     repository => 'https://mygitserver/path/to/ruby-build.git,
#     clone_path => '/usr/local/ruby-build',
#   }
#
class ruby::ruby_build(
  $repository = $ruby::params::ruby_build_repo,
  $clone_path = $ruby::params::ruby_build_clone_path
) {

  exec { 'clone_ruby_build':
    command => "git clone ${repository} ${clone_path}",
    path    => '/usr/bin',
    unless  => "test -d ${clone_path}",
    require => Package['git'],
  }

  exec { 'install_ruby_build':
    command => './install.sh',
    cwd     => $clone_path,
    require => Exec['clone_ruby_build'],
  }

  package { 'git':
    ensure => 'installed',
  }
}
