class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
    @user = User.where(email: params[:sender])
    @user.update_attributes(name: "Received!")
    
  end
  
end