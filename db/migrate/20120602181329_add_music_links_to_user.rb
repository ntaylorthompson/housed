class AddMusicLinksToUser < ActiveRecord::Migration
  def change
    add_column :users, :mp3_1_url, :string
    add_column :users, :mp3_2_url, :string
  end
end
