class ReplaceWhoseTurnWithTurn < ActiveRecord::Migration
  def up
    change_table :game_states do |t|
      t.remove :whose_turn
      t.integer :turn
    end
  end

  def down
    change_table :game_states do |t|
      t.remove :turn
      t.integer :whose_turn
    end
  end
end
