require 'test_helper'

class MakeAMoveTest < ActionDispatch::IntegrationTest
  setup do
    # TODO: use minitest-metadata to enable "js: true" per test
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'click some letters' do
    game = FactoryGirl.create(:game)
    visit '/games/1'
    'WORD'.chars.each { |letter| find('.letter', :text => letter).click }
    assert_selector '.word', :text => 'WORD'
  end
end
