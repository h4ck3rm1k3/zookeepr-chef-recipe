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


  it "should setup spec" do
    expect(chef_run).to run_execute("apt-get-update-periodic")
    expect(chef_run).to create_cookbook_file("/etc/apt/apt.conf.d/15update-stamp")
    expect(chef_run).to create_directory('/etc/apt/apt.conf.d')
    expect(chef_run).to create_directory('/var/cache/local')
    expect(chef_run).to create_directory('/var/cache/local/preseeding')
    expect(chef_run).to create_template("/etc/apt/apt.conf.d/10recommends") 
    expect(chef_run).to deploy_application("zookeepr");

    expect(chef_run).to install_chef_gem("pg")
    expect(chef_run).to install_git_client("default") 
    
    expect(chef_run).to install_package("postgresql") 
    expect(chef_run).to install_package("python") 
    expect(chef_run).to install_package("python-dev")


    expect(chef_run).to install_apt_package('libpq-dev')
    expect(chef_run).to install_apt_package('libpython-dev')
    expect(chef_run).to install_apt_package('libxml2-dev')
    expect(chef_run).to install_apt_package('libxslt1-dev')
    expect(chef_run).to install_apt_package('postgresql-9.4')
    expect(chef_run).to install_apt_package('python-authkit')
    expect(chef_run).to install_apt_package('python-elementtidy')
    expect(chef_run).to install_apt_package('python-psycopg2')
    expect(chef_run).to install_apt_package('python-virtualenv')
    
    expect(chef_run).to install_pip_requirements("/srv/zookeepr/requirements.txt")
    expect(chef_run).to install_python_runtime("2")
    expect(chef_run).to sync_git("https://github.com/flosokaks/zookeepr.git")
    expect(chef_run).to create_postgresql_database("zk")    
    expect(chef_run).to create_postgresql_database_user("zookeepr")
    expect(chef_run).to  grant_postgresql_database_user("zookeepr")

    packages_to_install = %w{
python-elementtidy
python-psycopg2
libpq-dev
libpython-dev
libxslt1-dev
libxml2-dev
python-virtualenv
python-authkit
postgresql-9.4
}
    #    expect(chef_run).to install_apt_package("python-psycopg2")
    packages_to_install.each do |pkg|
      expect(chef_run).to install_apt_package(pkg)
    end

    expect(chef_run).to create_template("/srv/zookeepr/development.ini") 

    #[2015-09-22T04:01:08-04:00] INFO: Processing execute[upgrade alembic] action run (zookeepr::default line 534)
    expect(chef_run).to run_execute("upgrade alembic")
    
  end

end
