class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = the_topic
    @bookmarks = @topic.bookmarks.all
  end
  
  def create
    @topic = current_user.topics.build(params[:topic].permit(:title))
    @topic.save
    redirect_to request.referrer
  end
  
  def destroy
    @topic = the_topic
    authorize @topic
    @topic.destroy
    redirect_to request.referrer
  end
  
  private
  
  def the_topic
    Topic.find(params[:id])
  end
  
end
