class Game < ActiveRecord::Base
  has_many :states, class_name: 'GameState', inverse_of: :game

  # Letter frequencies stolen from Lexulous.  I hope they won't mind.
  FREQS = {
    A: 8,
    B: 2,
    C: 2,
    D: 3,
    E: 11,
    F: 2,
    G: 2,
    H: 2,
    I: 8,
    J: 1,
    K: 1,
    L: 3,
    M: 2,
    N: 5,
    O: 7,
    P: 2,
    Q: 1,
    R: 5,
    S: 3,
    T: 5,
    U: 3,
    V: 2,
    W: 2,
    X: 1,
    Y: 3,
    Z: 1
  }

  LETTERS = FREQS.flat_map { |letter, freq| (letter.to_s * freq).split '' }

  def state
    states.last
  end

  after_initialize do
    self.letters ||= (1..25).map { LETTERS.sample }.join
    states.build if states.empty?
  end
end