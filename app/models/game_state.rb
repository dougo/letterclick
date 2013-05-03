class GameState < ActiveRecord::Base
  belongs_to :game, inverse_of: :states
  has_one :move, inverse_of: :game_state # the move that led to this state

  validates :game, presence: true
  validates :turn, uniqueness: { scope: :game }
end
