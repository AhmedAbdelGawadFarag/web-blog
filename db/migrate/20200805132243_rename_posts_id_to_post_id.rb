class RenamePostsIdToPostId < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments,:posts_id,:post_id
  end
end
