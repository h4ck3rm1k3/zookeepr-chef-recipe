require 'chefspec'


#set_trace_func proc { |event, file, line, id, binding, classname|
#  printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
#}


RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :debug
end

describe 'zookeepr::default' do

   let(:chef_run) {
    ChefSpec::SoloRunner.new(
      log_level: :debug
    ).converge(
      'zookeepr::default'
    )
  }
 

end
