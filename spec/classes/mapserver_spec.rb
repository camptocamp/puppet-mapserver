require 'spec_helper'
describe 'mapserver' do
  context 'when on unknown OS' do
    let (:facts) { {
      :osfamily => 'SunOS',
    } }

    it 'should fail' do
      expect { should compile }.to raise_error(Puppet::Error, /Unsupported OS/)
    end
  end

  context 'when on RedHat' do
    let (:facts) { {
      :osfamily => 'RedHat',
    } }

    it { should compile.with_all_deps }
  end

  context 'when on Debian' do
    let (:facts) { {
      :osfamily => 'Debian',
    } }

    it { should compile.with_all_deps }
  end
end
