#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Install httpd package
package node['httpd']['package_name'] do
  action :install
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
