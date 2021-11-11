class MoviesController < ApplicationController
  def new
    @movie = Movie.new()
  end

  def create
    @movie = Movie.create(movie_params)
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :image)
  end
end
