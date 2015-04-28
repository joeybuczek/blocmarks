class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    @user = User.find_by_email(params[:sender])
    if @user.nil?
      @user = User.new(
        name: params[:from],
        email: params[:sender],
        password: "password", # assign initial password for now...
        password_confirmation: "password"
      )
      @user.skip_confirmation! # skip for now...
      @user.save
    end
    
    @topic = @user.topics.find_by_title(params[:subject])
    if @topic.nil?
      @topic = @user.topics.build(title: params[:subject])
      @topic.save
    end
    
    @bookmark = @topic.bookmarks.build(url: params["body-plain"])
    @bookmark.save
  end
  
end