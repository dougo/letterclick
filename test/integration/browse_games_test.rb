require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  test 'games index from root' do
    game = FactoryGirl.create(:game)

    visit '/'
    click_link 'Index of games'
  end
end
