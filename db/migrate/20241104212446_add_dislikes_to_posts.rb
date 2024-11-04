class AddDislikesToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :dislikes_count, :integer
  end
end
