class ApiRequestsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    posts = current_user.recipes.all
        render json: {status: 'SUCCESS', message: 'Loaded all recipess', data: posts}, status: :ok
  end 
  
end
