class AddCompleteToShows < ActiveRecord::Migration
  def change
    add_column :shows, :complete, :boolean
  end
end
