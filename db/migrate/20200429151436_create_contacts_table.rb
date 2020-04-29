class CreateContactsTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name 
      t.string :phone
      t.string :email 
      t.string :address
      t.integer :user_id
    end
  end
end
