class SongsController < ApplicationController

  def index # show list of all songs
    @songs = Song.all
  end
  
  def show # show specific song instance
    @song = Song.find_by_id(params[:id])
  end
  
  def create # logic to create song instance
    @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end
  
  def edit # show song edit form
    @song = Song.find_by_id(params[:id])
  end
  
  def update # logic to update song instance
    song = Song.find_by_id(params[:id])
    song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(song)
  end 
end
