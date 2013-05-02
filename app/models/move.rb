class Move < ActiveRecord::Base
  belongs_to :game_state, inverse_of: :move

  serialize :indices, Array
end
