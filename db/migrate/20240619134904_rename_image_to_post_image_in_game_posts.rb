class RenameImageToPostImageInGamePosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :game_posts, :image, :post_image
  end
end
