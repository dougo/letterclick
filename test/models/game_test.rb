require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'new game has random letters' do
    game = Game.new
    assert_equal 25, game.letters.size
    assert_not_equal game.letters, Game.new.letters
  end

  test 'new game has initial state' do
    game = Game.new
    assert_equal 1, game.states.size
    assert_equal 1, game.state.whose_turn
  end
end
