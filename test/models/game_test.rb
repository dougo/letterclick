require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'associations' do
    assert_must have_many(:states), Game
  end

  test 'new game has random letters' do
    srand 1234
    game = Game.new
    assert_equal 25, game.letters.size
    assert_equal 'NYIOUEENEFHLHFOSWTNNUIIIS', game.letters
  end

  test 'new game has initial state' do
    game = Game.new
    assert_equal 1, game.states.size
    assert_equal 1, game.state.turn
  end

  test 'make a move' do
    srand 1234
    game = Game.new
    game.move([1, 14, 11, 3])
    assert_equal 'YOLO', game.moves.last.word
  end
end
