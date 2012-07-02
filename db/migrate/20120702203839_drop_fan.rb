class DropFan < ActiveRecord::Migration
  def up
    drop_table :fans
  end

  def down
  end
end
