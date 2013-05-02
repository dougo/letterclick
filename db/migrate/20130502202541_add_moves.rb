class AddMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.belongs_to :game_state
      t.string :indices
      t.timestamps
    end
  end
end
