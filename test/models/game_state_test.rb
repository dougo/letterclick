require 'test_helper'

class GameStateTest < ActiveSupport::TestCase
  test 'associations' do
    assert_must belong_to(:game), GameState
    assert_must have_one(:move), GameState
  end

  test 'validations' do
    game1 = FactoryGirl.create(:game)
    assert_wont have_valid(:game).when(nil), game1.state

    game1_state2 = FactoryGirl.build(:game_state, game: game1)
    assert_wont have_valid(:turn).when(1), game1_state2

    # Make another game with 2 turns to make sure that uniqueness is scoped.
    game2 = FactoryGirl.create(:game)
    FactoryGirl.create(:game_state, game: game2, turn: 2)
    assert_must have_valid(:turn).when(2), game1_state2
  end
end
