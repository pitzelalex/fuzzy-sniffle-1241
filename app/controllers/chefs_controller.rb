class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def update
    dish = Dish.find(params[:chef][:dish_id])
    dish.update(chef_id: params[:id])
    redirect_to chef_path(Chef.find(params[:id]))
  end

  private

  def chef_id
    params.permit(:id)
  end
end
