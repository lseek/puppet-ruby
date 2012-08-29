# = Define: ruby::version
#
# Compiles and sets up a version of ruby as the default
#
# == Parameters:
#
# $version_name:: ruby-build formula name to use
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
#   ruby::version { '1.9.3-p194': }
#
define ruby::version(
  $version_name = $name
) {
  exec { "build_ruby_${version_name}":
    command => "ruby-build ${version_name} /usr/local/ruby-${version_name}",
    path    => '/usr/local/bin',
    unless  => "test -d /usr/local/ruby-${version_name}",
    require => Exec['install_ruby_build'],
    notify  => Exec["install_ruby_${version_name}"],
  }

  exec { "install_ruby_${version_name}":
    command => "alternatives install /usr/local/ruby ruby /usr/local/ruby-${version_name}",
    path    => '/usr/sbin',
  }
}
