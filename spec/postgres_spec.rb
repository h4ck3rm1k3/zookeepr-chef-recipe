require 'chefspec'

describe 'zookeepr::default' do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(
      log_level: :debug
    ).converge(
      'zookeepr::default'
    )
  }
  it "should install postgres" do
    expect(chef_run).to install_package('postgresql')   
  end
end
