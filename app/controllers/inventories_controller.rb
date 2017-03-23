class InventoriesController < ApplicationController


  def create
    @inventory= current_user.inventory.build(inventory_params)
  end 


                private 
                
                def inventory_params
                  params.require(:inventory).permit!
                end
                
 end