class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]


  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    new_movie = Movie.new(movie_params)
    new_movie.save
    redirect_to movie_path(new_movie)
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, status: :see_other
  end

private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
