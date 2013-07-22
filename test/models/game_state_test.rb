require 'test_helper'

class GameStateTest < ActiveSupport::TestCase
  should belong_to(:game)

  should validate_presence_of(:game)
  should validate_uniqueness_of(:turn) # .scoped_to(:game) # TODO: shoulda bug?
  should validate_numericality_of(:turn).only_integer.is_greater_than(0)

  test 'ensure length of squares array' do
    # TODO: shoulda ensure_length_of only works for strings.
    refute FactoryGirl.build(:game_state, squares: (1..Game::SIZE**2-1).to_a).valid?
    assert FactoryGirl.build(:game_state, squares: (1..Game::SIZE**2).to_a)
    refute FactoryGirl.build(:game_state, squares: (1..Game::SIZE**2+1).to_a).valid?
  end

  test 'next' do
    state = FactoryGirl.create(:game_state)
    move = FactoryGirl.build(:move, game: state.game)
    next_state = state.next(move)
    assert_equal state.game, next_state.game
    assert_equal 3, next_state.turn
    assert_equal [0, 0, 0, 1, 0, # abcDe
                  0, 0, 0, 0, 0, # fghij
                  0, 0, 0, 0, 1, # klmnO
                  0, 0, 1, 0, 0, # pqRst
                  0, 0, 1, 0, 0  # uvWxy
                 ], next_state.squares
  end

  test 'next for seat 2' do
    state = FactoryGirl.create(:game_state)
    move = FactoryGirl.build(:move, game: state.game, seat: 2)
    next_state = state.next(move)
    assert_equal state.game, next_state.game
    assert_equal 3, next_state.turn
    assert_equal [0, 0, 0, 2, 0, # abcDe
                  0, 0, 0, 0, 0, # fghij
                  0, 0, 0, 0, 2, # klmnO
                  0, 0, 2, 0, 0, # pqRst
                  0, 0, 2, 0, 0  # uvWxy
                 ], next_state.squares
  end
end
