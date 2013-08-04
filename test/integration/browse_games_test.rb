require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  test 'games index from root' do
    game = FactoryGirl.create(:game)

    visit '/'
    click_link 'Index of games'
    click_link 'Turn 1'
  end
end
