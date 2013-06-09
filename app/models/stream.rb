# == Schema Information
#
# Table name: streams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  last_used  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stream < ActiveRecord::Base
  attr_accessible :last_used, :name

  has_many :songs, dependent: :destroy

  

end
