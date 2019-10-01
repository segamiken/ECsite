class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|

      t.string :cd_title
      t.integer :stock
      t.integer :price
      t.timestamps
    end
  end
end
