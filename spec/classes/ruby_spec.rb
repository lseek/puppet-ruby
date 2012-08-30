require 'spec_helper'

describe 'ruby' do
  it "installs packages necessary for building ruby" do
    should contain_class('ruby::packages')
  end

  it "adds packages before ruby-build" do
    should contain_class('ruby::ruby_build')
  end

  it "adds ruby.sh profile script" do
    should contain_file('ruby.sh').with(
      :path => '/etc/profile.d/ruby.sh'
    )
  end
end
