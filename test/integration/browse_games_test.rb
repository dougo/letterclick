require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'games index from root' do
    game1 = FactoryGirl.create(:game)
    game2 = FactoryGirl.create(:game)
    FactoryGirl.create(:move, :game => game2)

    visit '/'
    click_link 'Index of games'
    click_link 'Turn 1'
    assert find '.letter', :text => 'J'

    page.execute_script('window.history.back()')
    click_link 'Turn 2'
    assert find '.player1', :text => 'W'
  end
end
