require 'test_helper'

class GameTest < ActiveSupport::TestCase
  should have_many(:states)
  should have_many(:moves)

  test 'new game has random letters' do
    srand 1234
    game = Game.new
    assert_equal 'NYIOUEENEFHLHFOSWTNNUIIIS', game.letters
  end

  test 'new game has initial state' do
    game = Game.new
    assert_equal 1, game.states.size
    state = game.states.first
    assert_equal 1, state.turn
    assert_equal [GameState::UNCLAIMED]*game.letters.size, state.squares
  end

  test 'state is last turn' do
    game = FactoryGirl.create(:game)
    assert_equal 1, game.state.turn
    state = FactoryGirl.create(:game_state, :game => game)
    assert_equal state, game.state
  end
end
