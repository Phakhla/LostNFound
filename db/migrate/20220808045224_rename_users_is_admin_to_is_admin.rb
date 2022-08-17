class RenameUsersIsAdminToIsAdmin < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :isAdmin, :is_admin
  end
end
