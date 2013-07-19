class Player < ActiveRecord::Base
  belongs_to :game, inverse_of: :players

  validates :seat, {
    presence: true,
    uniqueness: { scope: :game },
    numericality: { only_integer: true, greater_than: 0, less_than: 3 }
  }
end
