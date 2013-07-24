require 'test_helper'

class MovesControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ :method => 'get', :path => 'api/v1/games/1/moves' },
                   { :controller => 'moves', :action => 'index',
                     :format => 'json', :api_version => '1', :game_id => '1' })
    assert_routing({ :method => 'post', :path => 'api/v1/games/1/moves' },
                   { :controller => 'moves', :action => 'create',
                     :format => 'json', :api_version => '1', :game_id => '1' })
  end

  test 'post permits' do
    game = FactoryGirl.create(:game)
    move = FactoryGirl.build(:move, game: game)
    attrs = {
      :seat => move.seat, :indices => move.indices
    }
    post :create, {
      :format => :json, :api_version => 1, :game_id => game.id, :move => attrs
    }
    assert_response :success, json_resp
    assert_equal attrs, json_resp.symbolize_keys.slice(*attrs.keys)
  end
end
