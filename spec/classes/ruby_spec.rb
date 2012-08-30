require 'spec_helper'

describe 'ruby' do
  it { should contain_class('ruby::ruby_build') }
  it { should contain_class('ruby::packages') }

  it "adds ruby.sh profile script" do
    should contain_file('ruby.sh').with(
      :path => '/etc/profile.d/ruby.sh'
    )
  end
end
