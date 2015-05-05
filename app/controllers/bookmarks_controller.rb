class BookmarksController < ApplicationController
  
  def new
    @topic = Topic.find(the_topic)
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(the_topic)
    @bookmark = @topic.bookmarks.build(bookmark_params)
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.save
    redirect_to @topic
  end
  
  def edit
    @topic = Topic.find(the_topic)
    @bookmark = Bookmark.find(the_bookmark)
    authorize @bookmark
    
  end
  
  def update
    @topic = Topic.find(the_topic)
    @bookmark = Bookmark.find(the_bookmark)
    authorize @bookmark
    @bookmark.update_attributes(bookmark_params)
    redirect_to @topic
  end
  
  def destroy
    @bookmark = Bookmark.find_by_id(the_bookmark)
    authorize @bookmark
    @bookmark.destroy
    redirect_to request.referrer # redirect back to same page
  end
  
  private
  
  def the_topic
    params[:topic_id]
  end
  
  def the_bookmark
    params[:id]
  end
  
  def bookmark_params
    params[:bookmark].permit(:url, :title)
  end
  
end
