class GameState < ActiveRecord::Base
  belongs_to :game, inverse_of: :states

  after_initialize do
    self.whose_turn ||= 1
  end
end
