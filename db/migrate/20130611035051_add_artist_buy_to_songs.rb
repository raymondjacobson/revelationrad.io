class AddArtistBuyToSongs < ActiveRecord::Migration
  def change
  	 add_column :songs :columnname :type
  end
end
