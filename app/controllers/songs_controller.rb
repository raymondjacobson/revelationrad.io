class SongsController < ApplicationController
	before_filter :stream_owns_song

  def create
  	@song = @stream.songs.new(params[:song])
  	if @song.save
  	else
  		redirect_to 'steams/show'
  end
end
