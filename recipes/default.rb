#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Install httpd package
package 'httpd' do
  action :install
end

# Enable httpd service to start on boot
service 'httpd' do
  action [:enable, :start]
end

# Create index.html file
file '/var/www/html/index.html' do
  content '<html><body><h1>Hello World</h1></body></html>'
  owner 'apache'
  group 'apache'
  mode '0644'
  action :create
end
