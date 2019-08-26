class CreateClientAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :client_addresses do |t|

      t.integer :customer_id
      t.string :tell_number
      t.string :postal_code
      t.string :address
      t.string :name
      t.string :name_kana

      t.timestamps
    end
  end
end
