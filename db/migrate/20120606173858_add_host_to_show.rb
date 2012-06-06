class AddHostToShow < ActiveRecord::Migration
  def change
    add_column :shows, :host_em, :string
  end
end
