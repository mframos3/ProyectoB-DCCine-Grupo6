# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    date = params[:date] || Date.today
    @movies = Movie.includes(:movie_shows).where(movie_shows: {date: date})
  end
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :image)
  end
end
