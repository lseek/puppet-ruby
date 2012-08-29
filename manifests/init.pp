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
}
