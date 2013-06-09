class AddCurrentSongTimeToStreams < ActiveRecord::Migration
  def change
  	add_column :streams, :current_song_time, :integer
  end
end
