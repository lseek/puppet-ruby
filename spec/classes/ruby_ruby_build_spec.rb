require 'spec_helper'

describe 'ruby::ruby_build' do
  let(:repository) { 'https://github.com/sstephenson/ruby-build.git' }
  let(:clone_path) { '/usr/local/ruby-build' }
  let(:params) { { :repository => repository, :clone_path => clone_path } }

  it { should contain_package('git') }

  it do
    should contain_exec('clone_ruby_build').with(
      :command => "git clone #{repository} #{clone_path}",
      :require => 'Package[git]'
    )
  end

  it do
    should contain_exec('install_ruby_build').with(
      :command => './install.sh',
      :cwd => clone_path,
      :require => 'Exec[clone_ruby_build]'
    )
  end
end
