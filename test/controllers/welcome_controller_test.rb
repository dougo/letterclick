require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ method: 'get', path: '' },
                   { controller: 'welcome', action: 'index' })
  end

  test 'index' do
    get :index
    assert_response :success
    assert_select 'a[href="http://www.atebits.com/letterpress/"]', {
      text: 'Letterpress'
    }
  end
end
