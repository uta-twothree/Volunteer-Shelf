class MemoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @album = Album.find(params[:album_id])
    @memory = Memory.new
  end

  def create
    @album = Album.find(params[:album_id])
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def show
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :text, :date, images: []).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end
