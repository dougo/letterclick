require 'test_helper'

class BrowseGamesTest < ActionDispatch::IntegrationTest
  setup do
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
    assert find '.letter', :text => 'J'

    # Make sure the app doesn't only start on a Turbolinks event...
    page.execute_script('window.location.reload()')
    assert find '.letter', :text => 'J'

    page.execute_script('window.history.back()')
    click_link 'Turn 2'
    assert find '.player1', :text => 'W'
  end
end
