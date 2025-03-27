class PlantsController < ApplicationController
  before_action :set_garden, only: [:create]
  def create
    @plant = Plant.new(plant_params)
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden), status: :see_other
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
