default['httpd']['html_dir']      = '/var/www/html'

case node['platform_family']
when 'rhel'
  default['httpd']['package_name']  = 'httpd'
  default['httpd']['service_name']  = 'httpd'
  default['httpd']['user']          = 'apache'
  default['httpd']['group']         = 'apache'
when 'debian', 'ubuntu'
  default['httpd']['package_name']  = 'apache2'
  default['httpd']['service_name']  = 'apache2'
  default['httpd']['user']          = 'www-data'
  default['httpd']['group']         = 'www-data'
end
