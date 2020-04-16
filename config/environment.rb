require 'bundler/setup'
require 'rest-client'
require 'json'
Bundler.require

require_all 'lib'

ActiveRecord::Base.logger = nil

#binding.pry