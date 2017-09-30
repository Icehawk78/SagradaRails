class CreatePips < ActiveRecord::Migration[5.1]
  def change
    create_table :pips do |t|
      t.integer :value

      t.timestamps
    end
  end
end
