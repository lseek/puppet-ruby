# = Class: ruby
#
# Includes ruby::ruby_build and ruby::packages classes and contains the
# ruby::version custom type to compile versions of ruby.
#
# == Parameters:
#
# None.
#
# == Require:
#
# Nothing.
#
# == Sample Usage:
#
# class { 'ruby': }
#
class ruby {

  class { 'ruby::ruby_build': }
  class { 'ruby::packages': }

  file { 'ruby.sh':
    ensure  => file,
    path    => '/etc/profile.d/ruby.sh',
    source  => 'puppet:///modules/ruby/ruby.sh',
    owner   => 'root',
    group   => 'root',
  }
}
