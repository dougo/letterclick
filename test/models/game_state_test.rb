require 'test_helper'

class GameStateTest < ActiveSupport::TestCase
  should belong_to(:game)

  should validate_presence_of(:game)
  should validate_uniqueness_of(:turn) # .scoped_to(:game) # TODO: shoulda bug?
  should validate_numericality_of(:turn).only_integer.is_greater_than(0)
  should ensure_length_of(:squares).is_equal_to(Game::SIZE**2)
end
