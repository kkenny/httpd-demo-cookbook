#
# Cookbook:: httpd
# Spec:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'httpd::default' do
  context 'When all attributes are default, on RHEL 9' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'rocky', version: '9')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd package' do
      expect(chef_run).to install_package('httpd')
    end

    it 'enables httpd service' do
      expect(chef_run).to enable_service('httpd')
    end

    it 'starts httpd service' do
      expect(chef_run).to start_service('httpd')
    end

    it 'creates index.html file' do
      expect(chef_run).to create_file('/var/www/html/index.html')
        .with(
          content: '<html><body><h1>Hello World</h1></body></html>',
          owner: 'apache',
          group: 'apache',
          mode: '0644'
        )
    end
  end
end

