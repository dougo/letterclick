class MoveMoveToGame < ActiveRecord::Migration
  def change
    rename_column :moves, :game_state_id, :game_id
    add_column :moves, :turn, :integer
  end
end
