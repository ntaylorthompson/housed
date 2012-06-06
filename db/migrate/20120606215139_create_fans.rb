class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name
      t.string :email
      t.boolean :host_interest
      t.boolean :fan_interest

      t.timestamps
    end
  end
end
