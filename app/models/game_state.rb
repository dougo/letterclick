class GameState < ActiveRecord::Base
  belongs_to :game, inverse_of: :states

  validates :game, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: { only_integer: true, greater_than: 0 }
end
