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
    @song_info = getSongData("https://dermis.s3.amazonaws.com/play.mp3?AWSAccessKeyId=AKIAIVB4FWYTLOXMCDYA&Expires=1370778793&Signature=U4%2BM8r5lGSXyQ25MweTuCJzcoKs%3D")
    render :json => @song_info
  end

end
