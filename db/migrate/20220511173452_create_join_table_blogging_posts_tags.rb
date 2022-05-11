class CreateJoinTableBloggingPostsTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :blogging_posts, :blogging_tags do |t|
      t.index [:blogging_post_id, :blogging_tag_id], name: 'index_blogging_posts_tags_on_post_id_and_tag_id'
      t.index [:blogging_tag_id, :blogging_post_id], name: 'index_blogging_posts_tags_on_tag_id_and_post_id'
    end
  end
end
