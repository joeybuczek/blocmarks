class TopicsController < ApplicationController
  def index
    @topics = current_user.topics.all
  end

  def show
    @topic = the_topic
    @bookmarks = @topic.bookmarks.all
  end
  
  def destroy
    @topic = the_topic
    @topic.destroy
    redirect_to topics_path
  end
  
  private
  
  def the_topic
    Topic.find(params[:id])
  end
  
end
