class MemoriesController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to "albums/show"
    else
      render :new
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :text, :date, images: []).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end
