class ChangeColumnToCustomer < ActiveRecord::Migration[5.2]
  def up
  	change_column :customers, :birthday, :date
  end

  def down
  	change_column :customers, :birthday, :integer
  end
end
