# Chef InSpec test for recipe httpd::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# Test that httpd service is running
describe service('httpd') do
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
  its('owner') { should eq 'apache' }
  its('group') { should eq 'apache' }
  its('mode') { should cmp '0644' }
  its('content') { should include 'Hello World' }
end
