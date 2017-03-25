class StaticPagesController < ApplicationController
  def home 
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
  end
end
