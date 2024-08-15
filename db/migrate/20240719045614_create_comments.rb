class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_post
      t.integer :user_id
      t.integer :game_post_id

      t.timestamps
    end
  end
end
