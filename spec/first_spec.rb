require 'chefspec'

describe 'zookeepr::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'zookeepr::default' }

  it "should log the foo attribute" do
    #  chef_run = ChefSpec::ChefRunner.new
    pending 'Your recipe examples go here.'
  end
  
end
