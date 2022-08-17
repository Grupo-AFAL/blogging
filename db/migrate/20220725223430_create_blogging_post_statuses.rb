class CreateBloggingPostStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :blogging_post_statuses do |t|
      t.references :blogging_post, null: false, foreign_key: true
      t.string :locale
      t.datetime :public_from
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
