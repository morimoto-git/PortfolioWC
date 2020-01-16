class AddMainImageIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :main_image_id, :string
  end
end
