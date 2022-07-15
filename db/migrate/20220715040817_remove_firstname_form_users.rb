class RemoveFirstnameFormUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :firstname
    remove_column :users, :lastname
  end
end
