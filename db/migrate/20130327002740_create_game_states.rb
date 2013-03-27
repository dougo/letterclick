class CreateGameStates < ActiveRecord::Migration
  def change
    create_table :game_states do |t|
      t.references :game, index: true
      t.integer :whose_turn

      t.timestamps
    end
  end
end
