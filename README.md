tgw_uwsgi COOKBOOK
=================
[![Build Status](https://travis-ci.org/arktos65/tgw_uwsgi.svg?branch=master)](https://travis-ci.org/arktos65/tgw_uwsgi)

uWSGI is a high performance application server framework for Python, Ruby, and other applications.  This cookbook
compiles from source a modular installation of uWSGI.  Using this approach allows for a tailored installation using
wrapper cookbooks.

The Debian configure recipe is somewhat reverse engineered from the uwsgi apt package, but set up in such a way to
allow flexible configuration.

## Supported Platforms

Supported platforms:  Ubuntu Server 14.04, 16.04

Resources
---------
The resources that ship with this cookbook allow you to manage uWSGI applications from other cookbooks, particularly
wrapper cookbooks.

## Example

    uwsgi_application 'some_application.conf' do
        source 'application_template.conf'
        action [:create, :enable]
    end
    
The application name should not include a path, only the target file name.  The attribute `node['tgw_uwsgi']['tgw_uwsgi']['config']['directories']['apps_available']`
contains the path where the target will be copied to.  When using the :enable action, the attribute
`node['tgw_uwsgi']['config']['directories']['apps_enabled']` specifies where the symlink will be created.  

In a wrapper cookbook, if you wish to change the default locations of the apps_available and apps_enabled attributes,
use the node.set in your recipe before using the uwsgi_application resource. Your application configuration files
should be stored in the templates directory.

## Attributes

    default['tgw_uwsgi']['version'] - Version to download and install.
    default['tgw_uwsgi']['download_url'] - URL of source code.
    default['tgw_uwsgi']['service'] - Service name to be created.
    
    default['tgw_uwsgi']['core']['binary'] - File name of uWSGI core binary.
    default['tgw_uwsgi']['core']['directory'] - Path where core binary and plugins will be installed.
    
    default['tgw_uwsgi']['config']['directories']['etc'] = "/etc/uwsgi"
    default['tgw_uwsgi']['config']['directories']['apps_available'] = "/etc/uwsgi/apps-available"
    default['tgw_uwsgi']['config']['directories']['apps_enabled'] = "/etc/uwsgi/apps-enabled"
    default['tgw_uwsgi']['config']['directories']['logs'] = "/var/log/uwsgi"
    default['tgw_uwsgi']['config']['directories']['logs_app'] = "/var/log/uwsgi/app"
    default['tgw_uwsgi']['config']['directories']['run'] = "/run/uwsgi"
    default['tgw_uwsgi']['config']['directories']['run_app'] = "/var/run/uwsgi/app"
    default['tgw_uwsgi']['config']['directories']['share'] = "/usr/share/uwsgi"
    default['tgw_uwsgi']['config']['directories']['share_init'] = "/usr/share/uwsgi/init"
    default['tgw_uwsgi']['config']['directories']['share_conf'] = "/usr/share/uwsgi/conf"
    
Control which plugins are compiled by setting each plugins' :compile attribute to true or false.  See the 
`attributes/build-plugins.rb` for a list of available plugins.

## Usage

### tgw_uwsgi::default

Include `tgw_uwsgi` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[tgw_uwsgi::default]"
  ]
}
```

License & Authors
-----------------
- Author:: Sean M. Sullivan (<sean@tgwconsulting.co>)

```text
Copyright:: 2017-2018 TGW Consulting, LLC
Copyright:: 2014-2017 Pulselocker, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

