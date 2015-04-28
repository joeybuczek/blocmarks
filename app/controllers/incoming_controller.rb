class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    # Why would this add bookmarks to both test users?
    
    @user = User.find_by_email(the_sender)
    if @user.nil?
#       @user = User.new(
#         name: the_name,
#         email: the_sender,
#         password: "password", # assign initial password for now...
#         password_confirmation: "password"
#       )
#       @user.skip_confirmation! # skip for now...
#       @user.save
      # Send email instructions to new user to change the default password
    end
    
    @topic = @user.topics.find_by_title(the_subject)
    if @topic.nil?
      @topic = @user.topics.build(title: the_subject)
      @topic.save
    end
    
    # @test_bookmark = @topic.bookmarks.find_by_url(the_url)
    @bookmark = @topic.bookmarks.new(url: "name: #{@user.email}, topic: #{@topic.title}, url: #{the_url}")
    @bookmark.save
    
#     if @topic.bookmarks.find_by_url(the_url).nil?
#       # Why is this creating another instance of the bookmark if it already exists?
#       @bookmark = @topic.bookmarks.build(url: the_url)
#       @bookmark.save
#     end
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
    params["body-plain"]
  end
  
end
