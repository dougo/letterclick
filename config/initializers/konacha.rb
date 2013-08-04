Konacha.configure do |config|
  config.spec_dir = 'test/javascripts'
  require 'capybara/poltergeist'
  config.driver   = :poltergeist
end if defined?(Konacha)
