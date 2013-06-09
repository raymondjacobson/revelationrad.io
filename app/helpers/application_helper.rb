module ApplicationHelper
	def full_title(title=nil)
		if (title.present?)
			"#{title}"
		else
			"Revelation Radio"
		end
	end

	def get_recent_streams(number, streams)
  	three_streams = streams.order("created_at DESC").limit(number)
  	three_streams_array = Array.new
  	three_streams.each do |stream|
  		three_streams_array.push(stream[:name])
  	end
  	return three_streams_array
  end

  def make_link_with_name(name)
  	return "/" + name
  end

end
