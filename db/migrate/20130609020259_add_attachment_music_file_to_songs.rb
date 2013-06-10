class AddAttachmentMusicFileToSongs < ActiveRecord::Migration
  def self.up
    add_attachment :songs, :music_file
  end

  def self.down
    remove_attachment :songs, :music_file
  end
end
