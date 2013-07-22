class GameState < ActiveRecord::Base
  UNCLAIMED = 0

  belongs_to :game, inverse_of: :states

  serialize :squares, Array

  validates :game, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: { only_integer: true, greater_than: 0 }
  validates :squares, length: { is: Game::SIZE**2 }

  def next(move)
    next_squares = squares.dup
    move.indices.each do |i|
      next_squares[i] = move.seat unless locked_square_at?(i)
    end
    game.states.build(turn: turn + 1, squares: next_squares)
  end

  private

  def locked_square_at?(i)
    squares[i] != UNCLAIMED && neighbor_indices(i).all? do |j|
      squares[i] == squares[j]
    end
  end

  def neighbor_indices(i)
    range = (0...Game::SIZE)
    r,c = i / Game::SIZE, i % Game::SIZE
    [[r - 1, c], [r, c - 1], [r, c + 1], [r + 1, c]].map do |r2,c2|
      r2 * Game::SIZE + c2 if range.include?(r2) && range.include?(c2)
    end.compact
  end
end
