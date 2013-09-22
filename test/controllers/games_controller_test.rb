require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'API routes' do
    assert_routing({ :method => 'get', :path => 'api/v1/games' },
                   { :controller => 'games', :action => 'index',
                     :format => 'json', :api_version => '1' })
    assert_routing({ :method => 'get', :path => 'api/v1/games/1' },
                   { :controller => 'games', :action => 'show',
                     :format => 'json', :api_version => '1', :id => '1' })
    assert_routing({ :method => 'post', :path => 'api/v1/games' },
                   { :controller => 'games', :action => 'create',
                     :format => 'json', :api_version => '1' })
  end

  test 'html index' do
    game = FactoryGirl.create(:game)

    get :index
    assert_select '.game', text: /^Game 1:/
    assert_select '.game a', text: /^Turn 1, score 0&ndash;0/
  end

  test 'html show' do
    game = FactoryGirl.create(:game)

    get :show, id: game.id
    assert_select '.game' # container for Backbone app
  end
end
