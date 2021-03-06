require 'spec_helper'

describe 'pig', :type => 'class' do
  $test_os.each do |facts|
    os = facts['operatingsystem']

    context "on #{os}" do
      let(:facts) do
        facts
      end
      it { should compile.with_all_deps }
      it { should contain_package('pig') }
      it { should contain_file('/etc/profile.d/hadoop-pig.sh') }
      it { should contain_file('/etc/profile.d/hadoop-pig.csh') }
    end

    context "on #{os} with datafu" do
      let(:facts) do
        facts
      end
      let(:params) { {:datafu_enabled => true} }
      it { should compile.with_all_deps }
      it { should contain_package('pig-udf-datafu') }
    end
  end
end
