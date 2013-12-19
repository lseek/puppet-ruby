# = Define: ruby::version
#
# Compiles and sets up a version of ruby as the default
#
# == Parameters:
#
# $version_name:: ruby-build formula name to use
# $priority:: alternatives priority to be set. Defaults to 10.
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
  $version_name = $name,
  $priority = '10'
) {
  # set a default PATH for all execs
  Exec { path => '/usr/local/bin:/bin' }

  exec { "build_ruby_${version_name}":
    command => "ruby-build ${version_name} /usr/local/ruby-${version_name}",
    unless  => "test -d /usr/local/ruby-${version_name}",
    require => Class['ruby::ruby_build', 'ruby::packages'],
    timeout => '0',
  }

  exec { "install_ruby_${version_name}":
    command => "alternatives --install /usr/local/ruby ruby /usr/local/ruby-${version_name} ${priority}",
    require => Exec["build_ruby_${version_name}"],
  }

  exec { "set_ruby_${version_name}":
    command => "alternatives --set ruby /usr/local/ruby-${version_name}",
    require => Exec["install_ruby_${version_name}"],
  }
}
