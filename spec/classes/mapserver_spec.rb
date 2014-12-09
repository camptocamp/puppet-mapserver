require 'spec_helper'
describe 'mapserver' do
  context 'when on unknown OS' do
    let (:facts) { {
      :osfamily => 'SunOS',
    } }

    it 'should fail' do
      expect { is_expected.to compile }.to raise_error(/Unsupported OS/)
    end
  end

  context 'when on RedHat' do
    let (:facts) { {
      :osfamily => 'RedHat',
    } }

    it { is_expected.to compile.with_all_deps }
  end

  context 'when on Debian' do
    let (:facts) { {
      :osfamily => 'Debian',
    } }

    it { is_expected.to compile.with_all_deps }
  end
end
