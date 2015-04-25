class IncomingController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    
#     @user = User.where(email: params[:sender])
    puts params
    
  end
  
end