class AddShowIdToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :show_id, :integer
  end
end
