class RenameCommentsToCommentPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :comments, :comment_posts
    
  end
end
