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