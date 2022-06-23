class AddReasonToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reason, :text
  end
end
