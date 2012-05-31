class RemoveDateFromShow < ActiveRecord::Migration
  def up
    remove_column :shows, :date
      end

  def down
    add_column :shows, :date, :integer
  end
end
