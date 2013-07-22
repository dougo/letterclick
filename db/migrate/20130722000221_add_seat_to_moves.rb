class AddSeatToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :seat, :integer
  end
end
