require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'routes' do
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
end
