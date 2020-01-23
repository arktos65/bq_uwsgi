# frozen_string_literal: true

name             'tgw_uwsgi'
maintainer       'Sean M. Sullivan'
maintainer_email 'sean@barriquesoft.com'
license          'Apache-2.0'
description      'Installs/Configures uWSGI application server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'
issues_url       'https://github.com/arktos65/tgw_uwsgi/issues' if respond_to?(:issues_url)
source_url       'https://github.com/arktos65/tgw_uwsgi' if respond_to?(:source_url)
supports         'ubuntu', '>= 16.04'
chef_version     '~> 14'

recipe 'tgw_uwsgi', 'Default recipe builds core, plugins, and installs runtime environment.'
recipe 'tgw_uwsgi::build_core', 'Builds the uWSGI core program.'
recipe 'tgw_uwsgi::build_plugins', 'Builds the uWSGI plugins.'
recipe 'tgw_uwsgi::configure', 'Creates and configures the runtime environment.'

depends 'apt', '~> 7.2.0'
depends 'build-essential', '~> 8.2.1'
depends 'poise-python', '~> 1.7.0'
depends 'rsyslog', '~> 7.0.1'
