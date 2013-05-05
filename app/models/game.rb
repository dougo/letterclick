class Game < ActiveRecord::Base
  SIZE = 5

  has_many :states, class_name: 'GameState', inverse_of: :game
  has_many :moves, inverse_of: :game

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
    # TODO: This doesn't work for non-persisted states.
    # https://gist.github.com/dougo/5516162
    # states.order('turn').last
    states.last
  end

  after_initialize do
    self.letters ||= (1..SIZE**2).map { LETTERS.sample }.join
    if states.empty?
      states.build(turn: 1, squares: [GameState::UNCLAIMED]*SIZE**2)
    end
  end

  def move(indices)
    moves.build(turn: state.turn, indices: indices)
    states.build(turn: state.turn + 1)
  end
end
