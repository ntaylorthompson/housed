class RemoveHostEmailFromShows < ActiveRecord::Migration
  def up
    remove_column :shows, :host_email
      end

  def down
    add_column :shows, :host_email, :string
  end
end
