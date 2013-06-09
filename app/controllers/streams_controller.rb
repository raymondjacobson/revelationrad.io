class StreamsController < ApplicationController
  def new
  	@stream = Stream.new
  end
  
  def create
  	@stream = Stream.new(params[:stream])
  	@stream.name = get_unique_name(@stream.id, Stream.all)
  	if @stream.save
  		redirect_to ('/' + @stream.name)
  	else
  		render 'new'
  	end
  end

  def show
  	@stream = Stream.where(:name => params[:words]).first
    @songs = @stream.songs
    @song = @songs.build
  end

  def destroy
  	@stream = Stream.find(params[:id])
  	@stream.destroy
  	redirect_to root_path
  end

end