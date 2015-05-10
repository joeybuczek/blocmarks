class UsersController < ApplicationController
  def show
    @user_bookmarks = current_user.bookmarks.all
    @liked_bookmarks = Bookmark.where(id: current_user.likes.pluck(:bookmark_id))
    # @liked_bookmarks = current_user.liked_bookmarks.all
  end
end
