class BookmarksController < ApplicationController
  def new
    # @list =  '/lists/:list_id/bookmarks/new'
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    # @movie = bookmark_param[:movie]
    # # @comment = bookmark_param[:comment]
    # @bookmark = Bookmark.new(bookmark_param)
    # @bookmark.list = @List
    # @bookmark.save

    # comment: @comment, movie_id: @movie, list_id: @list

    @bookmark = Bookmark.new

    @params = bookmark_param
    @bookmark.movie_id = @params[:movie]
    @bookmark.comment = @params[:comment]
    @bookmark.list = @list
    @bookmark.save

    redirect_to list_path(@list)
  end

  private

  def bookmark_param
    params.require(:bookmark).permit(:comment, :movie)
  end
end
