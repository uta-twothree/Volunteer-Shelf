class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :find_album, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
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
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :content, :area_id, :theme_id, :image).merge(user_id: current_user.id)
  end

  def find_album
    @album = Album.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @album.album_user_ids
      redirect_to action: :index
    end
  end
end
