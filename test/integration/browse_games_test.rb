require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  test 'games index from root' do
    game = FactoryGirl.create(:game)

    visit '/'
    click_link 'Index of games'
    assert page.has_css? '.game', :text => 'Game 1 Turn 1'
  end
end
