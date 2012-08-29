require 'spec_helper'

describe 'ruby::packages' do
  it { should contain_package('gcc') }

  it "adds zlib-devel before gcc" do
    should contain_package('zlib-devel').
      with_before('Package[gcc]')
  end

  it "adds readline-devel before gcc" do
    should contain_package('readline-devel').
      with_before('Package[gcc]')
  end

  it "adds openssl-devel before gcc" do
    should contain_package('openssl-devel').
      with_before('Package[gcc]')
  end
end
