class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :date
      t.string :location
      t.string :host_email
      t.integer :host_id
      t.integer :user_id  #user is musician only here
      t.integer :ticket_price
      t.integer :tickets_min
      t.integer :tickets_max

      t.timestamps
    end
  end
end
