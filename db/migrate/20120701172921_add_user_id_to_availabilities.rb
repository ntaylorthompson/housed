class AddUserIdToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :user_id, :integer
  end
end
