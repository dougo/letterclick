require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'routes' do
    assert_routing({ method: 'get', path: '' },
                   { controller: 'welcome', action: 'index' })
  end

  test 'index' do
    get :index
    assert_response :success

    letterpress = 'http://www.atebits.com/letterpress/'
    assert_select "a[href='#{letterpress}']", text: 'Letterpress'

    github = 'http://github.com/dougo/letterclick/'
    assert_select "a[href='#{github}']", text: 'Fork me on Github'
  end
end
