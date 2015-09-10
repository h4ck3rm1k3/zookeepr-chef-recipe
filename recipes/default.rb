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
#include_recipe "python::#{node['python']['install_method']}"
include_recipe 'build-essential'

application 'zookeepr' do
  path       '/srv/zookeepr'
  repository 'git@github.com:flosokaks/zookeepr.git'
end
