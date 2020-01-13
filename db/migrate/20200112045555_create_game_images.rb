class CreateGameImages < ActiveRecord::Migration[5.2]
  def change
    create_table :game_images do |t|
      t.integer :game_id
      t.string :image_id

      t.timestamps
      drop_table :game_images
    end
  end
end
