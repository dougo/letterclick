class Move < ActiveRecord::Base
  belongs_to :game, inverse_of: :moves

  serialize :indices, Array

  validates :game, :indices, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: { only_integer: true, greater_than: 0 }

  after_initialize do
    unless turn || !game
      last_move = game.moves.order('turn').last
      last_turn = last_move ? last_move.turn : 0
      self.turn = last_turn + 1
    end
    self.indices = Array.wrap(indices).map &:to_i
  end

  def word
    indices.map { |i| game.letters[i] }.join
  end

  def serializable_hash(options = nil)
    options ||= {}
    methods = Array.wrap(options[:methods])
    super(options.merge(:methods => methods + [:word]))
  end
end
