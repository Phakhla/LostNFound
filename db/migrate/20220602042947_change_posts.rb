class ChangePosts < ActiveRecord::Migration[7.0]
  def up
    drop_table :posts
    drop_table :founds
    drop_table :losts

    create_table :posts do |t|
      t.string :name
      t.integer :category
      t.integer :types
      t.integer :status
      t.date :date
      t.time :time
      t.string :location
      t.string :detail
      t.string :reward
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :posts

    create_table :posts do |t|
      t.string :name
      t.datetime :lost_date

      t.timestamps
    end

    create_table :founds do |t|
      t.string :name
      t.string :types
      t.date :date
      t.time :time
      t.string :location
      t.string :detail

      t.timestamps
    end

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
