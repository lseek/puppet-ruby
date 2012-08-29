require 'spec_helper'

describe 'ruby::version' do
  let(:title) { '2.1.0-p0' }
  let(:params) { { :version_name => title } }

  it "builds an exec command to build the version of ruby specified" do
    should contain_exec('build_ruby_2.1.0-p0').with(
      :command => 'ruby-build 2.1.0-p0 /usr/local/ruby-2.1.0-p0',
      :notify => 'Exec[install_ruby_2.1.0-p0]'
    )
  end

  it "installs ruby version with `alternatives`" do
    should contain_exec('install_ruby_2.1.0-p0').
      with_command('alternatives install /usr/local/ruby ruby /usr/local/ruby-2.1.0-p0')
  end
end
