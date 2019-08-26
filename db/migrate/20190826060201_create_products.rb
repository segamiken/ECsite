class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.integer :genre_id
      t.string :artist_name
      t.string :cd_title
      t.string :label_name
      t.string :product_image_id
      t.integer :price
      t.integer :stock
      t.boolean :buy_capable, default: true, null: false
      t.timestamps
    end
  end
end
