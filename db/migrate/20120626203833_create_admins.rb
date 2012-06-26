class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.float :cost_percentage

      t.timestamps
    end
  end
end
