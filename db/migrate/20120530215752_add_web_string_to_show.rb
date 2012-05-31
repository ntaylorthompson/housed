class AddWebStringToShow < ActiveRecord::Migration
  def change
    add_column :shows, :web_string, :string
  end
end
