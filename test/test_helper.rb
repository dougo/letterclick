ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include Shoulda::Matchers::ActiveRecord
  extend Shoulda::Matchers::ActiveRecord
  include Shoulda::Matchers::ActiveModel
  extend Shoulda::Matchers::ActiveModel
end

module ControllerTestHelpers
  def json_resp
    ActiveSupport::JSON.decode(@response.body)
  end
end

class ActionController::TestCase
  include ControllerTestHelpers
end

class ActionDispatch::IntegrationTest
  include ControllerTestHelpers
  include Capybara::DSL
end
