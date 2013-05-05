class AddSquaresToGameStates < ActiveRecord::Migration
  def change
    add_column :game_states, :squares, :string
  end
end
