class CreateGameDices < ActiveRecord::Migration[5.1]
  def change
    create_table :game_dices do |t|
      t.references :game, foreign_key: true
      t.references :color, foreign_key: true
      t.references :pip, foreign_key: true
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
