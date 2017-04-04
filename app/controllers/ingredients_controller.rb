class IngredientsController < ApplicationController
  
  before_action :check_logged_in
  before_action :check_if_authorized
  
  private
  
  def check_logged_in
      if current_user.nil?
      flash[:danger] = "Please Signup/Log in first."
      redirect_to root_path
      else
      end
    end 
    
    def check_if_authorized
      @user = User.find_by(id: params[:user_id])
      if @user == current_user
      else
        redirect_to root_path
        flash[:danger] = "It doesn't seem you are authorized to take this action."
      end
    end
  
end
