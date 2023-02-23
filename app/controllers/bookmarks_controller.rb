class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    #get params
    @list = List.find(params[:list_id])
    #create new Bookmark
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save!
    #redirect to bookmarks page
    redirect_to list_bookmarks_path(params[:list_id])
  end

  def destroy
    #get bookmark(id)
    @bookmark = Bookmark.find(params[:id])
    #destroy
    @bookmark.destroy
    #redirect_to
    redirect_to list_bookmarks_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, photos: [])
  end
end
