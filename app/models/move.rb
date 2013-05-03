class Move < ActiveRecord::Base
  belongs_to :game_state, inverse_of: :move

  serialize :indices, Array

  validates :game_state, :indices, :presence => true
end
