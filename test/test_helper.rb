ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/matchers'
require 'minitest/autorun'
require 'valid_attribute'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include MinitestMatcherLibrary::TestHelpers
  include ValidAttribute::Method
end

class ActionController::TestCase
  def json_resp
    ActiveSupport::JSON.decode(@response.body)
  end
end
