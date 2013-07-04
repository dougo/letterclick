require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  should belong_to(:game)

  should serialize(:indices).as(Array)

  should validate_presence_of(:game)
  should validate_presence_of(:indices)
  should validate_uniqueness_of(:turn) # .scoped_to(:game)
  should validate_numericality_of(:turn).only_integer.is_greater_than(0)

  test 'word' do
    move = FactoryGirl.build(:move)
    assert_equal 'WORD', move.word
  end
end
