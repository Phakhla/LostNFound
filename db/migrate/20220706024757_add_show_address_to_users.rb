class AddShowAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :not_show_address, :boolean, default: false
  end
end
