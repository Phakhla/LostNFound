class ChangeDetailToBeTextInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :detail, :text
  end
end
