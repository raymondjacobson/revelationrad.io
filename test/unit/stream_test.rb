# == Schema Information
#
# Table name: streams
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  last_used         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  current_song_time :integer
#

require 'test_helper'

class StreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
