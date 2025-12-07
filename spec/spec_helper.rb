#
# Cookbook:: httpd
# Spec Helper
#
# Copyright:: 2025, The Authors, All Rights Reserved.

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.log_level = :warn
end

