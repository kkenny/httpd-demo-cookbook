# Chef InSpec test for recipe httpd::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# Determine platform-specific values for attributes
service_name = os.family == 'redhat' ? 'httpd' : 'apache2'
web_user = os.family == 'redhat' ? 'apache' : 'www-data'
web_group = os.family == 'redhat' ? 'apache' : 'www-data'

# Test that httpd service is running
describe service(service_name) do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# Test that port 80 is listening
describe port(80) do
  it { should be_listening }
  its('protocols') { should include 'tcp' }
end

# Test that index.html exists
describe file('/var/www/html/index.html') do
  it { should exist }
  it { should be_file }
  its('owner') { should eq web_user }
  its('group') { should eq web_group }
  its('mode') { should cmp '0644' }
  its('content') { should include 'Hello World' }
end
