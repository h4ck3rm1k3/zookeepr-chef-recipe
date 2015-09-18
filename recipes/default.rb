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

#include_recipe 'git::default'
include_recipe 'poise-python'
include_recipe "database::postgresql"
include_recipe "git::default"

application 'zookeepr' do
  path       '/srv/zookeepr'
  repository 'https://github.com/flosokaks/zookeepr.git'
  migrate true
  revision "master"
  packages ["libpq-dev", "git-core"]

  # database do
  #   database "zk"
  #   engine "postgresql_psycopg2"
  #   username "zookeepr"
  #   password "zookeepr"
  # end  
    
end


postgresql_database 'zk' do
  connection(
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'zookeepr',
    :password  => node['postgresql']['password']['zookeepr']
  )
  action :create
end
##########################################


git_client 'default' do
   action :install
 end
