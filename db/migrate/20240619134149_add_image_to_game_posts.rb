class AddImageToGamePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :game_posts, :image, :string
  end
end
