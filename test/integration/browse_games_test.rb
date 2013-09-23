require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  setup do
    # TODO: use minitest-metadata to enable "js: true" per test
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'games index from root' do
    game1 = FactoryGirl.create(:game)
    game2 = FactoryGirl.create(:game)
    FactoryGirl.create(:move, :game => game2)

    visit '/'
    click_link 'Index of games'
    click_link 'Turn 1'

    # TODO: I can't get this test to fail by commenting out the
    # page:load event handler.  How do I ensure Capybara uses Turbolinks?
    assert_selector '.letter', :text => 'J'

    # Make sure the app doesn't only start on a Turbolinks event...
    # TODO: is there a way to call PhantomJS reload directly?
    page.execute_script('window.location.reload()')
    assert_selector '.letter', :text => 'J'

    # TODO: is there a way to call PhantomJS goBack directly?
    page.execute_script('window.history.back()')
    click_link 'Turn 2'
    assert_selector '.player1', :text => 'W'
  end
end
