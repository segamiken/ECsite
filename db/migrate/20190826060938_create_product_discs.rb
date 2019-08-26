class CreateProductDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :product_discs do |t|

      t.integer :product_id
      t.string :disc_title
      t.timestamps
    end
  end
end
