class AddCommentToCommentPosts < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:comment_posts, :comment)
      add_column :comment_posts, :comment, :string
    end
  end
end
