class CreateDiscSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_songs do |t|

      t.integer :product_disc_id
      t.string :song_name
      t.timestamps
    end
  end
end
