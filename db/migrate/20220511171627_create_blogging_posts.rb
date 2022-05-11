class CreateBloggingPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blogging_posts do |t|
      t.integer :author_id, null: false
      t.integer :status, default: 0
      t.datetime :public_from

      t.timestamps
    end
  end
end
