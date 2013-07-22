require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ :method => 'get', :path => 'api/v1/games' },
                   { :controller => 'games', :action => 'index',
                     :api_version => '1' })
    # TODO: test other routes
  end

  test 'index' do
    get :index, :format => :json, :api_version => 1
    assert_response :success
    assert_equal [], json_resp
  end
end
