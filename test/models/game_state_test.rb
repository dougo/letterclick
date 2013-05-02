require 'test_helper'

class GameStateTest < ActiveSupport::TestCase
  test 'associations' do
    assert_must belong_to(:game), GameState
    assert_must have_one(:move), GameState
  end
end
