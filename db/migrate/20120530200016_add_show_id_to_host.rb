class AddShowIdToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :show_id, :integer
    add_index :hosts, :show_id
  end
end
