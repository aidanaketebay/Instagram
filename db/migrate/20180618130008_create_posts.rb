class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.integer :likes_count, default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false		      
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
