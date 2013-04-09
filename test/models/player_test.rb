require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'validations' do
    p = Player.new
    assert_must have_valid(:name).when('Dude'), p
    assert_wont have_valid(:name).when(nil, ''), p
  end
end
