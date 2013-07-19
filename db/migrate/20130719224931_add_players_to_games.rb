class AddPlayersToGames < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.belongs_to :game
      t.integer :seat
    end
    reversible do |dir|
      dir.up do
        remove_column :players, :name
      end

      dir.down do
        add_column :players, :name, :string
      end
    end
  end
end
