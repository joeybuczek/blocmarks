class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    @user = User.find_by_email(params[:sender])

    @user.name = "Received"
    @user.save
    
  end
  
end