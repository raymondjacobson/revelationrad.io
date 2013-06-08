class ApplicationController < ActionController::Base
  protect_from_forgery

  def stream_owns_song
  	@stream = Stream.find(params[:stream_id] || params[:id])
  end

end
