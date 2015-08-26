class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all.to_a
  end

  def create
    @movie = Movie.create(movie_params)

    if (@movie.valid?)
      flash[:notice] = "Thank you! #{@movie.title} has been added."
      redirect_to new_movie_path
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :genre, :year)
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
