class AddPurchaseNumberToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :purchase_number, :integer
    add_column :order_products, :subtotal, :integer
  end
end
