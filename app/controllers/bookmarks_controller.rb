class BookmarksController < ApplicationController
  
  def new

  end
  
  def create

  end
  
  def destroy
    @bookmark = Bookmark.find_by_id(params[:id])
    @bookmark.destroy
    redirect_to request.referrer # redirect back to same page
  end
end
