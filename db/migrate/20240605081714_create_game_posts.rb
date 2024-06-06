class CreateGamePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :game_posts do |t|
      t.string :post_title
      t.text :post_body
      t.string :shop_name
      t.string :shop_address
      t.integer :latitude
      t.integer :longitude

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
