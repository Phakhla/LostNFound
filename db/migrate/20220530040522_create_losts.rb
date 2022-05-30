class CreateLosts < ActiveRecord::Migration[7.0]
  def change
    create_table :losts do |t|
      t.string :name
      t.string :types
      t.date :date
      t.time :time
      t.string :location
      t.string :detail
      t.string :reward

      t.timestamps
    end
  end
end
