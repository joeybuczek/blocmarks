class BookmarksController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params[:bookmark].permit(:url, :title))
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.save
    redirect_to @topic
  end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.update_attributes(params[:bookmark].permit(:url, :title))
    redirect_to @topic
  end
  
  def destroy
    @bookmark = Bookmark.find_by_id(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to request.referrer # redirect back to same page
  end
end
