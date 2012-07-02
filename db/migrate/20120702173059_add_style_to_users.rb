class AddStyleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :style, :string
    add_column :shows, :public, :boolean
  end
end
