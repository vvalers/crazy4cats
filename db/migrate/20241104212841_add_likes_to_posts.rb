class AddLikesToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :likes_count, :integer
  end
end
