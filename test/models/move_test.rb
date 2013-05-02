require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  test 'associations' do
    assert_must belong_to(:game_state), Move
  end

  test 'indices serialization' do
    m = FactoryGirl.create(:move)
    assert_equal [9, 0, 1, 2, 5], m.indices
  end
end
