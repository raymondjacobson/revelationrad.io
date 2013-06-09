# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stream_id   :integer
#  song_name   :string(255)
#  artist_name :string(255)
#  art_link    :string(255)
#

class Song < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :stream

  validates_presence_of :stream_id

end
