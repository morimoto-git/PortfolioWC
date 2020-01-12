class CreateGameRules < ActiveRecord::Migration[5.2]
  def change
    create_table :game_rules do |t|
      t.integer :game_id
      t.string :image_id
      t.text :text

      t.timestamps
    end
  end
end
