class SongsController < ApplicationController
	before_filter :stream_owns_song

	def show
		@song = @stream.songs.find(params[:id])
	end

  def create
  	@song = @stream.songs.new(params[:song])
  	if @song.save
  	else
  		redirect_to 'steams/show'
  	end
  end

  def destroy
    @song = @stream.songs.find(params[:id])
    @song.destroy
    redirect_to :back
  end

  def pull_info
    #@song = @stream.songs.find(params[:id])
    @song_info = getSongData("https://s3.amazonaws.com/bouncy-clammy-popcorn/08+Get+Lucky+%28feat.+Pharrell+Williams%29.mp3")
    render :json => @song_info
  end

end
