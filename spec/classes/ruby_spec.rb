require 'spec_helper'

describe 'ruby' do
  it { should contain_class('ruby::ruby_build') }
  it { should contain_class('ruby::packages') }
end
