#
# Cookbook Name:: zookeepr
# Recipe:: default
#
# Copyright 2015, James Michael DuPont
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.


include_recipe 'poise-python'
include_recipe "database::postgresql"
include_recipe "apt::default"
include_recipe "git::default"
include_recipe "python::package"

require 'openssl'
md5 = OpenSSL::Digest::MD5.new

application 'zookeepr' do
  path       '/srv/zookeepr'
  #repository 'https://github.com/flosokaks/zookeepr.git'
  git 'https://github.com/flosokaks/zookeepr.git'
#  virtualenv
  pip_requirements "/srv/zookeepr/requirements.txt"
  #migrate true
  #revision "master"
  #packages ["libpq-dev", "git-core"]


  gunicorn do
    port 9000
  end
end

pgsql_connection_info = {
  host: '127.0.0.1',
  port: 5432,
  username: 'zookeepr',
  password: node[:authorization][:database][:password]
}

postgresql_database 'zk' do
  connection(pgsql_connection_info )
  action :create
end

postgresql_database_user 'zookeepr' do
  connection pgsql_connection_info
  password md5.digest(node[:authorization][:database][:password])
  database_name 'zk'
  privileges [:select, :update, :insert, :delete]
  host '%' # FIXME: Limit by subnet, or something else?
  #require_ssl true
  action [:create, :grant]
end

##########################################

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

packages_to_install.each do |pkg|
  apt_package pkg do
    action :install
  end
end


template '/srv/zookeepr/development.ini' do
  source 'development.ini'
  variables({
     :password => node[:authorization][:database][:password],
  })
end




   # a_block_changing
   # a_block_outputting
   # a_block_raising
   # a_block_throwing
   # a_block_yielding_control
   # a_block_yielding_successive_args
   # a_block_yielding_with_args
   # a_block_yielding_with_no_args
   # a_collection_containing_exactly
   # a_collection_ending_with
   # a_collection_including
   # a_collection_starting_with
   # a_falsey_value
   # a_falsy_value
   # a_hash_including
   # a_kind_of
   # a_nil_value
   # a_range_covering
   # a_string_ending_with
   # a_string_including
   # a_string_matching
   # a_string_starting_with
   # a_truthy_value
   # a_value
   # a_value_between
   # a_value_within
   # add_ifconfig
   # add_route
   # aggregate_failures
   # all
   # allow
   # allow_any_instance_of
   # allow_message_expectations_on_nil
   # an_instance_of
   # an_object_eq_to
   # an_object_eql_to
   # an_object_equal_to
   # an_object_existing
   # an_object_having_attributes
   # an_object_matching
   # an_object_responding_to
   # an_object_satisfying
   # any_args
   # anything
   # array_including
   # assemble_mdadm
   # assert_valid_windows_architecture!
   # be
   # be_a
   # be_a_kind_of
   # be_an
   # be_an_instance_of
   # be_between
   # be_falsey
   # be_falsy
   # be_instance_of
   # be_kind_of
   # be_nil
   # be_truthy
   # be_within
   # boolean
   # cancel_reboot
   # change
   # changing
   # checkout_git
   # checkout_subversion
   # chef_run
   # class
   # class_double
   # class_spy
   # clone
   # configure_startup_windows_service
   # contain_exactly
   # containing_exactly
   # cover
   # covering

   # create_cookbook_file
   # create_cookbook_file_if_missing
   # create_cron
   # create_directory
   # create_env
   # create_file
   # create_file_if_missing
   # create_group
   # create_link
   # create_mdadm
   # create_python_virtualenv
   # create_registry_key
   # create_registry_key_if_missing
   # create_remote_directory
   # create_remote_directory_if_missing
   # create_remote_file
   # create_remote_file_if_missing
   # create_template
   # create_template_if_missing
   # create_user
   
   # dclone
   # define_singleton_method

   # delete_cookbook_file
   # delete_cron
   # delete_directory
   # delete_env
   # delete_file
   # delete_http_request
   # delete_ifconfig
   # delete_key_registry_key
   # delete_link
   # delete_python_virtualenv
   # delete_registry_key
   # delete_remote_directory
   # delete_remote_file
   # delete_route
   # delete_template
   
   # deploy_deploy
   # deprecated
   # described_class
   # described_cookbook
   # described_recipe
   # dhparam_pem_valid?
   # disable_ifconfig
   # disable_mount
   # disable_service
   # disable_windows_service
   # disable_wow64_file_redirection
   # display
   # do_nothing
   # double
   # duck_type
   # dup
   # enable_ifconfig
   # enable_mount
   # enable_service
   # enable_windows_service
   # encrypt_rsa_key
   # end_with
   # ending_with
   # enum_for
   # eq
   # eq_to
   # eql
   # eql?
   # eql_to
   # equal
   # equal_to
   # exist
   # existing
   # expect
   # expect_any_instance_of
   # export_git
   # export_subversion
   # extend
   # ffi_yajl
   # force_deploy_deploy
   # force_export_subversion
   # forced_32bit_override_required?
   # freeze
   # frozen?
   # gem
   # gen_dhparam
   # gen_rsa_key
   # get_http_request
   # get_key_filename
   # hash
   # hash_excluding
   # hash_including
   # hash_not_including
   # have_attributes
   # have_received
   # have_state_attrs
   # head_http_request
   # hide_const
   # include
   # include_recipe
   # including
   # inspect
   
   # install_apt_package
   # install_chef_gem
   # install_dpkg_package
   # install_easy_install_package
   # install_freebsd_package
   # install_gem_package
   # install_ips_package
   # install_macports_package
   # install_package
   # install_pacman_package
   # install_pip_requirements
   # install_poise_languages_scl
   # install_poise_languages_system
   # install_portage_package
   # install_python_package
   # install_python_runtime
   # install_python_runtime_pip
   # install_python_virtualenv
   # install_resource
   # install_rpm_package
   # install_smartos_package
   # install_solaris_package
   # install_yum_package
   
   # instance_double
   # instance_of
   # instance_of?
   # instance_spy
   # instance_variable_defined?
   # instance_variable_get
   # instance_variable_set
   # instance_variables
   # is_a?
   # is_expected
   # is_i386_process_on_x86_64_windows?
   # key_file_valid?
   # key_length_valid?
   # kind_of
   # kind_of?
   # link_to
   # lock_user
   # manage_group
   # manage_user
   # match
   # match_array
   # match_regex
   # matching
   # method
   # methods
   # modify_env
   # modify_group
   # modify_user
   # mount_mount
   # nil?
   # no_args
   # node_supports_windows_architecture?
   # node_windows_architecture
   # nothing_python_execute
   # nothing_python_package
   # nothing_resource
   # notify
   # now_reboot
   # object_double
   # object_id
   # object_spy
   # options_http_request
   # output
   # pending
   # post_http_request
   # pretty_inspect
   # pretty_print
   # pretty_print_cycle
   # pretty_print_inspect
   # pretty_print_instance_variables
   # private_methods
   # protected_methods
   # psych_to_yaml
   # public_method
   # public_methods
   # public_send
   
   # purge_apt_package
   # purge_chef_gem
   # purge_dpkg_package
   # purge_easy_install_package
   # purge_gem_package
   # purge_macports_package
   # purge_package
   # purge_pacman_package
   # purge_portage_package
   # purge_python_package
   # purge_resource
   # purge_yum_package
   
   # put_http_request
   # raise_error
   # raise_exception
   # raising
   # receive
   # receive_message_chain
   # receive_messages

   # reconfig_apt_package
   # reconfig_chef_gem
   # reconfig_gem_package
   # reconfig_package
   # reconfig_python_package
   # reconfig_resource
   # reload_ohai
   # reload_service
   # reload_windows_service
   # remount_mount
   
   # remove_apt_package
   # remove_chef_gem
   # remove_dpkg_package
   # remove_easy_install_package
   # remove_freebsd_package
   # remove_gem_package
   # remove_group
   # remove_instance_variable
   # remove_ips_package
   # remove_macports_package
   # remove_package
   # remove_pacman_package
   # remove_portage_package
   # remove_python_package
   # remove_resource
   # remove_rpm_package
   # remove_smartos_package
   # remove_solaris_package
   # remove_user
   # remove_yum_package
   
   # render_file
   # request_reboot
   # respond_to
   # respond_to?
   # responding_to
   # restart_service
   # restart_windows_service
   # restore_wow64_file_redirection
   # rollback_deploy
   
   # run_bash
   # run_batch
   # run_command_compatible_options
   # run_csh
   # run_erl_call
   # run_execute
   # run_options_resource
   # run_perl
   # run_powershell_script
   # run_python
   # run_python_execute
   # run_python_runtime_options
   # run_resource
   # run_ruby
   # run_ruby_block
   # run_script
   
   # satisfy
   # satisfying
   # send
   # setup_mocks_for_rspec
   # shell_out
   # shell_out!
   # shell_out_with_systems_locale
   # shell_out_with_systems_locale!
   # should
   # should_not
   # singleton_class
   # singleton_method
   # singleton_methods
   # skip
   # spy
   
   # start_service
   # start_windows_service
   # start_with
   # starting_with
   # stop_mdadm
   # stop_service
   # stop_windows_service
   
   # stub_command
   # stub_const
   # stub_data_bag
   # stub_data_bag_item
   # stub_node
   # stub_search
   # subject
   # subscribe_to
   # sync_git
   # sync_subversion
   # taint
   # tainted?
   # tap
   # teardown_mocks_for_rspec
   # throw_symbol
   # throwing
   # to_enum
   # to_json
   # to_s
   # to_yaml
   # to_yaml_properties
   # touch_cookbook_file
   # touch_file
   # touch_remote_file
   # touch_template
   # trust
   # umount_mount
   
   # uninstall_poise_languages_scl
   # uninstall_poise_languages_system
   # uninstall_python_runtime
   # uninstall_python_runtime_pip
   # uninstall_python_virtualenv
   # uninstall_resource
   
   # unlock_user
   # untaint
   # untrust
   # untrusted?
   
   # upgrade_apt_package
   # upgrade_chef_gem
   # upgrade_easy_install_package
   # upgrade_gem_package
   # upgrade_ips_package
   # upgrade_macports_package
   # upgrade_package
   # upgrade_pacman_package
   # upgrade_pip_requirements
   # upgrade_poise_languages_system
   # upgrade_portage_package
   # upgrade_python_package
   # upgrade_resource
   # upgrade_rpm_package
   # upgrade_smartos_package
   # upgrade_yum_package
   
   # valid_windows_architecture?
   # verify_mocks_for_rspec
   # with_os_architecture
   # within
   # wow64_architecture_override_required?
   # wow64_directory
   # write_log
   # yield_control
   # yield_successive_args
   # yield_with_args
   # yield_with_no_args
   # yielding_control
   # yielding_successive_args
   # yielding_with_args
   # yielding_with_no_args

execute 'upgrade alembic' do
  command ' alembic --config development.ini upgrade head '
end




   # run_execute
