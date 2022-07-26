class RemoveStatusAndPublicFromFromBloggingPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogging_posts, :status, :integer
    remove_column :blogging_posts, :public_from, :datetime
  end
end
