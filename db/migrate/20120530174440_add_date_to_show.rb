class AddDateToShow < ActiveRecord::Migration
  def change
    add_column :shows, :date, :date
  end
end
