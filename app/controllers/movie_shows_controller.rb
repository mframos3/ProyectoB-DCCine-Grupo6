class MovieShowsController < ApplicationController
  def new
    @movie_show = MovieShow.new()
  end

  def show
    @movie_show = MovieShow.find(params[:id])
  end

  def create
    @movie_show = MovieShow.create(movie_show_params)
    
    respond_to do |format|
      if @movie_show.errors.any?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_show.errors, status: :unprocessable_entity }
      else
        add_seats(@movie_show)
        format.html { redirect_to @movie_show, notice: "High score was successfully created." }
        format.json { render :show, status: :created, location: @movie_show } 
      end
    end
  end

  private

  def movie_show_params
    params.require(:movie_show).permit(:movie_id, :room, :date, :showtime)
  end

  def add_seats(movie_show)
    (0.. 4).each do |row|
      (0.. 12).each do |col|
        movie_show.seats.create!({ row: row, col: col })
      end
    end
  end
end
