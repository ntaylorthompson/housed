class ChangeDataTypeForHeaderUrl < ActiveRecord::Migration
  def change
    change_column :users, :mp3_1_url, :text
    change_column :users, :mp3_2_url, :text
    change_column :users, :header, :text
  end
end
