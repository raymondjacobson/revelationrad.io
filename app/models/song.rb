# == Schema Information
#
# Table name: songs
#
#  id                      :integer          not null, primary key
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  stream_id               :integer
#  song_name               :string(255)
#  artist_name             :string(255)
#  art_link                :string(255)
#  music_file_file_name    :string(255)
#  music_file_content_type :string(255)
#  music_file_file_size    :integer
#  music_file_updated_at   :datetime
#

class Song < ActiveRecord::Base
  attr_accessible :song_name, :artist_name, :art_link, :music_file

  belongs_to :stream

  validates_presence_of :stream_id

  #paperclip_opts = { :storage        => :s3,
  #                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  #                      :bucket         => 'dermis', }

  has_attached_file :music_file #, paperclip_opts

end