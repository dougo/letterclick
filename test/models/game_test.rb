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
    assert_equal 1, game.state.turn
    assert_equal [GameState::UNCLAIMED]*game.letters.size, game.state.squares
  end

  test 'make a move' do
    srand 1234
    game = Game.new
    game.move([1, 14, 11, 3])
    assert_equal 'YOLO', game.moves.last.word
    # TODO: check game.state.squares
  end
end
