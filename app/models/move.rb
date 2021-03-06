class Move < ActiveRecord::Base
  belongs_to :game, inverse_of: :moves

  serialize :indices, Array

  validates :game, :indices, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: {
    only_integer: true, greater_than: 0
  }
  validates :seat, presence: true, numericality: {
    only_integer: true, greater_than: 0, less_than: 3
  }
  validates :indices, length: { in: 1..Game::SIZE**2 }

  validate :validate_indices

  after_initialize do
    self.turn ||= game.state.turn if game
  end

  before_validation do
    self.indices = indices.map &:to_i if indices
  end

  after_create do
    game.next_state(self).save! if game
  end

  def word
    indices.map { |i| game.letters[i] }.join
  end

  def serializable_hash(options = nil)
    options ||= {}
    methods = Array.wrap(options[:methods])
    super(options.merge(:methods => methods + [:word]))
  end

  private

  def validate_indices
    range = 0...Game::SIZE**2
    unless indices && indices.all? { |i| i.is_a?(Integer) && range.include?(i) }
      errors.add(:indices, "must be an array of integers in #{range}")
    end
    unless indices && indices == indices.uniq
      errors.add(:indices, 'must not repeat')
    end
  end
end
