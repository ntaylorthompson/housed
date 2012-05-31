class AddIndexToShowWebString < ActiveRecord::Migration
  def change
    add_index :shows, :web_string, :unique => true
  end
end
