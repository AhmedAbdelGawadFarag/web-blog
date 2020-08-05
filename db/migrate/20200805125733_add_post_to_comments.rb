class AddPostToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :posts, null: false, foreign_key: true
  end
end
