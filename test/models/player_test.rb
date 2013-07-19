require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  should belong_to(:game)
  should validate_presence_of(:seat)
  should validate_uniqueness_of(:seat) # .scoped_to(:game)
  should validate_numericality_of(:seat).only_integer.is_greater_than(0).is_less_than(3)
end
