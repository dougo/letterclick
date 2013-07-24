require 'test_helper'

class GameStatesControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ :method => 'get', :path => 'api/v1/games/1/states' },
                   { :controller => 'game_states', :action => 'index',
                     :format => 'json', :api_version => '1', :game_id => '1' })
    assert_routing({ :method => 'get', :path => 'api/v1/games/1/state' },
                   { :controller => 'game_states', :action => 'show',
                     :format => 'json', :api_version => '1', :game_id => '1' })
  end

  test 'show current state' do
    game = FactoryGirl.create(:game)
    get :show, :format => :json, :api_version => 1, :game_id => game.id
    assert_response :success
    assert_equal game.state.to_json, @response.body
  end

  test 'show all states' do
    game = FactoryGirl.create(:game)
    get :index, :format => :json, :api_version => 1, :game_id => game.id
    assert_response :success
    assert_equal game.states.to_json, @response.body
  end
end
