class MoviesController < ApplicationController
  def new
    @movie = Movie.new()
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.create(movie_params)

    respond_to do |format|
      if @movie.errors.any?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @movie, notice: "High score was successfully created." }
        format.json { render :show, status: :created, location: @movie } 
      end
    end
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :image)
  end
end
