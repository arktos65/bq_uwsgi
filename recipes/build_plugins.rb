# frozen_string_literal: true

#
# Cookbook Name:: bq_uwsgi
# Recipe:: build-plugins
#
# Copyright 2017, Sean Michael Sullivan.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

###
# Recipe to compile all the required plugins
###

# Compile the desired plugins and copy them to their home
node['bq_uwsgi']['plugins']['install'].each do |plugin|
  next unless plugin['compile']
    bash "compiling_#{plugin['name']}_plugin" do
      cwd "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['bq_uwsgi']['version']}"
      code <<-EOH
        python uwsgiconfig.py --plugin plugins/#{plugin['name']} package
      EOH
    end
    bash "installing_#{plugin['name']}_plugin" do
      cwd "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['bq_uwsgi']['version']}"
      code <<-EOH
        mv -fv #{node['bq_uwsgi']['plugins']['root']}/#{plugin['name']}_plugin.so #{node['bq_uwsgi']['plugins']['directory']}/
        chown root:root #{node['bq_uwsgi']['plugins']['directory']}/#{plugin['name']}_plugin.so
        chmod 0644 #{node['bq_uwsgi']['plugins']['directory']}/#{plugin['name']}_plugin.so
      EOH
    end
end
