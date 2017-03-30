class UsersController < ApplicationController
  
  before_action :check_logged_in, only: [:edit, :show, :update]
  before_action :check_if_authorized, only: [:edit, :show, :update]
  
  def show
    @user = User.find(params[:id])
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
  end
  
  def new
    @user = User.new
  end

  def create
       @user = User.new user_params
    if @user.save
     log_in @user
      flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      flash[:danger] = "Something went wrong. Please try again."
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash.now[:success] = "Profile updated"
    redirect_to @user
    else
      render 'edit'
  
    end
  end
  
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def check_logged_in
      if current_user.nil?
      flash[:danger] = "Please Signup/Log in first."
      redirect_to root_path
      else
      end
    end 
    
    def check_if_authorized
      @user = User.find_by(id: params[:id])
      if @user == current_user
      else
        redirect_to root_path
        flash[:danger] = "It doesn't seem you are authorized to take this action."
      end
    end
  
end
