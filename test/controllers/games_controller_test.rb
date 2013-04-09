require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ :method => 'get', :path => 'games' },
                   { :controller => 'games', :action => 'index' })
  end

  test 'index' do
    get :index, :format => :json
    assert_response :success
    assert_equal [], json_resp
  end
end
