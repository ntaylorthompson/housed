class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :guest_id
      t.float :amount
      t.timestamps
    end
  end
end
