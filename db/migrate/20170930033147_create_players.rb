class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.references :color, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
