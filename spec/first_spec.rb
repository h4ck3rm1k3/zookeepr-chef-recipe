require 'chefspec'

describe 'zookeepr::default' do
  #let(:chef_run) { ChefSpec::ChefRunner.new.converge 'zookeepr::default' }
  let(:chef_run) { ChefSpec::SoloRunner.converge('zookeepr::default') }
  
  it "should log the foo attribute" do
    #  chef_run = ChefSpec::ChefRunner.new
    
    #expect(chef_run).to install('git_client')

  end


end
