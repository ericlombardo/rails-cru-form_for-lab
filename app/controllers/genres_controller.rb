class GenresController < ApplicationController

  def new # show new genre form
  end

  def create # logic to create genre instance
    genre = Genre.new(params.require(:genre).permit(:name))
    genre.save
    redirect_to genre_path(genre)
  end 

  def show # view for specific genre instance
    @genre = Genre.find_by_id(params[:id])
  end
  
  def edit # show edit genre form
    @genre = Genre.find_by_id(params[:id])
  end
  
  def update # logic to update genre instance
    genre = Genre.find_by_id(params[:id])
    genre.update(params.require(:genre).permit(:name))
    redirect_to genre_path(genre)
  end
end
