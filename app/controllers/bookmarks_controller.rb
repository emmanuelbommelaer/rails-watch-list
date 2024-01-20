class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @bookmark = Bookmark.find(params[:id])
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
