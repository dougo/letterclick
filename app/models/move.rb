class Move < ActiveRecord::Base
  belongs_to :game, inverse_of: :moves

  serialize :indices, Array

  validates :game, :indices, presence: true
  validates :turn, uniqueness: { scope: :game }
  validates :turn, numericality: { only_integer: true, greater_than: 0 }

  def word
    indices.map { |i| game.letters[i] }.join
  end

  def serializable_hash(options = nil)
    options ||= {}
    methods = Array.wrap(options[:methods])
    super(options.merge(:methods => methods + [:word]))
  end
end
