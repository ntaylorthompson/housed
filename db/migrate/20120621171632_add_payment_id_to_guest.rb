class AddPaymentIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :payment_id, :integer
  end
end
