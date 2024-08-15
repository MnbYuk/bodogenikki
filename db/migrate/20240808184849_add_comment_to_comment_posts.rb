class AddCommentToCommentPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :comment_posts, :comment, :string
  end
end
