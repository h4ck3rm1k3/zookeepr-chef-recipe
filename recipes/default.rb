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

# include_recipe 'poise-python'
# include_recipe "database::postgresql"
# include_recipe "apt::default"
# include_recipe "git::default"
# include_recipe "python::package"

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
  action :deploy
end

password = node[:authorization][:database][:password]
template '/srv/zookeepr/development.ini' do
  source 'development.ini'
  variables(
    {
      :password => password
    }
  )
end



require 'openssl'
md5 = OpenSSL::Digest::MD5.new


# self.methods.each do |x|
#   file,line =  self.method(x).source_location
#   m = self.method(x)
#   puts "Check #{x}  #{m} File #{file} Line #{line}"
# end

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

# need to change the directoy
#STDOUT: FAILED: No config file 'development.ini' found, or file has no '[alembic]' section
# execute 'upgrade alembic' do
#   #log_level :debug
#   command ' alembic --config development.ini upgrade head '
# end
