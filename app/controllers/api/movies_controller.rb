class Api::MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render "index.json.jb"
  end

  def create
    @movie = Movie.new(
                      title: params[:title],
                      rating: params[:rating],
                      synopsis: params[:synopsis]
                      )
    if @movie.save
      render 'show.json.jb'
    else
      render json: {errors: @movie.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title] || @movie.title
    @movie.rating = params[:rating] || @movie.rating
    @movie.synopsis = params[:synopsis] || @movie.synopsis

    if @movie.save
      render 'show.json.jb'
    else
      render json: {errors: @movie.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    render json: {message: "Movie Deleted!"}
  end

end 
