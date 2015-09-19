require 'chefspec'


set_trace_func proc { |event, file, line, id, binding, classname|
  printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
}


RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :debug
end

describe 'zookeepr::default' do
  #let(:chef_run) { ChefSpec::ChefRunner.new.converge 'zookeepr::default' }
  let(:chef_run) { ChefSpec::SoloRunner.converge('zookeepr::default') }
  
  it "should log the foo attribute" do
    #  chef_run = ChefSpec::ChefRunner.new
    
    expect(chef_run).to install('git_client')

  end


end
