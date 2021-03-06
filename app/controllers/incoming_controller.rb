class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    @user = User.find_by_email(the_sender)
    if @user.nil?
      @user = User.new(
        name: the_name,
        email: the_sender,
        password: "password", # assign initial password for now...
        password_confirmation: "password"
      )
      @user.skip_confirmation! # skip for now to pass user story
      @user.save
      # Email instructions to new user to change the default password would be sent here?
    end
    
    # Re-write the below to account for universal topics and also individuals' topics?
    
    @topic = @user.topics.find_by_title(the_subject)
    if @topic.nil?
      @topic = @user.topics.build(title: the_subject)
      @topic.save
    end
    
    @bookmark = @topic.bookmarks.find_by_url(the_url)
    if @bookmark.nil?
      @bookmark = @topic.bookmarks.new(url: the_url, title: the_url, user_id: @user.id)
      @bookmark.user = @user
      @bookmark.save
    end
    
    head 200
  end
  
  private
  
  def the_sender
    params[:sender]
  end
  
  def the_name
    params[:from]
  end
  
  def the_subject
    params[:subject]
  end
  
  def the_url
    params["body-plain"].chomp
  end
  
end
