class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  def index
    @albums = Album.all.order('created_at DESC')
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
  end

  private

  def album_params
    params.require(:album).permit(:name, :content, :area_id, :theme_id, :image).merge(user_id: current_user.id)
  end
end
