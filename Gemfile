source 'https://rubygems.org'

gem 'rails'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'haml-rails'

  gem 'uglifier'
end

gem 'jquery-rails'

# Make following links faster.
gem 'turbolinks'

# Reduce controller boilerplate code.
gem 'inherited_resources'

group :development, :test do
  # Use factories instead of fixtures.
  gem 'factory_girl_rails'

  # Test Javascript with mocha and chai.
  gem 'konacha'

  # Extra chai matchers.
  gem 'konacha-chai-matchers'

  # Javascript mocks, stubs, and spies.
  gem 'sinon-rails'

  # PhantomJS driver for Javascript testing.
  gem 'poltergeist'
end

group :development do
  # Browse the stack trace when an error is raised.
  gem 'better_errors'

  # Get a console in the browser when an error is raised.
  gem 'binding_of_caller'
end

group :test do
  # Association and validation matchers.
  gem 'shoulda'

  # MiniTest assertions for Capybara matchers.
  gem 'minitest-capybara'

  # Code coverage.
  gem 'simplecov'
end

group :development, :test do
  # Interactive debugger.
  gem 'byebug'
end
