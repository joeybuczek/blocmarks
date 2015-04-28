class TopicsController < ApplicationController
  def index
    @topics = current_user.topics.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.all
  end
end
