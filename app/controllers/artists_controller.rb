class ArtistsController < ApplicationController

  def new # show new artist form
  end

  def create # logic to create new aritst instance
    artist = Artist.new(params.require(:artist).permit(:name, :bio))
    artist.save
    redirect_to artist_path(artist)
  end

  def show  # show specific artist instance
    @artist = Artist.find_by_id(params[:id])
  end

  def edit # shows edit form with values filled in
    @artist = Artist.find_by_id(params[:id])
  end
  
  def update # logic for updating artist instance
    artist = Artist.find_by_id(params[:id])
    artist.update(params.require(:artist).permit(:name, :bio))
    redirect_to artist_path(artist)
  end
end
