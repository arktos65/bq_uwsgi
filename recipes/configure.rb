# frozen_string_literal: true

#
# Cookbook Name:: tgw_uwsgi
# Recipe:: configure
#
# Copyright 2017 TGW Consulting, LLC.
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
# Recipe to install application and configure server environment
###

# Create the runtime directories
log 'Creating uWSGI runtime directories'
node['tgw_uwsgi']['config']['directories'].each do |key, value|
  log "#{key} = #{value}"
  directory value do
    owner 'root'
    group 'root'
    mode 0o755
    action :create
  end
end

if node['tgw_uwsgi']['emperor']['enable']
  directory node['tgw_uwsgi']['config']['emperor'] do
    owner 'root'
    group 'root'
    mode 0o755
    action :create
  end
end

include_recipe 'tgw_uwsgi::debian' if node['platform_family'] == 'debian'
