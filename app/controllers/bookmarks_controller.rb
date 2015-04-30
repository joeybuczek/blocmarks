class BookmarksController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params[:bookmark].permit(:url, :title))
    @bookmark.save
    redirect_to @topic
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @bookmark = Bookmark.find_by_id(params[:id])
    @bookmark.destroy
    redirect_to request.referrer # redirect back to same page
  end
end
