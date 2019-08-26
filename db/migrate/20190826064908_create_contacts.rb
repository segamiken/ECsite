class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.string :title
      t.text :content
      t.string :email
      t.string :reply_status

      t.timestamps
    end
  end
end
