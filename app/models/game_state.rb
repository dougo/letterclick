class GameState < ActiveRecord::Base
  belongs_to :game, inverse_of: :states
end
