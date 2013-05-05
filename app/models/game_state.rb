class GameState < ActiveRecord::Base
  UNCLAIMED = 0

  belongs_to :game, inverse_of: :states

  serialize :squares, Array

  validates :game, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: { only_integer: true, greater_than: 0 }
  validates :squares, length: { is: Game::SIZE**2 }
end
