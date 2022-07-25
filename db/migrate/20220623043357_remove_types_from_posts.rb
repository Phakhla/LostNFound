class RemoveTypesFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :types, :integer
  end
end
