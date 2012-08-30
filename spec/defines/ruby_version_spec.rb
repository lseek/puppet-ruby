require 'spec_helper'

describe 'ruby::version' do
  let(:title) { '2.1.0-p0' }
  let(:params) { { :version_name => title, :priority => '50' } }

  it "builds an exec command to build the version of ruby specified" do
    should contain_exec('build_ruby_2.1.0-p0').with(
      :command => 'ruby-build 2.1.0-p0 /usr/local/ruby-2.1.0-p0',
      :require => ['Class[Ruby::Ruby_build]', 'Class[Ruby::Packages]'],
      :timeout => 0,
      :path => '/usr/local/bin:/bin'
    )
  end

  it "installs ruby version with `alternatives`" do
    should contain_exec('install_ruby_2.1.0-p0').with(
      :command => 'alternatives --install /usr/local/ruby ruby /usr/local/ruby-2.1.0-p0 50',
      :require => 'Exec[build_ruby_2.1.0-p0]'
    )
  end

  it "manually sets version of ruby after ensuring an alternative has been made" do
    should contain_exec('set_ruby_2.1.0-p0').with(
      :command => 'alternatives --set ruby /usr/local/ruby-2.1.0-p0',
      :require => 'Exec[install_ruby_2.1.0-p0]'
    )
  end
end
