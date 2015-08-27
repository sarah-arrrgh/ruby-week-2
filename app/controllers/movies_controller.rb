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

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if (@movie.update(movie_params))
      flash[:notice] = "Thank you! #{@movie.title} has been updated."
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :genre, :year)
  end
end
