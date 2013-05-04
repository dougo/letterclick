class Move < ActiveRecord::Base
  belongs_to :game_state, inverse_of: :move

  serialize :indices, Array

  validates :game_state, :indices, presence: true

  def word
    indices.map { |i| game_state.game.letters[i] }.join
  end
end
