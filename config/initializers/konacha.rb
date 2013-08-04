Konacha.configure do |config|
  config.spec_dir = 'test/javascripts'
  config.driver   = :webkit
end if defined?(Konacha)
