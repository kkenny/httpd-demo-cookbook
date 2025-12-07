#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Update apt package cache for Debian/Ubuntu systems before installing packages!
apt_update 'update package cache' do
  action :nothing
  only_if { platform_family?('debian', 'ubuntu') }
end

# Install httpd package
package node['httpd']['package_name'] do
  action :install
  notifies :update, 'apt_update[update package cache]', :before
end

# Enable httpd service to start on boot
service node['httpd']['service_name'] do
  action [:enable, :start]
end

# Create index.html file
file "#{node['httpd']['html_dir']}/index.html" do
  content '<html><body><h1>Hello World</h1></body></html>'
  owner node['httpd']['user']
  group node['httpd']['group']
  mode '0644'
  action :create
end
