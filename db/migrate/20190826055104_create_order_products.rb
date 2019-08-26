class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|

      t.integer :order_id
      t.string :artist_name
      t.string :cd_title
      t.string :label_name
      t.string :product_image_id
      t.integer :price

      t.timestamps
    end
  end
end
