class CreateBloggingTags < ActiveRecord::Migration[7.0]
  def change
    create_table :blogging_tags do |t|

      t.timestamps
    end
  end
end
