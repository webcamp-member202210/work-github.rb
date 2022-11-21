class Admin::GenresController < ApplicationController
  before_action :admin_signed_in
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
