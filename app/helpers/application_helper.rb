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

  def getSongData(songURL)
    i=0
    local=false
    test="http"
    while(i<=3) do
      if (songURL[i]!=test[i])
        local=true
      end
      i+=1
    end
    if(local)
      getLocalSongData(songURL)
    else
      getWebSongData(songURL)
    end
  end

  def getWebSongData(songURL)
    url="http://developer.echonest.com/api/v4/track/upload"
    mp3=songURL
    key="UK5PJDCBCIRVTS6FN"
    response=Faraday.post do |req|
      req.url url
      req.body={"api_key"=>key,
      "url"=>mp3
      }
    end
    return parseResults(response,key)
  end

  def getLocalSongData(songURL)
    url="http://developer.echonest.com/api/v4/track/upload"

    tempArray=songURL.split('.')
    extension=tempArray[tempArray.length-1]
    puts extension
    key="UK5PJDCBCIRVTS6FN"


    response=RestClient.post(url, 
    :track => File.new(songURL),
    :api_key=>key,
    :filetype=>extension
    )
    return parseResults(response,key)

  end

  def parseResults(response,key)

    response=response.body.delete('"').delete(" ")
    response=response.gsub(':', ',')
    responseArray=response.split(",")
    i=0
    title=""
    artist=""
    md5=""

    while(i<responseArray.length) do
      if(responseArray[i]=='title')
        i+=1
        title=responseArray[i]
      end
      if(responseArray[i]=='artist_name' || responseArray[i]=='artist')
        if(artist=="")
          i+=1
          artist=responseArray[i]
        end
      end
      i+=1
    end

    request="http://developer.echonest.com/api/v4/song/search?"
    keyLink="api_key="+key+"&"
    artistLink="artist="+artist.gsub(' ','%20')+"&"
    titleLink="title="+title.gsub(' ','%20')+"&"
    resultsLink="results=1&"
    bucketLink="bucket=id:7digital-US&"
    bucketLink2="bucket=tracks&"
    formatLink="format=json"

    request+=keyLink
    request+=artistLink
    request+=titleLink
    request+=resultsLink
    request+=bucketLink
    request+=bucketLink2
    request+=formatLink

    file = open(request)
    response2 = file.read


    response2=response2.delete('"')
    response2=response2.gsub(': ', ',')
    responseArray2=response2.split(',')
    i=0
    release_image=''

    while(i<responseArray2.length) do
      if(responseArray2[i]=='[{release_image')
        i+=1
        release_image=responseArray2[i]
        break
      end
      i+=1
    end

    if(release_image=='')
      release_image="https://s-media-cache-ec4.pinimg.com/avatars/blankshoes-1355365014_600.jpg"
    end
    return_vals = {"artists" => artist,
                   "release_image" => release_image,
                   "title" => title
                  }
    return return_vals
  end

end
