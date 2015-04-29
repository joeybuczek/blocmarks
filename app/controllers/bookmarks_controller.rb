class BookmarksController < ApplicationController
  def destroy
    @bookmark = Bookmark.find_by_id(params[:id])
    @bookmark.destroy
    redirect_to topics_path
  end
end
