class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :content
      t.integer :player
      t.integer :playing_time
      t.integer :level

      t.timestamps
    end
  end
end
