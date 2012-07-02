class DropTransactionIdFromPayments < ActiveRecord::Migration

  def up
    remove_column :payments, :transaction_id
    remove_column :shows, :host_id
    remove_column :shows, :location
    remove_column :shows, :host_em
    remove_column :users, :zip
    remove_column :guests, :payment_id
    remove_column :availabilities, :zip
  end

  def down
    add_column :payments, :transaction_id, :integer
    add_column :shows, :host_id, :integer
    add_column :shows, :location, :string
    add_column :shows, :host_em, :string
    add_column :users, :zip, :integer
    add_column :guests, :payment_id, :integer
    add_column :availabilities, :zip, :string
  end
end
