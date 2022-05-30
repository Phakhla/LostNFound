class CreateFounds < ActiveRecord::Migration[7.0]
  def change
    create_table :founds do |t|
      t.string :name
      t.string :types
      t.date :date
      t.time :time
      t.string :location
      t.string :detail

      t.timestamps
    end
  end
end
