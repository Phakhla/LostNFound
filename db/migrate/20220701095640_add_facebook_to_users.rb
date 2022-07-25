class AddFacebookToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :facebook, :string
  end
end
