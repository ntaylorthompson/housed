class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :email

      t.timestamps
    end
  end
end
