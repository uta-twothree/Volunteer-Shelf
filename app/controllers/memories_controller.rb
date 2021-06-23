class MemoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_album, only: [:new, :create, :show]
  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def show
    @memory = @album.memories.find(params[:id])
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def memory_params
    params.require(:memory).permit(:title, :text, :date, images: []).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end
