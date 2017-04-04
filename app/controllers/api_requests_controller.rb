class ApiRequestsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    user = User.find_by(id: params[:user_id])
    posts = user.recipes.all
        render json: {status: 'SUCCESS', message: 'Loaded all recipess', data: posts}, status: :ok
  end 
  
end
