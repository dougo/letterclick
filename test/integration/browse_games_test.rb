require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  setup do
    # TODO: this makes the game index be empty.  wtf?
    # Capybara.current_driver = Capybara.javascript_driver
  end

  test 'games index from root' do
    game = FactoryGirl.create(:game)

    visit '/'
    click_link 'Index of games'
    click_link 'Turn 1'
    # TODO: this will only show up with a Javascript driver.
    # assert find '.letter', :text => 'J'
  end
end
