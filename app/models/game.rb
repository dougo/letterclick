class Game < ActiveRecord::Base
  SIZE = 5

  has_many :states, class_name: 'GameState', inverse_of: :game
  has_many :moves, inverse_of: :game
  has_many :players, inverse_of: :game

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

  after_initialize do
    # TODO: this can result in a board with more than one Z.  Is that ok?
    # Otherwise, shuffle the letters and pick the first SIZE**2.
    self.letters ||= (1..SIZE**2).map { LETTERS.sample }.join
    if states.empty?
      states.build(turn: 1, squares: [GameState::UNCLAIMED]*SIZE**2)
    end
  end

  def state
    states.order('turn').last
  end

  def next_state(move)
    state.next(move)
  end
end
