class StaticPagesController < ApplicationController
  
  before_action :check_logged_in, only: :about
  
  def home 
  end
  
  def about
  end
  
  private

  def check_logged_in
      if current_user.nil?
      flash[:danger] = "Please Signup/Log in first."
      redirect_to root_path
      else
      end
    end 

end
