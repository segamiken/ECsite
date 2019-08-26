class AddColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :customers, :artist_name, :string
  end
end
