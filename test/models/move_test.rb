require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  test 'associations' do
    assert_must belong_to(:game_state), Move
  end

  test 'validations' do
    move = Move.new
    assert_wont have_valid(:game_state).when(nil), move
    assert_wont have_valid(:indices).when([]), move
  end

  test 'indices serialization' do
    m = FactoryGirl.create(:move)
    assert_equal [9, 0, 1, 2, 5], m.indices
  end
end
