class MemoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :set_album, only: [:new, :create, :show, :edit, :update]
  before_action :find_memory, only: [:show, :edit, :update]
  before_action :move_to_album_show, only: [:show, :edit, :update]
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
  end

  def edit
  end

  def update
    if @memory.update(memory_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def find_memory
    @memory = @album.memories.find(params[:id])
  end

  def move_to_album_show
    unless current_user.id == @memory.user_id
      redirect_to album_path(@album.id)
    end
  end

  def memory_params
    params.require(:memory).permit(:title, :text, :date, images: []).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end
