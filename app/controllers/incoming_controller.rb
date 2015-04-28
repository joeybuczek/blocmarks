class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    @user = User.find_by_email(params[:sender])
    @topic = @user.topics.find_by_title(params[:subject])

    if @user.nil?
      @user = User.new(
        name: params[:from],
        email: params[:sender],
        password: "12345678" # assign initial password for now...
      )
      @user.skip_confirmation! # skip for now...
      @user.save
    end
    
    if @topic.nil?
      @topic = @user.topics.build(title: params[:subject])
      @topic.save
    end
    
    @bookmark = @topic.bookmarks.build(url: params["body-plain"])
    @bookmark.save
  end
  
end