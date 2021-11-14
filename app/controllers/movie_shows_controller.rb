# frozen_string_literal: true

class MovieShowsController < ApplicationController
  def new
    @movie_show = MovieShow.new
  end

  def create
    @movie_show = MovieShow.create(movie_show_params)
    add_seats(@movie_show)
  end

  private

  def movie_show_params
    params.require(:movie_show).permit(:movie_id, :room, :date, :showtime)
  end

  def add_seats(movie_show)
    (0..4).each do |row|
      (0..12).each do |col|
        movie_show.seats.create!({ row: row, col: col })
      end
    end
  end
end
