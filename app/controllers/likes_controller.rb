class LikesController < ApplicationController
  
  def create
    @bookmark = Bookmark.find(the_bookmark)
    like = current_user.likes.build(bookmark: @bookmark)
    
    authorize like
    if like.save
      redirect_to request.referrer
    else
      flash[:error] = "Sorry mate, but something went wrong."
      redirect_to request.referrer
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(the_bookmark)
    like = current_user.liked(@bookmark)
    
    authorize like
    if like.destroy
      redirect_to request.referrer
    else
      flash[:error] = "Sorry mate, but something went wrong."
      redirect_to request.referrer
    end
  end
  
  private
  
  def the_bookmark
    params[:bookmark_id]
  end
  
end
