class Game < ActiveRecord::Base
  has_many :states, class_name: 'GameState', inverse_of: :game

  ALPHABET = ("A".."Z").to_a

  def state
    states.last
  end

  after_initialize do
    self.letters ||= (1..25).map { ALPHABET.sample }.join
    states.build if states.empty?
  end
end
