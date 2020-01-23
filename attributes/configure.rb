# frozen_string_literal: true

#
# Cookbook Name:: tgw_uwsgi
# Recipe:: configure
#
# Copyright 2017-2020 TGW Consulting, LLC.
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

default['tgw_uwsgi']['config']['directories']['etc'] = '/etc/uwsgi'
default['tgw_uwsgi']['config']['directories']['apps_available'] = '/etc/uwsgi/apps-available'
default['tgw_uwsgi']['config']['directories']['apps_enabled'] = '/etc/uwsgi/apps-enabled'
default['tgw_uwsgi']['config']['directories']['logs'] = '/var/log/uwsgi'
default['tgw_uwsgi']['config']['directories']['logs_app'] = '/var/log/uwsgi/app'
default['tgw_uwsgi']['config']['directories']['run'] = '/run/uwsgi'
default['tgw_uwsgi']['config']['directories']['run_app'] = '/var/run/uwsgi/app'
default['tgw_uwsgi']['config']['directories']['share'] = '/usr/share/uwsgi'
default['tgw_uwsgi']['config']['directories']['share_init'] = '/usr/share/uwsgi/init'
default['tgw_uwsgi']['config']['directories']['share_conf'] = '/usr/share/uwsgi/conf'

default['tgw_uwsgi']['config']['emperor'] = '/etc/uwsgi/vassals'
