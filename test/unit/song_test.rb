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

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
