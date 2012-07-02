class AddUserIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :integer
    add_column :locations, :show_id, :integer
    add_column :locations, :availability_id, :integer
    
    add_index :locations, :user_id
    add_index :locations, :show_id
    add_index :locations, :availability_id
  end
end
