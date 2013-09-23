ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

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
  include Capybara::Assertions
end

# TODO: is it better to use database_cleaner?
# See: https://github.com/jnicklas/capybara#transactions-and-database-setup
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
