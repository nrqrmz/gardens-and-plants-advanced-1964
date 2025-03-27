class CompletionsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @completion = Completion.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    chores = Chore.where(id: params[:completion][:chore_id])
    chores.each do |chore|
      @completion = Completion.new
      @completion.plant = @plant
      @completion.chore = chore
      @completion.save!
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def completion_params
    params.require(:completion).permit(:chore_id)
  end
end
