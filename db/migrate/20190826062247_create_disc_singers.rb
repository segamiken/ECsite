class CreateDiscSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_singers do |t|

      t.integer :product_disc_id
      t.string :singer_name

      t.timestamps
    end
  end
end
