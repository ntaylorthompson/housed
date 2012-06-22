class AddIndexToPaymentsGuestId < ActiveRecord::Migration
  def change
    add_index :payments, :guest_id
  end
end
