require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  should belong_to(:game)

  should serialize(:indices).as(Array)

  should validate_presence_of(:game)
  should validate_presence_of(:seat)
  should validate_numericality_of(:seat).only_integer.is_greater_than(0).is_less_than(3)
  should validate_presence_of(:indices)
  should validate_uniqueness_of(:turn) # .scoped_to(:game)
  should validate_numericality_of(:turn).only_integer.is_greater_than(0)

  test 'ensure length of indices array' do
    # TODO: shoulda ensure_length_of only works for strings.
    refute FactoryGirl.build(:move, indices: []).valid?
    assert FactoryGirl.build(:move, indices: [0]).valid?
    assert FactoryGirl.build(:move, indices: (0..Game::SIZE**2-1).to_a).valid?
    refute FactoryGirl.build(:move, indices: (0..Game::SIZE**2).to_a).valid?
  end

  test 'indices must be valid ints' do
    refute FactoryGirl.build(:move, indices: [1,2,3,-1]).valid?
    refute FactoryGirl.build(:move, indices: [4,5,6,Game::SIZE**2]).valid?
    assert FactoryGirl.build(:move, indices: [0,11,Game::SIZE**2-1]).valid?
  end

  test 'no repeated indices' do
    refute FactoryGirl.build(:move, indices: [6,6,6]).valid?
    refute FactoryGirl.build(:move, indices: [8,0,8]).valid?
  end

  test 'convert indices to ints' do
    move = FactoryGirl.build(:move, indices: ["1", "2", "3"])
    assert move.valid?
    assert_equal [1,2,3], move.indices
  end

  test 'default value for turn' do
    game = FactoryGirl.create(:game)
    move = Move.new(game: game)
    assert_equal 1, move.turn

    FactoryGirl.create(:game_state, game: game)
    move = Move.new(game: game.reload)
    assert_equal 2, move.turn
  end

  test 'save the next state after save' do
    move = FactoryGirl.build(:move)
    next_state = move.game.next_state(move)
    assert move.save
    assert_equal next_state.squares, move.game.state.squares
  end

  test 'word' do
    move = FactoryGirl.build(:move)
    assert_equal 'WORD', move.word
    assert_equal 'WORD', move.as_json['word']
  end
end
